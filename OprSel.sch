VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "spartan3a"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL Bm
        SIGNAL XLXN_2
        SIGNAL B
        SIGNAL Enable
        SIGNAL Opr1
        SIGNAL A
        SIGNAL Opr0
        PORT Output Bm
        PORT Input B
        PORT Input Enable
        PORT Input Opr1
        PORT Input A
        PORT Input Opr0
        BEGIN BLOCKDEF m4_1e
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -416 96 -416 
            LINE N 0 -352 96 -352 
            LINE N 0 -288 96 -288 
            LINE N 0 -224 96 -224 
            LINE N 0 -32 96 -32 
            LINE N 320 -320 256 -320 
            LINE N 0 -160 96 -160 
            LINE N 0 -96 96 -96 
            LINE N 176 -96 96 -96 
            LINE N 176 -208 176 -96 
            LINE N 224 -32 96 -32 
            LINE N 224 -216 224 -32 
            LINE N 256 -224 96 -192 
            LINE N 256 -416 256 -224 
            LINE N 96 -448 256 -416 
            LINE N 96 -192 96 -448 
            LINE N 128 -160 96 -160 
            LINE N 128 -200 128 -160 
        END BLOCKDEF
        BEGIN BLOCKDEF inv
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -32 64 -32 
            LINE N 224 -32 160 -32 
            LINE N 64 -64 128 -32 
            LINE N 128 -32 64 0 
            LINE N 64 0 64 -64 
            CIRCLE N 128 -48 160 -16 
        END BLOCKDEF
        BEGIN BLOCK XLXI_2 m4_1e
            PIN D0 B
            PIN D1 A
            PIN D2 XLXN_2
            PIN D3 XLXN_2
            PIN E Enable
            PIN S0 Opr0
            PIN S1 Opr1
            PIN O Bm
        END BLOCK
        BEGIN BLOCK XLXI_3 inv
            PIN I B
            PIN O XLXN_2
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        INSTANCE XLXI_2 1440 1472 R90
        BEGIN BRANCH Bm
            WIRE 1760 1792 1760 1824
        END BRANCH
        IOMARKER 1760 1824 Bm R90 28
        INSTANCE XLXI_3 1696 896 R90
        BEGIN BRANCH XLXN_2
            WIRE 1664 1376 1728 1376
            WIRE 1728 1376 1728 1472
            WIRE 1664 1376 1664 1472
            WIRE 1728 1120 1728 1376
        END BRANCH
        BEGIN BRANCH B
            WIRE 1728 784 1728 880
            WIRE 1728 880 1728 896
            WIRE 1728 880 1856 880
            WIRE 1856 880 1856 1472
        END BRANCH
        BEGIN BRANCH Enable
            WIRE 1440 1472 1472 1472
        END BRANCH
        IOMARKER 1440 1472 Enable R270 28
        BEGIN BRANCH Opr1
            WIRE 1536 1440 1536 1472
        END BRANCH
        IOMARKER 1536 1440 Opr1 R270 28
        IOMARKER 1728 784 B R270 28
        BEGIN BRANCH A
            WIRE 1792 1440 1792 1472
        END BRANCH
        IOMARKER 1792 1440 A R270 28
        BEGIN BRANCH Opr0
            WIRE 1600 1440 1600 1472
        END BRANCH
        IOMARKER 1600 1440 Opr0 R270 28
    END SHEET
END SCHEMATIC
