# GCN-accelerator-design-RTL
This was a project I did on EEE 525 at ASU. I designed a GCN accelerator that reads the feature and weight matrix along with Adjacency matrix (given as coordinate matrix form) and classified the nodes at the end. After RTL I also completed synthesis and created the chip with ASAP7 PDK in Cadence Innovus software.. 

#The folder contains all the synthesizable Verilog files that performs the inference task. the matrices are also added here if someone wants to test. 
#there are two testbench files as well for testing the RTL pre and post-synthesis and APR.
#syn.v file is the synthesized gate-level netlist file. 
#GCN.apr.v is the netlist generated after the cts and routing stage in Innovus. 
#example.dc.tcl file is for synthesizing the RTL files in DC compiler.
#example.tcl file contains all the commands I executed for the APR flow in innovus. 
I have also added the final_layout of the accelerator here.
