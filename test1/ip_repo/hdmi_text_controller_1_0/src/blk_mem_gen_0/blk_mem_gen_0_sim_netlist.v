// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Wed Apr  3 20:42:41 2024
// Host        : ROHANLAPTOP running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/rohan/385lab7/ip_repo/hdmi_text_controller_1_0/src/blk_mem_gen_0/blk_mem_gen_0_sim_netlist.v
// Design      : blk_mem_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s50csga324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_0,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module blk_mem_gen_0
   (clka,
    ena,
    wea,
    addra,
    dina,
    douta,
    clkb,
    enb,
    web,
    addrb,
    dinb,
    doutb);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [10:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [15:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [15:0]douta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB WE" *) input [0:0]web;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [10:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DIN" *) input [15:0]dinb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [15:0]doutb;

  wire [10:0]addra;
  wire [10:0]addrb;
  wire clka;
  wire [15:0]dina;
  wire [15:0]dinb;
  wire [15:0]douta;
  wire [15:0]doutb;
  wire ena;
  wire enb;
  wire [0:0]wea;
  wire [0:0]web;
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
  wire [10:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [10:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [15:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "11" *) 
  (* C_ADDRB_WIDTH = "11" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "1" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "1" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     5.349 mW" *) 
  (* C_FAMILY = "spartan7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "1" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
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
  (* C_MEM_TYPE = "2" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "1200" *) 
  (* C_READ_DEPTH_B = "1200" *) 
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
  (* C_WRITE_DEPTH_A = "1200" *) 
  (* C_WRITE_DEPTH_B = "1200" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "16" *) 
  (* C_WRITE_WIDTH_B = "16" *) 
  (* C_XDEVICEFAMILY = "spartan7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  blk_mem_gen_0_blk_mem_gen_v8_4_5 U0
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb(dinb),
        .douta(douta),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(enb),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[10:0]),
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
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[10:0]),
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
        .web(web));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2022.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
VHPlDkoDlWlBfBMvPBmGYmaek3s9hXXhjF28kllYPnaNm3TSnzzpXHWHc8Ye9/2L2yiQfJ1hTWou
Ia/zeQ8h9/dtr6QB5YkyW4wlb/LbMgXb+DGIXPSllNl0IMsRQIcQDbcQm1bO/nlhb+2pjxiuaQrl
DbvxoDwPs7z3LunRxsg=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
lmIhoX8hXuc7tNV1sXY1K2/gXL7Y7Hq73qQF7+x03UWWTRd3uhGmVQtOMVbhIW+66UkWUHiD26zL
fzqGor8bgSNGpSFyS11k4TwLQT4OfAMGO8C9Qmmh4+VENBnpS9TW+wHzCv8oUwht7xYtYRZvOvYK
F3fMppz2sBkUd1lciw98ZE/UmNkhqBuMfIYF43j45DEJ55PBhOZNg91Ls4v3qBHyBAaYPFFoMry3
d5Fw1PZyFQSEOSSpwgyds2aN0g6oIwl7zm0LJrM9VDAOxBUE50hk+oHr4jj8J8UhHQJnlEHm1Idm
rvxKygNKRvfSpa90NYxZJFYgqnrMYg+19+9aZA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
VkyCjO2onoeZWEoYQ/4ue7X5mkHyTYVW9xjdoTsGS4GdP/Q64VaCZL/jr6R8DVDXPMnH7tRMrDpo
jpYBnyzSgOkfgqM+96ioC2fDyAaG4gYgGLmrBR6qK3/mxXwAZZX+GJ9R/eWXkc9h8xN+gsSSX6/M
jIQCgeT6q7PB4dWT6KY=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Iub91V+TnhVlZCSLu6iKmFjix71y6/l83OPTs8uewWvkE7WcqYxEKi9fonXEkzAtWzuKwEUqnOlN
VBsNJqPUdKcd22q523mrdt89mpdosWD+hvZdO7ELhJniY5u9h49FFkubpN2JiUTcIcKEYxVNlds4
wyvaYUqbPVH5v2ooJwDdimS4GVn9HerCOgPwfshvQDNlMTxLcYju4v8BHMc5Rub9Q/ihvpQU74v2
ouZ9XIwA+C6pBLwvaqS8jE7HXOokgqJilaX/W/t+KEgiFry/txRTMU9WMD7tCN7lcfjCydmS3Lq+
3u6Hsr0S8BwNjcaDpZDnBTygUJd4JSqREnk33w==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
U46EWFmKmpZGaWfyL+dokyQtJtaOYsa7HCW/+fdtw9/yHKTWFpmqKBZngBj5rPkNhtTDDCJkqsYj
tUXg1j4tgIBaCQn9B0q/aG+B3gPLrudp9hLL25mVbsfiTzdekiV2hJMmhuMoavKKPJHC6zyW7kZi
80er82OQy8h+Df/fe6TRjH9xEt3/b80tRKUMbxkLfnnkAyyf1KfOhB6/uyI4mwXuQR+DsAbzybKR
YtXpOiW72tGrXTFlzcwbHamWZefqsilVpBw6V5dh33vYKGx50xwWpj76maAkpQrOpB7zufeldJe4
W1UOEN84AZdRTLkVSxamWo/wp8nP9fiGS/ItRw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_07", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
qczgIJYpE/SzErzK7eWJBGcDFEzDLm8cKbwJbPXuM6YnJxx44W+E60R3war7K2QGFAkOoCDUtDC7
SghJGF32btaDLzeKm0tQ669sBtQmMIaBrlt7I9QBkNM8zN9GL92qxNC9o3UVWMOYy5BmH8nUPgcE
O6lRubeltlrTuDe7UJQ2nEPHcXjpUJJ8dxktyW+LovBy1OxW8g4GRAsmEJsoOEg0HuDdWcc4IshJ
PvwPJ7LblELAKsdkSt65y9VaklaEm7MlH4ImlgIa74TgRmutLUbWxM1QYhGE5rAzFhGU5i3RJOdx
L3N7GGGvLMW2z9NSHbIFX+/eNII9fNJ9nZbgLA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ti1NUgDv8YPk90APMwfu/mRr38QYwAxZfv0T6zQ89YS55t2EquEGVqrEafYX6rTydLOw8le1Oucv
f2oERpSSSTih/ScZneSZmuPE/Zh2BU1Ajv0j+/+0uEWXU+5lLPbDJjnapTmJXih1MYPf0SHpZZmE
BKj2IEBI9MPZlh6bxpa5BWJnyPdAvHf+UNaMXU9+pmbtrzUVebql4mFJu45Z3+ehmFY4FBW3zXMF
44C4TlHACLwL3vHVMCVfeKhgdVDbpE+/IFhTStz7mZ9h9RKGanQcs6YDVM1R+2RKA1QT1fX4FiQc
1V+FGmrm1ujxmFGXwpfNKByVlfCY0oWhRJCYYQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
HuEXFK0NXt09xU2yxxjng1OLsT+ZEM4EhqBgpr9D2ljw2vDaMBrqEsRQTc2B9soDq3ewDduHJXBd
OGYxkPnoN6LhjULtB2nTgjcH6NxA4puZ1ZNcndDndVBo8rTW5W1OqHq6InAG0CqPpTIkuqz3ECPl
EysI++MCDfH6tIzlekxJFIJ1McJsTq5rFuLzMMcrmkBxgcayDpOcCFuzZzCczxmt/cCCIKmDybwT
OQXmOcLJoYLP4sFu6R9c6xO8i6p++crv2N3eIxZHKbek9xBBZqQM9EYuEtsbkqAs9XZpa16i5njR
BDFxTKcP6r7JgFALJE89AZhBbate5JXWp0v4ECZD18aEL17CipwcWPutNMdG1apzSPP5y59n7rMG
yxBPz1gKHc3Emkl4WcO0hjICxqmO6dMXoY8JvBSf6ry2l0sH9Ihr3Bq5WWmlhPHnoaNr5jl//vNe
KfToWtn97eoVSt1LnmXXnSpdigbHr0UIg8AdkpdkuNRaWdVicDdgSo49

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
mokwst2bn6UxD6V9UdIgCIG1QQ/d0FiJqYGOTI2eHPV6YElaLjnJ8DnQmZnGS95o3x93FDOoa58C
RwYsX1fVoVtXkj1LuZq0k7q9vEe4T8xMjpkeYtIHY9k0Xhy1Lq/xRlfzGAf9fvf9e+f4r7aR/Sb/
uCZxxugG5niTwLENY1n3NthYL0jvo8Fmdw4Qg0nTCGWlVCws+09K0g9/lx6I9EcuHHemcHO3fOZG
lMc4NaPNozKwnyDMoWUkwiVxyFEPFaQLNYqzjvR+CqrWfhFLo96JWhL+eaDoNuZoBVYQtNH5ZwBL
BoO27Pw10lgcReGlZBz3BLO7T4ddynCx0+eSnw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
PiP7AjOQqqouyQMoBQqgWIDhUSViq94rIvGiIJ/UKMDspM/yXw1caE8AhWHTjYckC4yLpPAz5P6s
1Z6flzDPrzVwg4e59X2cc4IMCHhedna0rDO804njcc6amRDTeLsMLTkWfvomB4xwszm2AgT+PRnB
WHd09ZUDVFjiBXT+Oa9AicgGJHrX3w823yBPuAa704kje/SzgtiDpcTU1eLmLhLW7LpEd9KIHd9s
ER7Uk9Orws0Kq9PMTqMX4hMn5K5mFakOeOURiEbUjdv5RiIJ2g/PlQXSItM8fHsBTQa6fOaJwQTI
vHwK3a8ZBHpfT1YH+n7wNiNUZwD4SFXm1QVx4g==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ul5ZfTHJwMctaNhYRortUZizYMPYRef7uYqPSuMkxsArnxI/cjGh+KRMwzV86hyp/6TXSJIjm5ec
2wX2UONdPN+DOJ84jYC4JbgJQrPnTj7ioD8uLX/WlyPcQzyF5keqFgj5eR5s13FskVWCuAWf5m9w
mhFEKFjVXDAr7gVgAJh/hL8P6Psrnf+LGfiM8JhnDepsHEYykGlpD3fzru2BGgqHWqPqFMcnyVGl
vysaIXiJz/eYKvO8RGcgd3DJAM/wPm9A0m/DWcmSnczOgTjoqkHcBg2H5uJMLvufzmjImi6LYEqq
v04ESDEN31cSUzqUYcayvMFOnI/WNsWbFIa5+Q==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 28576)
`pragma protect data_block
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
2ZeEFXZPo47bFUG7sKB8axwjrw==
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
