module pipeline_gpu(
    input [31:0] Ins_in,
    input [8:0] Ins_addr_in,
    input [63:0] data0to3,

    input rst,
    input clk
);

//|31----26|25---21|20---16|15---11|10--------0|
//| opcode |  rd   |  rs1  |  rs2  | unused    |


reg [4:0] MEM_WB_addr;

// IF stage

reg [31:0] IF_ID_ins;

wire [31:0] IF_ins;
wire [63:0] PC_DUMMY;
wire [63:0] ONE_DUMMY;
wire [63:0] PC_next_DUMMY;
wire [31:0] Instruction_DUMMY;
wire [63:0] ONE;

PC ProgramCounter(
    .PC_next(PC_next_DUMMY[63:0]), 
    .rst(rst), 
    .PC(PC_DUMMY[63:0])
);
/*PC_MUX Branch_or_Next (
    .BTA(Offset_ID_DUMMY[63:0]), 
    .PC_ctrl(PC_ctrl_DUMMY), 
    .PC_next_in(PC_plus_one_DUMMY[63:0]), 
    .PC_next_out(PC_next_DUMMY[63:0])
);
PC_plus_1 Next (
    .ONE(ONE[63:0]), 
    .PC(PC_DUMMY[63:0]), 
    .PC_next(PC_plus_one_DUMMY[63:0])
);*/
PC_plus_1 Next (
    .ONE(ONE[63:0]), 
    .PC(PC_DUMMY[63:0]), 
    .PC_next(PC_next_DUMMY[63:0])
);
I_MEM MEM_Ins (
    .addra(PC_DUMMY[8:0]), 
    .addrb(Ins_addr_in[8:0]), 
    .clka(clk), 
    .clkb(clk), 
    .dinb(Ins_in[31:0]), 
    .web(Instr_W_en), 
    .douta(Instruction_DUMMY[31:0])
);

always@(posedge clk)begin
    if(rst) begin
        IF_ID_ins<=0;
    end
    else begin
        IF_ID_ins<=IF_ins;
    end
end

//ID_stage

reg [63:0] ID_EXE_data0;
reg [63:0] ID_EXE_data1;
reg [5:0] ID_EXE_opcode;
reg [4:0] ID_EXE_rd;
reg [4:0] ID_EXE_rs;

wire [63:0] ID_data0;
wire [63:0] ID_data1;

// For MAC only
reg [63:0] ID_EXE_data2;
wire [63:0] ID_data2;

RegFile registers(
    .r0addr(IF_ID_ins[20:16]),
    .r1addr(IF_ID_ins[15:11]),
    .waddr(WB_addr),
    .wdata(WB_data),
    .wena(store),
    .clk(clk),
    .rst(rst),
    .r0data(ID_data0),
    .r1data(ID_data1),
    // For MAC only
    .r3addr(IF_ID_ins[25:21]),
    .r2data(ID_data2)
);
always@(posedge clk)begin
    if(rst) begin
        ID_EXE_data0<=64'd0;
        ID_EXE_data1<=64'd0;
        ID_EXE_opcode<=6'd0;
        ID_EXE_rd<=5'd0;
        ID_EXE_rs<=5'd0;
        ID_EXE_data2<=64'd0;
    end
    else begin
        ID_EXE_data0<=ID_data0;
        ID_EXE_data1<=ID_data1;
        ID_EXE_opcode<=IF_ID_ins[31:26];
        ID_EXE_rd<=IF_ID_ins[25:21];
        ID_EXE_rs<=IF_ID_ins[20:16];
        ID_EXE_data2<=ID_data2;
    end
end

//EXE stage

reg [4:0] EXE_MEM_waddr;
reg [63:0] EXE_MEM_wdata;
reg [4:0] EXE_MEM_raddr;
reg [4:0] EXE_MEM_load_to_reg;
reg EXE_MEM_wen;
reg EXE_MEM_ren;

reg EXE_MEM_result;

reg [5:0] EXE_MEM_opcode;

wire [63:0] add;
wire [63:0] sub;
wire [63:0] mult;
wire [63:0] mac;
wire [63:0] ReLU;
wire [1:0] sub_sig = (ID_EXE_opcode[1] & ~ID_EXE_opcode[0]);

BF16_Mult multbf16(
    .data0(ID_EXE_data0),
    .data1(ID_EXE_data1),
    .product(mult)
);

BF16_MAC MACbf16(
    .data0(ID_EXE_data0),
    .data1(ID_EXE_data1),
    .data2(ID_EXE_data2),
    .product(mac)
);

Vec_add add_sub(
    .A(ID_EXE_data0),
    .B(ID_EXE_data1),
    .sub(sub_sig),
    .C(add)
);

ReLU comp(
    .A(ID_EXE_data0),
    .C(ReLU)
);

always@(posedge clk)begin
    if(rst) begin
        EXE_MEM_waddr<=0;
        EXE_MEM_wdata<=0;
        EXE_MEM_raddr<=0;
        EXE_MEM_load_to_reg<=0;
        EXE_MEM_wen<=0;
        EXE_MEM_ren<=0;
        EXE_MEM_opcode<=0;
        EXE_MEM_result<=0;
    end
    else begin
        case(ID_EXE_opcode)
            6'b100000:begin //Store
                        EXE_MEM_wen<=1'b1;
                        EXE_MEM_waddr<=ID_EXE_rd;
                        EXE_MEM_wdata<=ID_EXE_data0;
                        EXE_MEM_opcode<=ID_EXE_opcode;
                    end
            6'b100001:begin //Load
                        EXE_MEM_ren<=1'b1;
                        EXE_MEM_raddr<=ID_EXE_rd;
                        EXE_MEM_load_to_reg<=ID_EXE_rs;
                        EXE_MEM_opcode<=ID_EXE_opcode;
                    end
            6'b000001:begin //Vector Addition
                        EXE_MEM_result<=add;
                        EXE_MEM_opcode<=ID_EXE_opcode;
                    end
            6'b000010:begin //Vector Subtraction
                        EXE_MEM_result<=sub;
                        EXE_MEM_opcode<=ID_EXE_opcode;
                    end
            6'b000011:begin //BFloat Multiply
                        EXE_MEM_result<=mult;
                        EXE_MEM_opcode<=ID_EXE_opcode;
                    end
            6'b000100:begin //BFloat MAC
                        EXE_MEM_result<=mac;
                        EXE_MEM_opcode<=ID_EXE_opcode;
                    end
            6'b000101:begin //ReLU
                        EXE_MEM_result<=ReLU;
                        EXE_MEM_opcode<=ID_EXE_opcode;
                    end
            default: EXE_MEM_opcode<=ID_EXE_opcode;
        endcase
    end
end
//MEM stage

reg [63:0] MEM_WB_data;
reg [63:0] MEM_WB_result;
reg [4:0] MEM_WB_load_to_reg;
reg [5:0] MEM_WB_opcode;

wire [63:0] MEM_data;

D_MEM datamemory (
    .addra(EXE_MEM_waddr), 
    .addrb(EXE_MEM_raddr), 
    .clka(clk), 
    .clkb(clk), 
    .dina(EXE_MEM_wdata), 
    .wea(XE_MEM_wen), 
    .enb(EXE_MEM_ren),
    .doutb(MEM_data)
);

always@(posedge clk)begin
    if(rst)begin
        MEM_WB_data<=0;
        MEM_WB_result<=0;
        MEM_WB_load_to_reg<=0;
        MEM_WB_opcode<=0;
    end
    else begin
        MEM_WB_data<=MEM_data;
        MEM_WB_result<=EXE_MEM_result;
        MEM_WB_load_to_reg<=EXE_MEM_load_to_reg;
        MEM_WB_opcode<=EXE_MEM_opcode;
    end
end
//WB stage

wire [63:0] WB_data;
wire store;
wire [4:0] WB_addr;

assign WB_data = (MEM_WB_opcode[5] && MEM_WB_opcode[0])? MEM_WB_data : MEM_WB_result;
assign WB_addr = MEM_WB_load_to_reg;
assign store = (MEM_WB_opcode[5] && MEM_WB_opcode[0])? 1'b1 : 
               (MEM_WB_opcode[5] && !MEM_WB_opcode[0]) ? MEM_WB_result :
               1'b1;

/*always@(posedge clk)begin
    if(MEM_WB_opcode[5] && MEM_WB_opcode[0])begin
        WB_data<=MEM_WB_data;
        WB_addr<=MEM_WB_load_to_reg;
        store<=1;
    end
    else if(MEM_WB_opcode[5] && !MEM_WB_opcode[0])begin
        store<=0;
    end
    else begin
        WB_data<=MEM_WB_result;
        WB_addr<=MEM_WB_load_to_reg;
        store<=1;
    end
end*/

endmodule
