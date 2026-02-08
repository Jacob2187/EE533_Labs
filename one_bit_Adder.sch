VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "spartan3a"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL XLXN_1
        SIGNAL XLXN_2
        SIGNAL XLXN_3
        SIGNAL XLXN_4
        SIGNAL A
        SIGNAL B
        SIGNAL C
        SIGNAL S
        SIGNAL CO
        PORT Input A
        PORT Input B
        PORT Input C
        PORT Output S
        PORT Output CO
        BEGIN BLOCKDEF xor2
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -64 64 -64 
            LINE N 0 -128 60 -128 
            LINE N 256 -96 208 -96 
            ARC N -40 -152 72 -40 48 -48 44 -144 
            ARC N -24 -152 88 -40 64 -48 64 -144 
            LINE N 128 -144 64 -144 
            LINE N 128 -48 64 -48 
            ARC N 44 -144 220 32 208 -96 128 -144 
            ARC N 44 -224 220 -48 128 -48 208 -96 
        END BLOCKDEF
        BEGIN BLOCKDEF and2
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -64 64 -64 
            LINE N 0 -128 64 -128 
            LINE N 256 -96 192 -96 
            ARC N 96 -144 192 -48 144 -48 144 -144 
            LINE N 144 -48 64 -48 
            LINE N 64 -144 144 -144 
            LINE N 64 -48 64 -144 
        END BLOCKDEF
        BEGIN BLOCKDEF or3
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -64 48 -64 
            LINE N 0 -128 72 -128 
            LINE N 0 -192 48 -192 
            LINE N 256 -128 192 -128 
            ARC N 28 -256 204 -80 112 -80 192 -128 
            ARC N -40 -184 72 -72 48 -80 48 -176 
            LINE N 48 -64 48 -80 
            LINE N 48 -192 48 -176 
            LINE N 112 -80 48 -80 
            ARC N 28 -176 204 0 192 -128 112 -176 
            LINE N 112 -176 48 -176 
        END BLOCKDEF
        BEGIN BLOCK XLXI_1 xor2
            PIN I0 B
            PIN I1 A
            PIN O XLXN_1
        END BLOCK
        BEGIN BLOCK XLXI_2 xor2
            PIN I0 C
            PIN I1 XLXN_1
            PIN O S
        END BLOCK
        BEGIN BLOCK XLXI_3 and2
            PIN I0 B
            PIN I1 A
            PIN O XLXN_2
        END BLOCK
        BEGIN BLOCK XLXI_4 and2
            PIN I0 C
            PIN I1 A
            PIN O XLXN_3
        END BLOCK
        BEGIN BLOCK XLXI_5 and2
            PIN I0 C
            PIN I1 B
            PIN O XLXN_4
        END BLOCK
        BEGIN BLOCK XLXI_6 or3
            PIN I0 XLXN_4
            PIN I1 XLXN_3
            PIN I2 XLXN_2
            PIN O CO
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        INSTANCE XLXI_1 1376 1008 R0
        INSTANCE XLXI_2 2112 1088 R0
        INSTANCE XLXI_3 1344 1392 R0
        INSTANCE XLXI_4 1344 1600 R0
        INSTANCE XLXI_5 1344 1776 R0
        INSTANCE XLXI_6 2064 1616 R0
        BEGIN BRANCH XLXN_1
            WIRE 1632 912 1872 912
            WIRE 1872 912 1872 960
            WIRE 1872 960 2112 960
        END BRANCH
        BEGIN BRANCH XLXN_2
            WIRE 1600 1296 2064 1296
            WIRE 2064 1296 2064 1424
        END BRANCH
        BEGIN BRANCH XLXN_3
            WIRE 1600 1504 1824 1504
            WIRE 1824 1488 1824 1504
            WIRE 1824 1488 2064 1488
        END BRANCH
        BEGIN BRANCH XLXN_4
            WIRE 1600 1680 2064 1680
            WIRE 2064 1552 2064 1680
        END BRANCH
        BEGIN BRANCH A
            WIRE 1104 880 1216 880
            WIRE 1216 880 1376 880
            WIRE 1216 880 1216 1264
            WIRE 1216 1264 1296 1264
            WIRE 1296 1264 1344 1264
            WIRE 1296 1264 1296 1472
            WIRE 1296 1472 1344 1472
        END BRANCH
        BEGIN BRANCH B
            WIRE 1104 944 1232 944
            WIRE 1232 944 1376 944
            WIRE 1232 944 1232 1328
            WIRE 1232 1328 1344 1328
            WIRE 1232 1328 1232 1648
            WIRE 1232 1648 1344 1648
        END BRANCH
        BEGIN BRANCH C
            WIRE 1104 1024 1264 1024
            WIRE 1264 1024 2112 1024
            WIRE 1264 1024 1264 1536
            WIRE 1264 1536 1344 1536
            WIRE 1264 1536 1264 1712
            WIRE 1264 1712 1344 1712
        END BRANCH
        BEGIN BRANCH S
            WIRE 2368 992 2640 992
        END BRANCH
        BEGIN BRANCH CO
            WIRE 2320 1488 2640 1488
        END BRANCH
        IOMARKER 1104 880 A R180 28
        IOMARKER 1104 944 B R180 28
        IOMARKER 1104 1024 C R180 28
        IOMARKER 2640 992 S R0 28
        IOMARKER 2640 1488 CO R0 28
    END SHEET
END SCHEMATIC
