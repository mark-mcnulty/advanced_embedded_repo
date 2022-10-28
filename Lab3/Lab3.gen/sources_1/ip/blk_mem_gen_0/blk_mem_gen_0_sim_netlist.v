// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
// Date        : Thu Oct 27 14:24:51 2022
// Host        : DESKTOP-F6F6K46 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/Mark/Documents/Mines/Advanced_Embedded/code/Lab3/Lab3.gen/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0_sim_netlist.v
// Design      : blk_mem_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_0,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.1" *) 
(* NotValidForBitStream *)
module blk_mem_gen_0
   (clka,
    ena,
    wea,
    addra,
    dina,
    clkb,
    enb,
    addrb,
    doutb);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [9:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [15:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [9:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [15:0]doutb;

  wire [9:0]addra;
  wire [9:0]addrb;
  wire clka;
  wire clkb;
  wire [15:0]dina;
  wire [15:0]doutb;
  wire ena;
  wire enb;
  wire [0:0]wea;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [15:0]NLW_U0_douta_UNCONNECTED;
  wire [9:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [9:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [15:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "10" *) 
  (* C_ADDRB_WIDTH = "10" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.7261 mW" *) 
  (* C_FAMILY = "zynq" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "1" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "1" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "blk_mem_gen_0.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "1" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "1024" *) 
  (* C_READ_DEPTH_B = "1024" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "16" *) 
  (* C_READ_WIDTH_B = "16" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "1024" *) 
  (* C_WRITE_DEPTH_B = "1024" *) 
  (* C_WRITE_MODE_A = "NO_CHANGE" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "16" *) 
  (* C_WRITE_WIDTH_B = "16" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  blk_mem_gen_0_blk_mem_gen_v8_4_5 U0
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(NLW_U0_douta_UNCONNECTED[15:0]),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(enb),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[9:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[9:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[15:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2022.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
RgPKnWr9n0dGgttm3akiFhAlfB96usOQYxnEmPhGyTGg1AbizYAjGPWLXBWl50n/d0IA71ci4aJB
wt6mtfyNADm3ZReK7D3mKu037BOgxryoEwwf1kiC6q/PllxsdAgEMfQrfHJ3E2AzSpdYjoxVYito
y0JW6CUDcWvWa4WV0EA=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
M0l6KpOGH3jL8eRt3NCD7e2USYnkg5H9GAnE1PKmnjiouFN3Y8kjWA2PZDAQLm9UW+TsC1HeVlzO
WjNCHkjR/6ubCsIcWfpPZWdIuAenlsyq8Y9l6b8vMj8JSbDEOiFF/GHSbKsn22MJdDJKEhHFK6GV
s8gR2vywRFwG69gIRE4qGhVB+WIg8GJrDpDMYH6lCjMkTrjXuKDUcNlJN3NPLuhJ7tsditwf1pr5
moJRmGpJnip/rGm0g4o4A6ev4CtePjoao8C1wFtzHkERX9oenhh7cGjDMejU5IrLv8NxFnLj1FpB
9MuF1beTU20NI5oAn6zLiLiOtXjf0ghU3AN4DA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
hAsrUfp6Qgjm8yBjNYTEtQmVQmMxzL8TE/3oiQSxSI3+yEkXAbQCXkT9mo+LCdv+fGECOB0istHd
eLtbsiYbxjxNxYkXiUrRE5O+aSxynIray+uF9DJigTEUZu8JJXUbzxK4DDUu1Lm9tpGps4+Prz1m
0gkj13RT/Y/418s2VTw=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
BP/54Wm/GJmb1jy0bxWJJX4aiKyiWPVh4X3VL30BQrmX4PlEsNKzBJH3Qu8IIYERfnFP0ifAgboa
vypMQ5Ed0BrMePGkWIgT6I8hxJCMFpHdkSK7m1giSKyZzFfTOrVqoNFXE+qdzLfY1J5hBWCvouYo
jllavK4N3gF9FLScH2AUWYVMcVth2QPaTAU2NLnAUNH8kgtBjBfc8/KbPPTznD1QNVqvFstzcbTA
hGQ1ETVPvINQ0KqxxAG5PRhtQD4+pC+hr/Tvk+RSvGyBOfy9zE86OXkJiYs9dSFhNiMFmCPL9DBO
se4OxNNC0/7aBtb1mkSEA9YFDYEb9jS7Jasy2A==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
SnzT9DVH3xlEN8nrr2YrlvTO5qj7L22d7WaBcuKyTaiHoIwwFHrC4HQbfs0TAwkdWcOgmJoATPSF
F6qm0KiddbrlERF3MfKUldeGBJtqLdX+zGw7+3JD7S+HB9dIMOFOHy+IiCZp1/Pz8epKpi238cel
rcVoJQKz406wmXDvOo8KsT+XhRLs9BVCrBErPGGXKYDk6NXAp0duOgQE9DbslzMU83M/kUC7uERV
tQW02240peKQFp2elEZC7Tetvgp0TaFTtJiKN45REi8GQUCKGa85JjNIk1qb/+k95TIIP1xrHirc
6iX7qbwnPetv8TVu2NjkZ0WDEK5RXdOXcxBwHA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_07", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
erkR82V0jX8ytva+9MzEs0c75Z7j7TsgxWRLNAUfbbU28i+U9YzuZlSfYU75M0f9jx1gvxtBrfKv
cNHVdkR+i5zfHDZsDwfMEEBhs8wzDCKqe+eex6BBEvlIOesCPXrr2RozQgaQ1PBh/os2Arfu+873
BjsVxFJkbhpzIqlddOo/XZV9Yi+eih7A7pXXEBR6IL7Poo4Ka49MiVQU0xJrDTm+ddOuMPDRRD7g
dsxS/uzdcBcO2myV6g/7YH/C2Ce9s6+UywJN/0JeXSqwA7bsBqqnfFicVAT0lckLopMLiuzK7dsN
EwhFeqoetciFrDIj9+o0xDMWBZhgNP1u68vURA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
R+BI65BKLT0I9hEtsxGnDyM5XY9gzULeTPOSDXvd3KWOzZJAx6C0xlbyZcFZhAEG/QIK2yd0wAi6
IUWxyF/sx3HsqKjhVi5KxnpuXDBOZVoj811O7JukedFVmDW7OHGtBkuiJ5X5irw7mfsEKRQmF/1i
V6lj9HYHZEjxtDeZjACsLY4y1QxWalSKT4HIMOHznBLL8dLbGMlS+ZmFuFn0gcwZavVl7gTkTtkf
W0gn01A9ru7NKsf+iLX0kj4dgItPu9N2g02M1vWQ9UUQEVvfV7lUc7GY1suibrD8aEkhH9S7lZ7n
bFsT4qxyvzg8ML6v4g4v7N6VuyhEtgFgNd725Q==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
jNUVKiwH68vHsU54idgvKwaVJcoxTUuxfgrQpbpmM/IpesWA3wHsGzYClwAxkKzw3KRnFyQqTWcZ
yj1EQ2CMBxlJ0kyNbZW8OK8pXzeigToZ0U6Aq3Gy+j7wBbhe83wE1Ygn82sK8dHTEulvaRLn/c5r
ispy1s7jMKIvYNzoUuZrgyBQyfaYmdqUia8XlQjFd+VwzhTXKwzvmaqHWyaHjfBKeCooO7+oUxMG
OJg83W54EVe9ronFQ8Wr9EOL8ia7qelCAgyQe/bC0HHCoMAm8apI7sX23iMR/wMiPP5V2bQzycy+
rBX/+SWkqSeIE1FLm+muFPvrE7iLwJaW8d1fzdFFjAZ5aIXArbWNfwbK8S0TczXc9lEzmpb69rwA
UJIrs4alo81qGQ32UFhjuMQjX75O9Od1HWHDj5PFaT/Ja5Ly+bK8Cc3gfO6dCE81m7d+B2JBZ/Hl
tBA19QuOAYwT2EIPOdpaVtCULb33cWODWu3qQFhZMmDzKTb3kwpcr0LL

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
MnzcA2swaxH1LRacKDou0ZmiiMRETbWIdHgeBgyQz7ILronsXLoB/C20WuFNGEVSiL2/51EZ6MXZ
vMHI8fFcMQCJcuTBDBibUMKv6bXI9s8fTbtrBZppbF/R1icG5JYhqmX4aRnv4W/dxJRjI2L35nLN
Y48E9OfgfkD1sr+IRwx8WEKFmUhuk8dLe0VOK7ywe3XEcneYvrz+HhPj16bGmNfMwNnDgZ3gKKZD
hRnys+jzvAX3HyISrErWXhMKrhWMxXeTNFJCqNQ0LWAVHQYwyKnF5xVpyXSuGNSIrva+QXqOrZBG
3VNLirNVtMRiKLfwZeMaqvswkqBDAa53utlAAA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
d0xXkKtsKM8GvXhDZr16p1+oE3uBtD04BJ76eGGIEj/CFECfHVy9qsJ43oSKjas0+AJr4GFFnVb6
X7gJV6MmX/OboC9ier5joUCGz0mxVzkRZK9a+LPEDcg0K6+cLE36kr+FfxW9Uk2816EHBCMCf5mK
A4eAhSmAb5Nq74F/q0quiG416npbny7faiQ+xmPDfYYiM3UuMKaD4iE8ODlz1w5xThPllWESf3LZ
NTkw6fozyTqZ47vvE21O3dgIGAY1v+C6BwlCK24VwPJa1xs9csY+qTk31j5jjAc1ExlB6QF7t9UH
lk70qdNPWxT87OH7kFT8UvPO1D6BTC3/WkDZfA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
LYhdzKTvo93uJrAaiP5OfCDuOnu2BSvPnxlv6I7h2n1+xHtj34LNNKzWEgOg9dUV9cYDaHYUjjEt
DKdWcz6mZ61d5qyxAhpv67fc90v7JVgtOAcT94/Yb+AuLxXFcGA6Gic7uoJtUgz6JmTnb22Dxdjc
KuIewDj4IOTfP8XGXKTaF+cNp0CFrQgTAcVSQFyLFxr0I/9h3S+GZLecA7ntEeHEOfCJzPvy0ddi
7MCdQWECLb+fXC0IAn8V95TumcpINiRAX1BHi9IGJ4QoMrb3jOCrPkFhDMTJj2aiImUWdi/l/0QE
d7wcXlgIEYVeoKYUOJ4mqy+zZPUbLNeOPADUDQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 19840)
`pragma protect data_block
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
FQfIMQ==
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
