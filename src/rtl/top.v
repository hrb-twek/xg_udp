`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/06 21:59:18
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top(
    input wire OSC_CLK_P,
    input wire OSC_CLK_N,

    output wire LED,
    input  wire SW,

    input  wire GTREFCLK_P,
    input  wire GTREFCLK_N,
    output wire SFP0_TXP,
    output wire SFP0_TXN,
    input  wire SFP0_RXP,
    input  wire SFP0_RXN,
    input  wire SFP0_TX_FAULT,
    output wire SFP0_TX_DIS,
    input  wire SFP0_MOD_ABS,
    output wire SFP0_RS0,
    input  wire SFP0_RX_LOS,
    output wire SFP0_RS1

);

assign SFP0_TX_DIS = 1'b0;
assign SFP0_RS0    = 1'b1;
assign SFP0_RS1    = 1'b1;


wire clk;
clk_wiz_0 clk_wiz_inst(
    .clk_in1_p(OSC_CLK_P),
    .clk_in1_n(OSC_CLK_N),
    .clk_out1 (clk)
);

reg [0:24-1]rst_cnt=0;
always@(posedge clk) begin
    if(~&rst_cnt) begin
        rst_cnt <= rst_cnt + 1;
    end else begin
        if(SW) begin
            rst_cnt <= 0;
        end
    end
end

reg  rst_n=1'b1;
wire rst = ~rst_n;
always@(posedge clk) begin
    rst_n <= &rst_cnt;
end
assign LED = rst_cnt[0];


wire [535:0] sfp_config_vector = 0;
wire [447:0] sfp_status_vector;
(* mark_debug = "true" *)
wire sfp_1_rx_block_lock = sfp_status_vector[256];
wire clk_156mhz_int;
wire rst_156mhz_int;
wire        sfp_tx_clk_int = clk_156mhz_int;
wire        sfp_tx_rst_int = rst_156mhz_int;
wire [63:0] sfp_txd_int;
wire [7:0]  sfp_txc_int;
wire        sfp_rx_clk_int = clk_156mhz_int;
wire        sfp_rx_rst_int = rst_156mhz_int;
wire [63:0] sfp_rxd_int;
wire [7:0]  sfp_rxc_int;

wire sfp_reset_in;
wire sfp_txusrclk;
wire sfp_txusrclk2;
wire sfp_coreclk;
wire sfp_qplloutclk;
wire sfp_qplloutrefclk;
wire sfp_qplllock;
wire sfp_gttxreset;
wire sfp_gtrxreset;
wire sfp_txuserrdy;
wire sfp_areset_datapathclk;
wire sfp_resetdone;
wire sfp_reset_counter_done;

assign clk_156mhz_int = sfp_coreclk;
xpm_cdc_sync_rst  xpm_cdc_sync_reset_in (
    .dest_rst(sfp_reset_in),
    .dest_clk(clk_156mhz_int),
    .src_rst (rst)
);

xpm_cdc_sync_rst  xpm_cdc_sync_rst_156 (
    .dest_rst(rst_156mhz_int),
    .dest_clk(clk_156mhz_int),
    .src_rst (~sfp_resetdone)
);

xg_pcs_pma sfp_1_pcs_pma_inst (
    .dclk                      (clk),
    .rxrecclk_out              (),
    .refclk_p                  (GTREFCLK_P),
    .refclk_n                  (GTREFCLK_N),
    .sim_speedup_control       (1'b0),
    .coreclk_out               (sfp_coreclk),
    .qplloutclk_out            (sfp_qplloutclk),
    .qplloutrefclk_out         (sfp_qplloutrefclk),
    .qplllock_out              (sfp_qplllock),
    .txusrclk_out              (sfp_txusrclk),
    .txusrclk2_out             (sfp_txusrclk2),
    .areset_datapathclk_out    (sfp_areset_datapathclk),
    .gttxreset_out             (sfp_gttxreset),
    .gtrxreset_out             (sfp_gtrxreset),
    .txuserrdy_out             (sfp_txuserrdy),
    .reset_counter_done_out    (sfp_reset_counter_done),
    .reset                     (sfp_reset_in),
    .xgmii_txd                 (sfp_txd_int),
    .xgmii_txc                 (sfp_txc_int),
    .xgmii_rxd                 (sfp_rxd_int),
    .xgmii_rxc                 (sfp_rxc_int),
    .txp                       (SFP0_TXP),
    .txn                       (SFP0_TXN),
    .rxp                       (SFP0_RXP),
    .rxn                       (SFP0_RXN),
    .configuration_vector      (sfp_config_vector),
    .status_vector             (sfp_status_vector),
    .core_status               (),
    .resetdone_out             (sfp_resetdone),
    .signal_detect             (1'b1),
    .tx_fault                  (SFP0_TX_FAULT),
    .drp_req                   (),
    .drp_gnt                   (1'b1),
    .drp_den_o                 (),
    .drp_dwe_o                 (),
    .drp_daddr_o               (),
    .drp_di_o                  (),
    .drp_drdy_o                (),
    .drp_drpdo_o               (),
    .drp_den_i                 (1'b0),
    .drp_dwe_i                 (1'b0),
    .drp_daddr_i               (16'd0),
    .drp_di_i                  (16'd0),
    .drp_drdy_i                (1'b0),
    .drp_drpdo_i               (16'd0),
    .pma_pmd_type              (3'd0),
    .tx_disable                ()
);

fpga_core fpga_core_u0(
    .clk       (clk_156mhz_int),
    .rst       (rst_156mhz_int),
    .sfp_tx_clk(clk_156mhz_int),
    .sfp_tx_rst(rst_156mhz_int),
    .sfp_txd   (sfp_txd_int),
    .sfp_txc   (sfp_txc_int),
    .sfp_rx_clk(clk_156mhz_int),
    .sfp_rx_rst(rst_156mhz_int),
    .sfp_rxd   (sfp_rxd_int),
    .sfp_rxc   (sfp_rxc_int)
);


endmodule
