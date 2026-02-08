VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "spartan3a"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL A0
        SIGNAL B0
        SIGNAL Cin
        SIGNAL A1
        SIGNAL B1
        SIGNAL XLXN_6
        SIGNAL A2
        SIGNAL B2
        SIGNAL XLXN_9
        SIGNAL A3
        SIGNAL B3
        SIGNAL XLXN_12
        SIGNAL A4
        SIGNAL B4
        SIGNAL XLXN_15
        SIGNAL A5
        SIGNAL B5
        SIGNAL XLXN_18
        SIGNAL A6
        SIGNAL B6
        SIGNAL XLXN_21
        SIGNAL A7
        SIGNAL B7
        SIGNAL XLXN_24
        SIGNAL Cout
        SIGNAL S7
        SIGNAL S6
        SIGNAL S5
        SIGNAL S4
        SIGNAL S3
        SIGNAL S2
        SIGNAL S1
        SIGNAL S0
        PORT Input A0
        PORT Input B0
        PORT Input Cin
        PORT Input A1
        PORT Input B1
        PORT Input A2
        PORT Input B2
        PORT Input A3
        PORT Input B3
        PORT Input A4
        PORT Input B4
        PORT Input A5
        PORT Input B5
        PORT Input A6
        PORT Input B6
        PORT Input A7
        PORT Input B7
        PORT Output Cout
        PORT Output S7
        PORT Output S6
        PORT Output S5
        PORT Output S4
        PORT Output S3
        PORT Output S2
        PORT Output S1
        PORT Output S0
        BEGIN BLOCKDEF one_bit_Adder
            TIMESTAMP 2026 1 25 4 42 15
            RECTANGLE N 64 -192 320 0 
            LINE N 64 -160 0 -160 
            LINE N 64 -96 0 -96 
            LINE N 64 -32 0 -32 
            LINE N 320 -96 384 -96 
            LINE N 320 -160 384 -160 
        END BLOCKDEF
        BEGIN BLOCK XLXI_9 one_bit_Adder
            PIN A A0
            PIN B B0
            PIN C Cin
            PIN CO XLXN_6
            PIN S S0
        END BLOCK
        BEGIN BLOCK XLXI_10 one_bit_Adder
            PIN A A1
            PIN B B1
            PIN C XLXN_6
            PIN CO XLXN_9
            PIN S S1
        END BLOCK
        BEGIN BLOCK XLXI_11 one_bit_Adder
            PIN A A2
            PIN B B2
            PIN C XLXN_9
            PIN CO XLXN_12
            PIN S S2
        END BLOCK
        BEGIN BLOCK XLXI_12 one_bit_Adder
            PIN A A3
            PIN B B3
            PIN C XLXN_12
            PIN CO XLXN_15
            PIN S S3
        END BLOCK
        BEGIN BLOCK XLXI_13 one_bit_Adder
            PIN A A4
            PIN B B4
            PIN C XLXN_15
            PIN CO XLXN_18
            PIN S S4
        END BLOCK
        BEGIN BLOCK XLXI_14 one_bit_Adder
            PIN A A5
            PIN B B5
            PIN C XLXN_18
            PIN CO XLXN_21
            PIN S S5
        END BLOCK
        BEGIN BLOCK XLXI_15 one_bit_Adder
            PIN A A6
            PIN B B6
            PIN C XLXN_21
            PIN CO XLXN_24
            PIN S S6
        END BLOCK
        BEGIN BLOCK XLXI_16 one_bit_Adder
            PIN A A7
            PIN B B7
            PIN C XLXN_24
            PIN CO Cout
            PIN S S7
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        BEGIN INSTANCE XLXI_12 1984 1216 R90
        END INSTANCE
        BEGIN INSTANCE XLXI_13 1712 1216 R90
        END INSTANCE
        BEGIN INSTANCE XLXI_14 1376 1216 R90
        END INSTANCE
        BEGIN INSTANCE XLXI_15 1040 1216 R90
        END INSTANCE
        BEGIN INSTANCE XLXI_16 704 1216 R90
        END INSTANCE
        BEGIN INSTANCE XLXI_9 2928 1216 R90
        END INSTANCE
        BEGIN INSTANCE XLXI_10 2624 1216 R90
        END INSTANCE
        BEGIN INSTANCE XLXI_11 2320 1216 R90
        END INSTANCE
        BEGIN BRANCH A0
            WIRE 3088 1088 3088 1216
        END BRANCH
        BEGIN BRANCH B0
            WIRE 3024 1088 3024 1216
        END BRANCH
        BEGIN BRANCH Cin
            WIRE 2960 1088 2960 1216
        END BRANCH
        BEGIN BRANCH A1
            WIRE 2784 1088 2784 1216
        END BRANCH
        BEGIN BRANCH B1
            WIRE 2720 1088 2720 1216
        END BRANCH
        BEGIN BRANCH XLXN_6
            WIRE 2544 1088 2656 1088
            WIRE 2656 1088 2656 1216
            WIRE 2544 1088 2544 1680
            WIRE 2544 1680 3024 1680
            WIRE 3024 1600 3024 1680
        END BRANCH
        BEGIN BRANCH A2
            WIRE 2480 1104 2480 1216
        END BRANCH
        BEGIN BRANCH B2
            WIRE 2416 1104 2416 1216
        END BRANCH
        BEGIN BRANCH XLXN_9
            WIRE 2240 1104 2352 1104
            WIRE 2352 1104 2352 1216
            WIRE 2240 1104 2240 1664
            WIRE 2240 1664 2720 1664
            WIRE 2720 1600 2720 1664
        END BRANCH
        BEGIN BRANCH A3
            WIRE 2144 1104 2144 1216
        END BRANCH
        BEGIN BRANCH B3
            WIRE 2080 1088 2080 1216
        END BRANCH
        BEGIN BRANCH XLXN_12
            WIRE 1920 1104 2016 1104
            WIRE 2016 1104 2016 1216
            WIRE 1920 1104 1920 1648
            WIRE 1920 1648 2416 1648
            WIRE 2416 1600 2416 1648
        END BRANCH
        BEGIN BRANCH A4
            WIRE 1872 1104 1872 1216
        END BRANCH
        BEGIN BRANCH B4
            WIRE 1808 1104 1808 1216
        END BRANCH
        BEGIN BRANCH XLXN_15
            WIRE 1632 1104 1744 1104
            WIRE 1744 1104 1744 1216
            WIRE 1632 1104 1632 1680
            WIRE 1632 1680 2080 1680
            WIRE 2080 1600 2080 1680
        END BRANCH
        BEGIN BRANCH A5
            WIRE 1536 1104 1536 1216
        END BRANCH
        BEGIN BRANCH B5
            WIRE 1472 1104 1472 1216
        END BRANCH
        BEGIN BRANCH XLXN_18
            WIRE 1296 1104 1408 1104
            WIRE 1408 1104 1408 1216
            WIRE 1296 1104 1296 1664
            WIRE 1296 1664 1808 1664
            WIRE 1808 1600 1808 1664
        END BRANCH
        BEGIN BRANCH A6
            WIRE 1200 1104 1200 1216
        END BRANCH
        BEGIN BRANCH B6
            WIRE 1136 1104 1136 1216
        END BRANCH
        BEGIN BRANCH XLXN_21
            WIRE 976 1104 1072 1104
            WIRE 1072 1104 1072 1216
            WIRE 976 1104 976 1680
            WIRE 976 1680 1472 1680
            WIRE 1472 1600 1472 1680
        END BRANCH
        BEGIN BRANCH A7
            WIRE 864 1104 864 1216
        END BRANCH
        BEGIN BRANCH B7
            WIRE 800 1088 800 1216
        END BRANCH
        BEGIN BRANCH XLXN_24
            WIRE 640 1104 736 1104
            WIRE 736 1104 736 1216
            WIRE 640 1104 640 1664
            WIRE 640 1664 1136 1664
            WIRE 1136 1600 1136 1664
        END BRANCH
        BEGIN BRANCH Cout
            WIRE 800 1600 800 1616
            WIRE 800 1616 800 1872
        END BRANCH
        BEGIN BRANCH S7
            WIRE 864 1600 864 1616
            WIRE 864 1616 864 1888
        END BRANCH
        BEGIN BRANCH S6
            WIRE 1200 1600 1200 1616
            WIRE 1200 1616 1200 1888
        END BRANCH
        BEGIN BRANCH S5
            WIRE 1536 1600 1536 1616
            WIRE 1536 1616 1536 1888
        END BRANCH
        BEGIN BRANCH S4
            WIRE 1872 1600 1872 1616
            WIRE 1872 1616 1872 1888
        END BRANCH
        BEGIN BRANCH S3
            WIRE 2144 1600 2144 1616
            WIRE 2144 1616 2144 1888
        END BRANCH
        BEGIN BRANCH S2
            WIRE 2480 1600 2480 1616
            WIRE 2480 1616 2480 1888
        END BRANCH
        BEGIN BRANCH S1
            WIRE 2784 1600 2784 1616
            WIRE 2784 1616 2784 1888
        END BRANCH
        IOMARKER 3088 1088 A0 R270 28
        IOMARKER 3024 1088 B0 R270 28
        IOMARKER 2960 1088 Cin R270 28
        IOMARKER 2784 1088 A1 R270 28
        IOMARKER 2720 1088 B1 R270 28
        IOMARKER 2480 1104 A2 R270 28
        IOMARKER 2416 1104 B2 R270 28
        IOMARKER 2144 1104 A3 R270 28
        IOMARKER 2080 1088 B3 R270 28
        IOMARKER 1872 1104 A4 R270 28
        IOMARKER 1808 1104 B4 R270 28
        IOMARKER 1536 1104 A5 R270 28
        IOMARKER 1472 1104 B5 R270 28
        IOMARKER 1200 1104 A6 R270 28
        IOMARKER 1136 1104 B6 R270 28
        IOMARKER 864 1104 A7 R270 28
        IOMARKER 800 1088 B7 R270 28
        BEGIN BRANCH S0
            WIRE 3088 1600 3088 1616
            WIRE 3088 1616 3088 1888
        END BRANCH
        IOMARKER 800 1872 Cout R90 28
        IOMARKER 864 1888 S7 R90 28
        IOMARKER 1200 1888 S6 R90 28
        IOMARKER 1536 1888 S5 R90 28
        IOMARKER 1872 1888 S4 R90 28
        IOMARKER 2144 1888 S3 R90 28
        IOMARKER 2480 1888 S2 R90 28
        IOMARKER 2784 1888 S1 R90 28
        IOMARKER 3088 1888 S0 R90 28
    END SHEET
END SCHEMATIC
