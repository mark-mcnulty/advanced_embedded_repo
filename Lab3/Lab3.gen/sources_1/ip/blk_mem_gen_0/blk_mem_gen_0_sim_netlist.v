// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
// Date        : Sun Oct 30 16:19:16 2022
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
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [11:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [15:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [11:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [15:0]doutb;

  wire [11:0]addra;
  wire [11:0]addrb;
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
  wire [11:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [11:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [15:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "12" *) 
  (* C_ADDRB_WIDTH = "12" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "2" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     9.0695 mW" *) 
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
  (* C_READ_DEPTH_A = "4096" *) 
  (* C_READ_DEPTH_B = "4096" *) 
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
  (* C_WRITE_DEPTH_A = "4096" *) 
  (* C_WRITE_DEPTH_B = "4096" *) 
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
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[11:0]),
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
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[11:0]),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 45840)
`pragma protect data_block
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
WJj/PfGlZwIDO5LF
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
