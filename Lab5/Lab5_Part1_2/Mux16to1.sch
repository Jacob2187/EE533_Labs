VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "virtex2p"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL D0
        SIGNAL D1
        SIGNAL D2
        SIGNAL D3
        SIGNAL D4
        SIGNAL D5
        SIGNAL D6
        SIGNAL D7
        SIGNAL D8
        SIGNAL D9
        SIGNAL D10
        SIGNAL D11
        SIGNAL D12
        SIGNAL D13
        SIGNAL D14
        SIGNAL D15
        SIGNAL S0
        SIGNAL S1
        SIGNAL S2
        SIGNAL S3
        SIGNAL E
        SIGNAL O
        PORT Input D0
        PORT Input D1
        PORT Input D2
        PORT Input D3
        PORT Input D4
        PORT Input D5
        PORT Input D6
        PORT Input D7
        PORT Input D8
        PORT Input D9
        PORT Input D10
        PORT Input D11
        PORT Input D12
        PORT Input D13
        PORT Input D14
        PORT Input D15
        PORT Input S0
        PORT Input S1
        PORT Input S2
        PORT Input S3
        PORT Input E
        PORT Output O
        BEGIN BLOCKDEF m16_1e
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -288 96 -288 
            LINE N 0 -96 96 -96 
            LINE N 0 -160 96 -160 
            LINE N 0 -224 96 -224 
            LINE N 0 -1312 96 -1312 
            LINE N 0 -352 96 -352 
            LINE N 0 -1248 96 -1248 
            LINE N 0 -416 96 -416 
            LINE N 0 -480 96 -480 
            LINE N 0 -1120 96 -1120 
            LINE N 0 -544 96 -544 
            LINE N 0 -608 96 -608 
            LINE N 0 -992 96 -992 
            LINE N 0 -672 96 -672 
            LINE N 0 -864 96 -864 
            LINE N 0 -800 96 -800 
            LINE N 0 -32 96 -32 
            LINE N 232 -32 96 -32 
            LINE N 232 -344 232 -32 
            LINE N 200 -96 92 -96 
            LINE N 200 -340 200 -96 
            LINE N 172 -160 96 -160 
            LINE N 172 -336 172 -160 
            LINE N 148 -224 96 -224 
            LINE N 148 -328 148 -224 
            LINE N 120 -288 96 -288 
            LINE N 120 -324 120 -288 
            LINE N 320 -832 256 -832 
            LINE N 96 -1344 96 -320 
            LINE N 256 -1312 96 -1344 
            LINE N 256 -352 256 -1312 
            LINE N 96 -320 256 -352 
            LINE N 0 -1184 96 -1184 
            LINE N 0 -1056 96 -1056 
            LINE N 0 -928 96 -928 
            LINE N 0 -736 96 -736 
        END BLOCKDEF
        BEGIN BLOCK XLXI_1 m16_1e
            PIN D0 D0
            PIN D1 D1
            PIN D10 D10
            PIN D11 D11
            PIN D12 D12
            PIN D13 D13
            PIN D14 D14
            PIN D15 D15
            PIN D2 D2
            PIN D3 D3
            PIN D4 D4
            PIN D5 D5
            PIN D6 D6
            PIN D7 D7
            PIN D8 D8
            PIN D9 D9
            PIN E E
            PIN S0 S0
            PIN S1 S1
            PIN S2 S2
            PIN S3 S3
            PIN O O
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        INSTANCE XLXI_1 1888 2304 R0
        BEGIN BRANCH D0
            WIRE 1504 992 1888 992
        END BRANCH
        BEGIN BRANCH D1
            WIRE 1520 1056 1888 1056
        END BRANCH
        BEGIN BRANCH D2
            WIRE 1504 1120 1888 1120
        END BRANCH
        BEGIN BRANCH D3
            WIRE 1584 1184 1888 1184
        END BRANCH
        BEGIN BRANCH D4
            WIRE 1520 1248 1888 1248
        END BRANCH
        BEGIN BRANCH D5
            WIRE 1520 1312 1888 1312
        END BRANCH
        BEGIN BRANCH D6
            WIRE 1520 1376 1888 1376
        END BRANCH
        BEGIN BRANCH D7
            WIRE 1504 1440 1888 1440
        END BRANCH
        BEGIN BRANCH D8
            WIRE 1504 1504 1888 1504
        END BRANCH
        BEGIN BRANCH D9
            WIRE 1520 1568 1888 1568
        END BRANCH
        BEGIN BRANCH D10
            WIRE 1520 1632 1888 1632
        END BRANCH
        BEGIN BRANCH D11
            WIRE 1520 1696 1888 1696
        END BRANCH
        BEGIN BRANCH D12
            WIRE 1520 1760 1888 1760
        END BRANCH
        BEGIN BRANCH D13
            WIRE 1520 1824 1888 1824
        END BRANCH
        BEGIN BRANCH D14
            WIRE 1520 1888 1888 1888
        END BRANCH
        BEGIN BRANCH D15
            WIRE 1520 1952 1888 1952
        END BRANCH
        BEGIN BRANCH S0
            WIRE 1520 2016 1888 2016
        END BRANCH
        BEGIN BRANCH S1
            WIRE 1520 2080 1888 2080
        END BRANCH
        BEGIN BRANCH S2
            WIRE 1520 2144 1888 2144
        END BRANCH
        BEGIN BRANCH S3
            WIRE 1520 2208 1888 2208
        END BRANCH
        BEGIN BRANCH E
            WIRE 1520 2272 1888 2272
        END BRANCH
        BEGIN BRANCH O
            WIRE 2208 1472 2416 1472
        END BRANCH
        IOMARKER 1504 992 D0 R180 28
        IOMARKER 1520 1056 D1 R180 28
        IOMARKER 1504 1120 D2 R180 28
        IOMARKER 1584 1184 D3 R180 28
        IOMARKER 1520 1248 D4 R180 28
        IOMARKER 1520 1312 D5 R180 28
        IOMARKER 1520 1376 D6 R180 28
        IOMARKER 1504 1440 D7 R180 28
        IOMARKER 1504 1504 D8 R180 28
        IOMARKER 1520 1568 D9 R180 28
        IOMARKER 1520 1632 D10 R180 28
        IOMARKER 1520 1696 D11 R180 28
        IOMARKER 1520 1760 D12 R180 28
        IOMARKER 1520 1824 D13 R180 28
        IOMARKER 1520 1888 D14 R180 28
        IOMARKER 1520 1952 D15 R180 28
        IOMARKER 1520 2016 S0 R180 28
        IOMARKER 1520 2080 S1 R180 28
        IOMARKER 1520 2144 S2 R180 28
        IOMARKER 1520 2208 S3 R180 28
        IOMARKER 1520 2272 E R180 28
        IOMARKER 2416 1472 O R0 28
    END SHEET
END SCHEMATIC
