VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "spartan3a"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL A24
        SIGNAL A25
        SIGNAL A26
        SIGNAL A27
        SIGNAL A28
        SIGNAL A29
        SIGNAL A30
        SIGNAL A31
        SIGNAL B24
        SIGNAL B25
        SIGNAL B26
        SIGNAL B27
        SIGNAL B28
        SIGNAL B29
        SIGNAL B30
        SIGNAL B31
        SIGNAL S24
        SIGNAL S25
        SIGNAL S26
        SIGNAL S27
        SIGNAL S28
        SIGNAL S29
        SIGNAL S30
        SIGNAL S31
        SIGNAL XLXN_182
        SIGNAL A16
        SIGNAL A17
        SIGNAL A18
        SIGNAL A19
        SIGNAL A20
        SIGNAL A21
        SIGNAL A22
        SIGNAL A23
        SIGNAL B16
        SIGNAL B17
        SIGNAL B18
        SIGNAL B19
        SIGNAL B20
        SIGNAL B21
        SIGNAL B22
        SIGNAL B23
        SIGNAL S16
        SIGNAL S17
        SIGNAL S18
        SIGNAL S19
        SIGNAL S20
        SIGNAL S21
        SIGNAL S22
        SIGNAL S23
        SIGNAL Cin
        SIGNAL A0
        SIGNAL A1
        SIGNAL A2
        SIGNAL A3
        SIGNAL A4
        SIGNAL A5
        SIGNAL A6
        SIGNAL A7
        SIGNAL B0
        SIGNAL B1
        SIGNAL B2
        SIGNAL B3
        SIGNAL B4
        SIGNAL B5
        SIGNAL B6
        SIGNAL B7
        SIGNAL S0
        SIGNAL S1
        SIGNAL S2
        SIGNAL S3
        SIGNAL S4
        SIGNAL S5
        SIGNAL S6
        SIGNAL S7
        SIGNAL XLXN_157
        SIGNAL A8
        SIGNAL A9
        SIGNAL A10
        SIGNAL A11
        SIGNAL A12
        SIGNAL A13
        SIGNAL A14
        SIGNAL A15
        SIGNAL B8
        SIGNAL B9
        SIGNAL B10
        SIGNAL B11
        SIGNAL B12
        SIGNAL B13
        SIGNAL B14
        SIGNAL B15
        SIGNAL S8
        SIGNAL S9
        SIGNAL S10
        SIGNAL S11
        SIGNAL S12
        SIGNAL S13
        SIGNAL S14
        SIGNAL S15
        SIGNAL XLXN_433
        SIGNAL Cout
        PORT Input A24
        PORT Input A25
        PORT Input A26
        PORT Input A27
        PORT Input A28
        PORT Input A29
        PORT Input A30
        PORT Input A31
        PORT Input B24
        PORT Input B25
        PORT Input B26
        PORT Input B27
        PORT Input B28
        PORT Input B29
        PORT Input B30
        PORT Input B31
        PORT Output S24
        PORT Output S25
        PORT Output S26
        PORT Output S27
        PORT Output S28
        PORT Output S29
        PORT Output S30
        PORT Output S31
        PORT Input A16
        PORT Input A17
        PORT Input A18
        PORT Input A19
        PORT Input A20
        PORT Input A21
        PORT Input A22
        PORT Input A23
        PORT Input B16
        PORT Input B17
        PORT Input B18
        PORT Input B19
        PORT Input B20
        PORT Input B21
        PORT Input B22
        PORT Input B23
        PORT Output S16
        PORT Output S17
        PORT Output S18
        PORT Output S19
        PORT Output S20
        PORT Output S21
        PORT Output S22
        PORT Output S23
        PORT Input Cin
        PORT Input A0
        PORT Input A1
        PORT Input A2
        PORT Input A3
        PORT Input A4
        PORT Input A5
        PORT Input A6
        PORT Input A7
        PORT Input B0
        PORT Input B1
        PORT Input B2
        PORT Input B3
        PORT Input B4
        PORT Input B5
        PORT Input B6
        PORT Input B7
        PORT Output S0
        PORT Output S1
        PORT Output S2
        PORT Output S3
        PORT Output S4
        PORT Output S5
        PORT Output S6
        PORT Output S7
        PORT Input A8
        PORT Input A9
        PORT Input A10
        PORT Input A11
        PORT Input A12
        PORT Input A13
        PORT Input A14
        PORT Input A15
        PORT Input B8
        PORT Input B9
        PORT Input B10
        PORT Input B11
        PORT Input B12
        PORT Input B13
        PORT Input B14
        PORT Input B15
        PORT Output S8
        PORT Output S9
        PORT Output S10
        PORT Output S11
        PORT Output S12
        PORT Output S13
        PORT Output S14
        PORT Output S15
        PORT Output Cout
        BEGIN BLOCKDEF Eight_bit_Adder
            TIMESTAMP 2026 1 25 6 4 9
            RECTANGLE N 64 -1088 320 0 
            LINE N 64 -1008 0 -1008 
            LINE N 64 -912 0 -912 
            LINE N 64 -944 0 -944 
            LINE N 64 -976 0 -976 
            LINE N 64 -880 0 -880 
            LINE N 64 -848 0 -848 
            LINE N 64 -816 0 -816 
            LINE N 64 -784 0 -784 
            LINE N 64 -1072 0 -1072 
            LINE N 64 -96 0 -96 
            LINE N 64 -128 0 -128 
            LINE N 64 -160 0 -160 
            LINE N 64 -192 0 -192 
            LINE N 64 -224 0 -224 
            LINE N 64 -256 0 -256 
            LINE N 64 -288 0 -288 
            LINE N 64 -320 0 -320 
            LINE N 320 -480 384 -480 
            LINE N 320 -672 384 -672 
            LINE N 320 -640 384 -640 
            LINE N 320 -608 384 -608 
            LINE N 320 -576 384 -576 
            LINE N 320 -544 384 -544 
            LINE N 320 -512 384 -512 
            LINE N 320 -448 384 -448 
            LINE N 320 -48 384 -48 
        END BLOCKDEF
        BEGIN BLOCK XLXI_6 Eight_bit_Adder
            PIN A0 A24
            PIN A3 A27
            PIN A2 A26
            PIN A1 A25
            PIN A4 A28
            PIN A5 A29
            PIN A6 A30
            PIN A7 A31
            PIN Cin XLXN_433
            PIN B7 B31
            PIN B6 B30
            PIN B5 B29
            PIN B4 B28
            PIN B3 B27
            PIN B2 B26
            PIN B1 B25
            PIN B0 B24
            PIN S6 S30
            PIN S0 S24
            PIN S1 S25
            PIN S2 S26
            PIN S3 S27
            PIN S4 S28
            PIN S5 S29
            PIN S7 S31
            PIN Cout Cout
        END BLOCK
        BEGIN BLOCK XLXI_8 Eight_bit_Adder
            PIN A0 A16
            PIN A3 A19
            PIN A2 A18
            PIN A1 A17
            PIN A4 A20
            PIN A5 A21
            PIN A6 A22
            PIN A7 A23
            PIN Cin XLXN_182
            PIN B7 B23
            PIN B6 B22
            PIN B5 B21
            PIN B4 B20
            PIN B3 B19
            PIN B2 B18
            PIN B1 B17
            PIN B0 B16
            PIN S6 S22
            PIN S0 S16
            PIN S1 S17
            PIN S2 S18
            PIN S3 S19
            PIN S4 S20
            PIN S5 S21
            PIN S7 S23
            PIN Cout XLXN_433
        END BLOCK
        BEGIN BLOCK XLXI_1 Eight_bit_Adder
            PIN A0 A0
            PIN A3 A3
            PIN A2 A2
            PIN A1 A1
            PIN A4 A4
            PIN A5 A5
            PIN A6 A6
            PIN A7 A7
            PIN Cin Cin
            PIN B7 B7
            PIN B6 B6
            PIN B5 B5
            PIN B4 B4
            PIN B3 B3
            PIN B2 B2
            PIN B1 B1
            PIN B0 B0
            PIN S6 S6
            PIN S0 S0
            PIN S1 S1
            PIN S2 S2
            PIN S3 S3
            PIN S4 S4
            PIN S5 S5
            PIN S7 S7
            PIN Cout XLXN_157
        END BLOCK
        BEGIN BLOCK XLXI_7 Eight_bit_Adder
            PIN A0 A8
            PIN A3 A11
            PIN A2 A10
            PIN A1 A9
            PIN A4 A12
            PIN A5 A13
            PIN A6 A14
            PIN A7 A15
            PIN Cin XLXN_157
            PIN B7 B15
            PIN B6 B14
            PIN B5 B13
            PIN B4 B12
            PIN B3 B11
            PIN B2 B10
            PIN B1 B9
            PIN B0 B8
            PIN S6 S14
            PIN S0 S8
            PIN S1 S9
            PIN S2 S10
            PIN S3 S11
            PIN S4 S12
            PIN S5 S13
            PIN S7 S15
            PIN Cout XLXN_182
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 7040 5440
        BEGIN INSTANCE XLXI_6 2384 4112 R90
        END INSTANCE
        BEGIN BRANCH A24
            WIRE 3392 4000 3504 4000
            WIRE 3392 4000 3392 4112
        END BRANCH
        BEGIN BRANCH A25
            WIRE 3360 3936 3504 3936
            WIRE 3360 3936 3360 4112
        END BRANCH
        BEGIN BRANCH A26
            WIRE 3328 3872 3504 3872
            WIRE 3328 3872 3328 4112
        END BRANCH
        BEGIN BRANCH A27
            WIRE 3296 3808 3504 3808
            WIRE 3296 3808 3296 4112
        END BRANCH
        BEGIN BRANCH A28
            WIRE 3264 3760 3504 3760
            WIRE 3264 3760 3264 4112
        END BRANCH
        BEGIN BRANCH A29
            WIRE 3232 3696 3504 3696
            WIRE 3232 3696 3232 4112
        END BRANCH
        BEGIN BRANCH A30
            WIRE 3200 3632 3504 3632
            WIRE 3200 3632 3200 4112
        END BRANCH
        BEGIN BRANCH A31
            WIRE 3168 3568 3504 3568
            WIRE 3168 3568 3168 4112
        END BRANCH
        BEGIN BRANCH B24
            WIRE 2704 4080 2816 4080
            WIRE 2704 4080 2704 4112
        END BRANCH
        BEGIN BRANCH B25
            WIRE 2672 4016 2816 4016
            WIRE 2672 4016 2672 4112
        END BRANCH
        BEGIN BRANCH B26
            WIRE 2640 3936 2816 3936
            WIRE 2640 3936 2640 4112
        END BRANCH
        BEGIN BRANCH B27
            WIRE 2608 3856 2816 3856
            WIRE 2608 3856 2608 4112
        END BRANCH
        BEGIN BRANCH B28
            WIRE 2576 3776 2816 3776
            WIRE 2576 3776 2576 4112
        END BRANCH
        BEGIN BRANCH B29
            WIRE 2544 3680 2816 3680
            WIRE 2544 3680 2544 4112
        END BRANCH
        BEGIN BRANCH B30
            WIRE 2512 3600 2816 3600
            WIRE 2512 3600 2512 4112
        END BRANCH
        BEGIN BRANCH B31
            WIRE 2480 3536 2816 3536
            WIRE 2480 3536 2480 4112
        END BRANCH
        BEGIN BRANCH S24
            WIRE 3056 4496 3056 4544
            WIRE 3056 4544 3200 4544
        END BRANCH
        BEGIN BRANCH S25
            WIRE 3024 4496 3024 4608
            WIRE 3024 4608 3200 4608
        END BRANCH
        BEGIN BRANCH S26
            WIRE 2992 4496 2992 4688
            WIRE 2992 4688 3200 4688
        END BRANCH
        BEGIN BRANCH S27
            WIRE 2960 4496 2960 4768
            WIRE 2960 4768 3200 4768
        END BRANCH
        BEGIN BRANCH S28
            WIRE 2928 4496 2928 4832
            WIRE 2928 4832 3200 4832
        END BRANCH
        BEGIN BRANCH S29
            WIRE 2896 4496 2896 4896
            WIRE 2896 4896 3200 4896
        END BRANCH
        BEGIN BRANCH S30
            WIRE 2864 4496 2864 4976
            WIRE 2864 4976 3200 4976
        END BRANCH
        BEGIN BRANCH S31
            WIRE 2832 4496 2832 5040
            WIRE 2832 5040 3200 5040
        END BRANCH
        BEGIN BRANCH XLXN_182
            WIRE 3520 2336 3552 2336
            WIRE 3552 2336 3568 2336
            WIRE 3568 2336 3648 2336
            WIRE 3648 2336 3648 4576
            WIRE 3648 4576 4320 4576
            WIRE 3520 2336 3520 2368
            WIRE 4320 4496 4320 4576
        END BRANCH
        BEGIN BRANCH A16
            WIRE 3456 2352 3456 2368
            WIRE 3456 2352 3664 2352
            WIRE 3664 2128 3664 2352
            WIRE 3664 2128 3776 2128
        END BRANCH
        BEGIN BRANCH A17
            WIRE 3424 2192 3552 2192
            WIRE 3552 2192 3568 2192
            WIRE 3424 2192 3424 2368
        END BRANCH
        BEGIN BRANCH A18
            WIRE 3392 2128 3552 2128
            WIRE 3552 2128 3568 2128
            WIRE 3392 2128 3392 2368
        END BRANCH
        BEGIN BRANCH A19
            WIRE 3360 2064 3552 2064
            WIRE 3552 2064 3568 2064
            WIRE 3360 2064 3360 2368
        END BRANCH
        BEGIN BRANCH A20
            WIRE 3328 2016 3552 2016
            WIRE 3552 2016 3568 2016
            WIRE 3328 2016 3328 2368
        END BRANCH
        BEGIN BRANCH A21
            WIRE 3296 1952 3552 1952
            WIRE 3552 1952 3568 1952
            WIRE 3296 1952 3296 2368
        END BRANCH
        BEGIN BRANCH A22
            WIRE 3264 1888 3552 1888
            WIRE 3552 1888 3568 1888
            WIRE 3264 1888 3264 2368
        END BRANCH
        BEGIN BRANCH A23
            WIRE 3232 1824 3552 1824
            WIRE 3552 1824 3568 1824
            WIRE 3232 1824 3232 2368
        END BRANCH
        BEGIN BRANCH B16
            WIRE 2768 2336 2864 2336
            WIRE 2864 2336 2880 2336
            WIRE 2768 2336 2768 2368
        END BRANCH
        BEGIN BRANCH B17
            WIRE 2736 2272 2864 2272
            WIRE 2864 2272 2880 2272
            WIRE 2736 2272 2736 2368
        END BRANCH
        BEGIN BRANCH B18
            WIRE 2704 2192 2864 2192
            WIRE 2864 2192 2880 2192
            WIRE 2704 2192 2704 2368
        END BRANCH
        BEGIN BRANCH B19
            WIRE 2672 2112 2864 2112
            WIRE 2864 2112 2880 2112
            WIRE 2672 2112 2672 2368
        END BRANCH
        BEGIN BRANCH B20
            WIRE 2640 2032 2864 2032
            WIRE 2864 2032 2880 2032
            WIRE 2640 2032 2640 2368
        END BRANCH
        BEGIN BRANCH B21
            WIRE 2608 1936 2864 1936
            WIRE 2864 1936 2880 1936
            WIRE 2608 1936 2608 2368
        END BRANCH
        BEGIN BRANCH B22
            WIRE 2576 1856 2864 1856
            WIRE 2864 1856 2880 1856
            WIRE 2576 1856 2576 2368
        END BRANCH
        BEGIN BRANCH B23
            WIRE 2544 1792 2864 1792
            WIRE 2864 1792 2880 1792
            WIRE 2544 1792 2544 2368
        END BRANCH
        BEGIN BRANCH S16
            WIRE 3120 2752 3120 2800
            WIRE 3120 2800 3248 2800
            WIRE 3248 2800 3264 2800
        END BRANCH
        BEGIN BRANCH S17
            WIRE 3088 2752 3088 2864
            WIRE 3088 2864 3248 2864
            WIRE 3248 2864 3264 2864
        END BRANCH
        BEGIN BRANCH S18
            WIRE 3056 2752 3056 2944
            WIRE 3056 2944 3248 2944
            WIRE 3248 2944 3264 2944
        END BRANCH
        BEGIN BRANCH S19
            WIRE 3024 2752 3024 3024
            WIRE 3024 3024 3248 3024
            WIRE 3248 3024 3264 3024
        END BRANCH
        BEGIN BRANCH S20
            WIRE 2992 2752 2992 3088
            WIRE 2992 3088 3248 3088
            WIRE 3248 3088 3264 3088
        END BRANCH
        BEGIN BRANCH S21
            WIRE 2960 2752 2960 3152
            WIRE 2960 3152 3248 3152
            WIRE 3248 3152 3264 3152
        END BRANCH
        BEGIN BRANCH S22
            WIRE 2928 2752 2928 3232
            WIRE 2928 3232 3248 3232
            WIRE 3248 3232 3264 3232
        END BRANCH
        BEGIN BRANCH S23
            WIRE 2896 2752 2896 3296
            WIRE 2896 3296 3248 3296
            WIRE 3248 3296 3264 3296
        END BRANCH
        BEGIN INSTANCE XLXI_8 2448 2368 R90
        END INSTANCE
        IOMARKER 3504 4000 A24 R0 28
        IOMARKER 3504 3936 A25 R0 28
        IOMARKER 3504 3872 A26 R0 28
        IOMARKER 3504 3808 A27 R0 28
        IOMARKER 3504 3760 A28 R0 28
        IOMARKER 3504 3696 A29 R0 28
        IOMARKER 3504 3632 A30 R0 28
        IOMARKER 3504 3568 A31 R0 28
        IOMARKER 2816 4080 B24 R0 28
        IOMARKER 2816 4016 B25 R0 28
        IOMARKER 2816 3936 B26 R0 28
        IOMARKER 2816 3856 B27 R0 28
        IOMARKER 2816 3776 B28 R0 28
        IOMARKER 2816 3680 B29 R0 28
        IOMARKER 2816 3600 B30 R0 28
        IOMARKER 2816 3536 B31 R0 28
        IOMARKER 3200 4544 S24 R0 28
        IOMARKER 3200 4608 S25 R0 28
        IOMARKER 3200 4688 S26 R0 28
        IOMARKER 3200 4768 S27 R0 28
        IOMARKER 3200 4832 S28 R0 28
        IOMARKER 3200 4896 S29 R0 28
        IOMARKER 3200 4976 S30 R0 28
        IOMARKER 3200 5040 S31 R0 28
        IOMARKER 3568 2192 A17 R0 28
        IOMARKER 3568 2128 A18 R0 28
        IOMARKER 3568 2064 A19 R0 28
        IOMARKER 3568 2016 A20 R0 28
        IOMARKER 3568 1952 A21 R0 28
        IOMARKER 3568 1888 A22 R0 28
        IOMARKER 3568 1824 A23 R0 28
        IOMARKER 2880 2336 B16 R0 28
        IOMARKER 2880 2272 B17 R0 28
        IOMARKER 2880 2192 B18 R0 28
        IOMARKER 2880 2112 B19 R0 28
        IOMARKER 2880 2032 B20 R0 28
        IOMARKER 2880 1936 B21 R0 28
        IOMARKER 2880 1856 B22 R0 28
        IOMARKER 2880 1792 B23 R0 28
        IOMARKER 3264 2800 S16 R0 28
        IOMARKER 3264 2864 S17 R0 28
        IOMARKER 3264 2944 S18 R0 28
        IOMARKER 3264 3024 S19 R0 28
        IOMARKER 3264 3088 S20 R0 28
        IOMARKER 3264 3152 S21 R0 28
        IOMARKER 3264 3232 S22 R0 28
        IOMARKER 3264 3296 S23 R0 28
        BEGIN INSTANCE XLXI_1 4368 2368 R90
        END INSTANCE
        BEGIN BRANCH Cin
            WIRE 5440 2336 5488 2336
            WIRE 5440 2336 5440 2368
        END BRANCH
        BEGIN BRANCH A0
            WIRE 5376 2256 5488 2256
            WIRE 5376 2256 5376 2368
        END BRANCH
        BEGIN BRANCH A1
            WIRE 5344 2192 5488 2192
            WIRE 5344 2192 5344 2368
        END BRANCH
        BEGIN BRANCH A2
            WIRE 5312 2128 5488 2128
            WIRE 5312 2128 5312 2368
        END BRANCH
        BEGIN BRANCH A3
            WIRE 5280 2064 5488 2064
            WIRE 5280 2064 5280 2368
        END BRANCH
        BEGIN BRANCH A4
            WIRE 5248 2016 5488 2016
            WIRE 5248 2016 5248 2368
        END BRANCH
        BEGIN BRANCH A5
            WIRE 5216 1952 5488 1952
            WIRE 5216 1952 5216 2368
        END BRANCH
        BEGIN BRANCH A6
            WIRE 5184 1888 5488 1888
            WIRE 5184 1888 5184 2368
        END BRANCH
        BEGIN BRANCH A7
            WIRE 5152 1824 5488 1824
            WIRE 5152 1824 5152 2368
        END BRANCH
        BEGIN BRANCH B0
            WIRE 4688 2336 4800 2336
            WIRE 4688 2336 4688 2368
        END BRANCH
        BEGIN BRANCH B1
            WIRE 4656 2272 4800 2272
            WIRE 4656 2272 4656 2368
        END BRANCH
        BEGIN BRANCH B2
            WIRE 4624 2192 4800 2192
            WIRE 4624 2192 4624 2368
        END BRANCH
        BEGIN BRANCH B3
            WIRE 4592 2112 4800 2112
            WIRE 4592 2112 4592 2368
        END BRANCH
        BEGIN BRANCH B4
            WIRE 4560 2032 4800 2032
            WIRE 4560 2032 4560 2368
        END BRANCH
        BEGIN BRANCH B5
            WIRE 4528 1936 4800 1936
            WIRE 4528 1936 4528 2368
        END BRANCH
        BEGIN BRANCH B6
            WIRE 4496 1856 4800 1856
            WIRE 4496 1856 4496 2368
        END BRANCH
        BEGIN BRANCH B7
            WIRE 4464 1792 4800 1792
            WIRE 4464 1792 4464 2368
        END BRANCH
        BEGIN BRANCH S0
            WIRE 5040 2752 5040 2800
            WIRE 5040 2800 5184 2800
        END BRANCH
        BEGIN BRANCH S1
            WIRE 5008 2752 5008 2864
            WIRE 5008 2864 5184 2864
        END BRANCH
        BEGIN BRANCH S2
            WIRE 4976 2752 4976 2944
            WIRE 4976 2944 5184 2944
        END BRANCH
        BEGIN BRANCH S3
            WIRE 4944 2752 4944 3024
            WIRE 4944 3024 5184 3024
        END BRANCH
        BEGIN BRANCH S4
            WIRE 4912 2752 4912 3088
            WIRE 4912 3088 5184 3088
        END BRANCH
        BEGIN BRANCH S5
            WIRE 4880 2752 4880 3152
            WIRE 4880 3152 5184 3152
        END BRANCH
        BEGIN BRANCH S6
            WIRE 4848 2752 4848 3232
            WIRE 4848 3232 5184 3232
        END BRANCH
        BEGIN BRANCH S7
            WIRE 4816 2752 4816 3296
            WIRE 4816 3296 5184 3296
        END BRANCH
        IOMARKER 5488 2336 Cin R0 28
        IOMARKER 5488 2256 A0 R0 28
        IOMARKER 5488 2192 A1 R0 28
        IOMARKER 5488 2128 A2 R0 28
        IOMARKER 5488 2064 A3 R0 28
        IOMARKER 5488 2016 A4 R0 28
        IOMARKER 5488 1952 A5 R0 28
        IOMARKER 5488 1888 A6 R0 28
        IOMARKER 5488 1824 A7 R0 28
        IOMARKER 4800 2336 B0 R0 28
        IOMARKER 4800 2272 B1 R0 28
        IOMARKER 4800 2192 B2 R0 28
        IOMARKER 4800 2112 B3 R0 28
        IOMARKER 4800 2032 B4 R0 28
        IOMARKER 4800 1936 B5 R0 28
        IOMARKER 4800 1856 B6 R0 28
        IOMARKER 4800 1792 B7 R0 28
        IOMARKER 5184 2800 S0 R0 28
        IOMARKER 5184 2864 S1 R0 28
        IOMARKER 5184 2944 S2 R0 28
        IOMARKER 5184 3024 S3 R0 28
        IOMARKER 5184 3088 S4 R0 28
        IOMARKER 5184 3152 S5 R0 28
        IOMARKER 5184 3232 S6 R0 28
        IOMARKER 5184 3296 S7 R0 28
        BEGIN INSTANCE XLXI_7 4272 4112 R90
        END INSTANCE
        BEGIN BRANCH XLXN_157
            WIRE 4416 2752 4416 2832
            WIRE 4416 2832 5552 2832
            WIRE 5552 2832 5552 4080
            WIRE 5344 4080 5392 4080
            WIRE 5392 4080 5552 4080
            WIRE 5344 4080 5344 4112
        END BRANCH
        BEGIN BRANCH A8
            WIRE 5280 4000 5392 4000
            WIRE 5280 4000 5280 4112
        END BRANCH
        BEGIN BRANCH A9
            WIRE 5248 3936 5392 3936
            WIRE 5248 3936 5248 4112
        END BRANCH
        BEGIN BRANCH A10
            WIRE 5216 3872 5392 3872
            WIRE 5216 3872 5216 4112
        END BRANCH
        BEGIN BRANCH A11
            WIRE 5184 3808 5392 3808
            WIRE 5184 3808 5184 4112
        END BRANCH
        BEGIN BRANCH A12
            WIRE 5152 3760 5392 3760
            WIRE 5152 3760 5152 4112
        END BRANCH
        BEGIN BRANCH A13
            WIRE 5120 3696 5392 3696
            WIRE 5120 3696 5120 4112
        END BRANCH
        BEGIN BRANCH A14
            WIRE 5088 3632 5392 3632
            WIRE 5088 3632 5088 4112
        END BRANCH
        BEGIN BRANCH A15
            WIRE 5056 3568 5392 3568
            WIRE 5056 3568 5056 4112
        END BRANCH
        BEGIN BRANCH B8
            WIRE 4592 4080 4704 4080
            WIRE 4592 4080 4592 4112
        END BRANCH
        BEGIN BRANCH B9
            WIRE 4560 4016 4704 4016
            WIRE 4560 4016 4560 4112
        END BRANCH
        BEGIN BRANCH B10
            WIRE 4528 3936 4704 3936
            WIRE 4528 3936 4528 4112
        END BRANCH
        BEGIN BRANCH B11
            WIRE 4496 3856 4704 3856
            WIRE 4496 3856 4496 4112
        END BRANCH
        BEGIN BRANCH B12
            WIRE 4464 3776 4704 3776
            WIRE 4464 3776 4464 4112
        END BRANCH
        BEGIN BRANCH B13
            WIRE 4432 3680 4704 3680
            WIRE 4432 3680 4432 4112
        END BRANCH
        BEGIN BRANCH B14
            WIRE 4400 3600 4704 3600
            WIRE 4400 3600 4400 4112
        END BRANCH
        BEGIN BRANCH B15
            WIRE 4368 3536 4704 3536
            WIRE 4368 3536 4368 4112
        END BRANCH
        BEGIN BRANCH S8
            WIRE 4944 4496 4944 4544
            WIRE 4944 4544 5088 4544
        END BRANCH
        BEGIN BRANCH S9
            WIRE 4912 4496 4912 4608
            WIRE 4912 4608 5088 4608
        END BRANCH
        BEGIN BRANCH S10
            WIRE 4880 4496 4880 4688
            WIRE 4880 4688 5088 4688
        END BRANCH
        BEGIN BRANCH S11
            WIRE 4848 4496 4848 4768
            WIRE 4848 4768 5088 4768
        END BRANCH
        BEGIN BRANCH S12
            WIRE 4816 4496 4816 4832
            WIRE 4816 4832 5088 4832
        END BRANCH
        BEGIN BRANCH S13
            WIRE 4784 4496 4784 4896
            WIRE 4784 4896 5088 4896
        END BRANCH
        BEGIN BRANCH S14
            WIRE 4752 4496 4752 4976
            WIRE 4752 4976 5088 4976
        END BRANCH
        BEGIN BRANCH S15
            WIRE 4720 4496 4720 5040
            WIRE 4720 5040 5088 5040
        END BRANCH
        IOMARKER 5392 4000 A8 R0 28
        IOMARKER 5392 3936 A9 R0 28
        IOMARKER 5392 3872 A10 R0 28
        IOMARKER 5392 3808 A11 R0 28
        IOMARKER 5392 3760 A12 R0 28
        IOMARKER 5392 3696 A13 R0 28
        IOMARKER 5392 3632 A14 R0 28
        IOMARKER 5392 3568 A15 R0 28
        IOMARKER 4704 4080 B8 R0 28
        IOMARKER 4704 4016 B9 R0 28
        IOMARKER 4704 3936 B10 R0 28
        IOMARKER 4704 3856 B11 R0 28
        IOMARKER 4704 3776 B12 R0 28
        IOMARKER 4704 3680 B13 R0 28
        IOMARKER 4704 3600 B14 R0 28
        IOMARKER 4704 3536 B15 R0 28
        IOMARKER 5088 4544 S8 R0 28
        IOMARKER 5088 4608 S9 R0 28
        IOMARKER 5088 4688 S10 R0 28
        IOMARKER 5088 4768 S11 R0 28
        IOMARKER 5088 4832 S12 R0 28
        IOMARKER 5088 4896 S13 R0 28
        IOMARKER 5088 4976 S14 R0 28
        IOMARKER 5088 5040 S15 R0 28
        BEGIN BRANCH XLXN_433
            WIRE 2496 2752 2496 4048
            WIRE 2496 4048 3504 4048
            WIRE 3504 4048 3504 4080
            WIRE 3456 4080 3504 4080
            WIRE 3456 4080 3456 4112
        END BRANCH
        BEGIN BRANCH Cout
            WIRE 2432 4496 2432 4528
        END BRANCH
        IOMARKER 2432 4528 Cout R90 28
        IOMARKER 3776 2128 A16 R0 28
    END SHEET
END SCHEMATIC
