// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
// Date        : Thu Oct 27 14:24:49 2022
// Host        : DESKTOP-F6F6K46 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ blk_mem_gen_0_sim_netlist.v
// Design      : blk_mem_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_0,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_5 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 19872)
`pragma protect data_block
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
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
