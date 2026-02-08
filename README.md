# EE533_Labs
Here are all the Team Lab files of EE533 Spring 2026 Group 20 in USC Viterbi(Still building).

Lab Members:

1. KuanChieh Lin
   Class: EE533 Spring 2026
   FPGA Assigned: nf9
   
2. ZiYao Wang
   Class: EE533 Spring 2026
   FPGA Assigned: nf9

Lab 4 

   Goals:

      1. Connect, configure and measure the performance via iperf between the nodes on NetFPGA.
      2. Implement Lab 3's mini-IDS into NetFPGA.
      3. Test it's performance and functionality.

   Steps:

      1. Use Fedora 14 to generate bitfile for reference router
      2. Merge source files from lab 3 with reference router to generate bit file for lab 4
      3. Configure VPN for NetFPGA connection
      4. Launch Ubunbtu VM and connect to NetFPGA terminal using openterm.sh
      5. Download reference_nic.bit and use script to test several nodes' performance
      6. Download reference_router.bit, rkd & and do iperf tests to see if performance changed
      7. Kill rkd (failed because of no permission) and download reference_nic.bit again
      8. Use automated script to set up iperf UDP server on each node, run client on each node simultaneously (roughly) to connect with each server and do this multiple times
      9. Take the average performance of previous tests, Kill rkd (again, failed because of no permission), download reference_router.bit, rkd & and run the same script to see if anything changed
