VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "virtex2p"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL D(15:0)
        SIGNAL A(3:0)
        SIGNAL E
        SIGNAL A(0)
        SIGNAL A(1)
        SIGNAL A(2)
        SIGNAL A(3)
        SIGNAL D(0)
        SIGNAL D(1)
        SIGNAL D(2)
        SIGNAL D(3)
        SIGNAL D(4)
        SIGNAL D(5)
        SIGNAL D(6)
        SIGNAL D(7)
        SIGNAL D(8)
        SIGNAL D(9)
        SIGNAL D(10)
        SIGNAL D(11)
        SIGNAL D(12)
        SIGNAL D(13)
        SIGNAL D(14)
        SIGNAL D(15)
        PORT Output D(15:0)
        PORT Input A(3:0)
        PORT Input E
        BEGIN BLOCKDEF d4_16e
            TIMESTAMP 2000 1 1 10 10 10
            RECTANGLE N 64 -1152 320 -64 
            LINE N 384 -1088 320 -1088 
            LINE N 384 -1024 320 -1024 
            LINE N 384 -960 320 -960 
            LINE N 384 -896 320 -896 
            LINE N 384 -832 320 -832 
            LINE N 384 -768 320 -768 
            LINE N 384 -704 320 -704 
            LINE N 384 -640 320 -640 
            LINE N 384 -576 320 -576 
            LINE N 384 -512 320 -512 
            LINE N 384 -448 320 -448 
            LINE N 384 -384 320 -384 
            LINE N 384 -320 320 -320 
            LINE N 384 -256 320 -256 
            LINE N 384 -192 320 -192 
            LINE N 384 -128 320 -128 
            LINE N 0 -896 64 -896 
            LINE N 0 -960 64 -960 
            LINE N 0 -1024 64 -1024 
            LINE N 0 -1088 64 -1088 
            LINE N 0 -128 64 -128 
        END BLOCKDEF
        BEGIN BLOCK XLXI_2 d4_16e
            PIN A0 A(0)
            PIN A1 A(1)
            PIN A2 A(2)
            PIN A3 A(3)
            PIN E E
            PIN D0 D(0)
            PIN D1 D(1)
            PIN D10 D(10)
            PIN D11 D(11)
            PIN D12 D(12)
            PIN D13 D(13)
            PIN D14 D(14)
            PIN D15 D(15)
            PIN D2 D(2)
            PIN D3 D(3)
            PIN D4 D(4)
            PIN D5 D(5)
            PIN D6 D(6)
            PIN D7 D(7)
            PIN D8 D(8)
            PIN D9 D(9)
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        INSTANCE XLXI_2 1392 1760 R0
        BEGIN BRANCH D(15:0)
            WIRE 1808 1920 2032 1920
        END BRANCH
        BEGIN BRANCH A(3:0)
            WIRE 1104 1920 1296 1920
        END BRANCH
        BEGIN BRANCH E
            WIRE 1248 1632 1392 1632
        END BRANCH
        IOMARKER 1104 1920 A(3:0) R180 28
        IOMARKER 2032 1920 D(15:0) R0 28
        BEGIN BRANCH A(0)
            WIRE 1280 672 1392 672
            BEGIN DISPLAY 1280 672 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(1)
            WIRE 1280 736 1392 736
            BEGIN DISPLAY 1280 736 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(2)
            WIRE 1280 800 1392 800
            BEGIN DISPLAY 1280 800 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(3)
            WIRE 1280 864 1392 864
            BEGIN DISPLAY 1280 864 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        IOMARKER 1248 1632 E R180 28
        BEGIN BRANCH D(0)
            WIRE 1776 672 1888 672
            BEGIN DISPLAY 1888 672 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH D(1)
            WIRE 1776 736 1904 736
            BEGIN DISPLAY 1904 736 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH D(2)
            WIRE 1776 800 1904 800
            BEGIN DISPLAY 1904 800 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH D(3)
            WIRE 1776 864 1904 864
            BEGIN DISPLAY 1904 864 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH D(4)
            WIRE 1776 928 1904 928
            BEGIN DISPLAY 1904 928 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH D(5)
            WIRE 1776 992 1904 992
            BEGIN DISPLAY 1904 992 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH D(6)
            WIRE 1776 1056 1904 1056
            BEGIN DISPLAY 1904 1056 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH D(7)
            WIRE 1776 1120 1904 1120
            BEGIN DISPLAY 1904 1120 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH D(8)
            WIRE 1776 1184 1904 1184
            BEGIN DISPLAY 1904 1184 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH D(9)
            WIRE 1776 1248 1920 1248
            BEGIN DISPLAY 1920 1248 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH D(10)
            WIRE 1776 1312 1920 1312
            BEGIN DISPLAY 1920 1312 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH D(11)
            WIRE 1776 1376 1936 1376
            BEGIN DISPLAY 1936 1376 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH D(12)
            WIRE 1776 1440 1824 1440
            BEGIN DISPLAY 1824 1440 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH D(13)
            WIRE 1776 1504 1904 1504
            BEGIN DISPLAY 1904 1504 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH D(14)
            WIRE 1776 1568 1904 1568
            BEGIN DISPLAY 1904 1568 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH D(15)
            WIRE 1776 1632 1920 1632
            BEGIN DISPLAY 1920 1632 ATTR Name
                ALIGNMENT SOFT-LEFT
            END DISPLAY
        END BRANCH
    END SHEET
END SCHEMATIC
