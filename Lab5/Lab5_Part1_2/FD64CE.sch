VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "virtex2p"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL d(63:0)
        SIGNAL q(63:0)
        SIGNAL d(15:0)
        SIGNAL d(31:16)
        SIGNAL d(47:32)
        SIGNAL d(63:48)
        SIGNAL q(15:0)
        SIGNAL q(31:16)
        SIGNAL q(47:32)
        SIGNAL q(63:48)
        SIGNAL CE
        SIGNAL clk
        SIGNAL clr
        PORT Input d(63:0)
        PORT Output q(63:0)
        PORT Input CE
        PORT Input clk
        PORT Input clr
        BEGIN BLOCKDEF fd16ce
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -128 64 -128 
            LINE N 0 -192 64 -192 
            LINE N 0 -32 64 -32 
            LINE N 0 -256 64 -256 
            LINE N 384 -256 320 -256 
            LINE N 80 -128 64 -144 
            LINE N 64 -112 80 -128 
            RECTANGLE N 320 -268 384 -244 
            RECTANGLE N 0 -268 64 -244 
            LINE N 192 -32 64 -32 
            LINE N 192 -64 192 -32 
            RECTANGLE N 64 -320 320 -64 
        END BLOCKDEF
        BEGIN BLOCK XLXI_2 fd16ce
            PIN C clk
            PIN CE CE
            PIN CLR clr
            PIN D(15:0) d(47:32)
            PIN Q(15:0) q(47:32)
        END BLOCK
        BEGIN BLOCK XLXI_3 fd16ce
            PIN C clk
            PIN CE CE
            PIN CLR clr
            PIN D(15:0) d(31:16)
            PIN Q(15:0) q(31:16)
        END BLOCK
        BEGIN BLOCK XLXI_4 fd16ce
            PIN C clk
            PIN CE CE
            PIN CLR clr
            PIN D(15:0) d(15:0)
            PIN Q(15:0) q(15:0)
        END BLOCK
        BEGIN BLOCK XLXI_6 fd16ce
            PIN C clk
            PIN CE CE
            PIN CLR clr
            PIN D(15:0) d(63:48)
            PIN Q(15:0) q(63:48)
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        INSTANCE XLXI_2 1872 1456 R0
        INSTANCE XLXI_3 1872 1856 R0
        INSTANCE XLXI_4 1872 2240 R0
        BEGIN BRANCH d(63:0)
            WIRE 1200 2448 1552 2448
        END BRANCH
        BEGIN BRANCH q(63:0)
            WIRE 1776 2448 2080 2448
        END BRANCH
        BEGIN BRANCH d(15:0)
            WIRE 1440 1984 1872 1984
            BEGIN DISPLAY 1440 1984 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH d(31:16)
            WIRE 1440 1600 1872 1600
            BEGIN DISPLAY 1440 1600 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH d(47:32)
            WIRE 1424 1200 1872 1200
            BEGIN DISPLAY 1424 1200 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH d(63:48)
            WIRE 1424 768 1872 768
            BEGIN DISPLAY 1424 768 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH q(15:0)
            WIRE 2256 1984 2576 1984
            BEGIN DISPLAY 2576 1984 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH q(31:16)
            WIRE 2256 1600 2576 1600
            BEGIN DISPLAY 2576 1600 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH q(47:32)
            WIRE 2256 1200 2576 1200
            BEGIN DISPLAY 2576 1200 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH q(63:48)
            WIRE 2256 768 2576 768
            BEGIN DISPLAY 2576 768 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_6 1872 1024 R0
        IOMARKER 1200 2448 d(63:0) R180 28
        IOMARKER 2080 2448 q(63:0) R0 28
        BEGIN BRANCH CE
            WIRE 1232 2048 1488 2048
            WIRE 1488 2048 1872 2048
            WIRE 1488 832 1872 832
            WIRE 1488 832 1488 1264
            WIRE 1488 1264 1872 1264
            WIRE 1488 1264 1488 1664
            WIRE 1488 1664 1488 2048
            WIRE 1488 1664 1872 1664
        END BRANCH
        BEGIN BRANCH clk
            WIRE 1232 2112 1680 2112
            WIRE 1680 2112 1872 2112
            WIRE 1680 896 1872 896
            WIRE 1680 896 1680 1328
            WIRE 1680 1328 1872 1328
            WIRE 1680 1328 1680 1728
            WIRE 1680 1728 1680 2112
            WIRE 1680 1728 1872 1728
        END BRANCH
        BEGIN BRANCH clr
            WIRE 1232 2208 1792 2208
            WIRE 1792 2208 1872 2208
            WIRE 1792 992 1872 992
            WIRE 1792 992 1792 1424
            WIRE 1792 1424 1872 1424
            WIRE 1792 1424 1792 1824
            WIRE 1792 1824 1792 2208
            WIRE 1792 1824 1872 1824
        END BRANCH
        IOMARKER 1232 2048 CE R180 28
        IOMARKER 1232 2112 clk R180 28
        IOMARKER 1232 2208 clr R180 28
    END SHEET
END SCHEMATIC
