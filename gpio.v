`include "rggen_rtl_macros.vh"
module gpio #(
  parameter ADDRESS_WIDTH = 4,
  parameter PRE_DECODE = 0,
  parameter [ADDRESS_WIDTH-1:0] BASE_ADDRESS = 0,
  parameter ERROR_STATUS = 0,
  parameter [31:0] DEFAULT_READ_DATA = 0,
  parameter INSERT_SLICER = 0
)(
  input i_clk,
  input i_rst_n,
  input i_psel,
  input i_penable,
  input [ADDRESS_WIDTH-1:0] i_paddr,
  input [2:0] i_pprot,
  input i_pwrite,
  input [3:0] i_pstrb,
  input [31:0] i_pwdata,
  output o_pready,
  output [31:0] o_prdata,
  output o_pslverr,
  output [31:0] o_direction_dir,
  output [31:0] o_data_out_value,
  input [31:0] i_data_in_value
);
  wire w_register_valid;
  wire [1:0] w_register_access;
  wire [3:0] w_register_address;
  wire [31:0] w_register_write_data;
  wire [31:0] w_register_strobe;
  wire [2:0] w_register_active;
  wire [2:0] w_register_ready;
  wire [5:0] w_register_status;
  wire [95:0] w_register_read_data;
  wire [95:0] w_register_value;
  rggen_apb_adapter #(
    .ADDRESS_WIDTH        (ADDRESS_WIDTH),
    .LOCAL_ADDRESS_WIDTH  (4),
    .BUS_WIDTH            (32),
    .REGISTERS            (3),
    .PRE_DECODE           (PRE_DECODE),
    .BASE_ADDRESS         (BASE_ADDRESS),
    .BYTE_SIZE            (12),
    .ERROR_STATUS         (ERROR_STATUS),
    .DEFAULT_READ_DATA    (DEFAULT_READ_DATA),
    .INSERT_SLICER        (INSERT_SLICER)
  ) u_adapter (
    .i_clk                  (i_clk),
    .i_rst_n                (i_rst_n),
    .i_psel                 (i_psel),
    .i_penable              (i_penable),
    .i_paddr                (i_paddr),
    .i_pprot                (i_pprot),
    .i_pwrite               (i_pwrite),
    .i_pstrb                (i_pstrb),
    .i_pwdata               (i_pwdata),
    .o_pready               (o_pready),
    .o_prdata               (o_prdata),
    .o_pslverr              (o_pslverr),
    .o_register_valid       (w_register_valid),
    .o_register_access      (w_register_access),
    .o_register_address     (w_register_address),
    .o_register_write_data  (w_register_write_data),
    .o_register_strobe      (w_register_strobe),
    .i_register_active      (w_register_active),
    .i_register_ready       (w_register_ready),
    .i_register_status      (w_register_status),
    .i_register_read_data   (w_register_read_data)
  );
  generate if (1) begin : g_direction
    wire w_bit_field_read_valid;
    wire w_bit_field_write_valid;
    wire [31:0] w_bit_field_mask;
    wire [31:0] w_bit_field_write_data;
    wire [31:0] w_bit_field_read_data;
    wire [31:0] w_bit_field_value;
    `rggen_tie_off_unused_signals(32, 32'hffffffff, w_bit_field_read_data, w_bit_field_value)
    rggen_default_register #(
      .READABLE       (1),
      .WRITABLE       (1),
      .ADDRESS_WIDTH  (4),
      .OFFSET_ADDRESS (4'h0),
      .BUS_WIDTH      (32),
      .DATA_WIDTH     (32)
    ) u_register (
      .i_clk                    (i_clk),
      .i_rst_n                  (i_rst_n),
      .i_register_valid         (w_register_valid),
      .i_register_access        (w_register_access),
      .i_register_address       (w_register_address),
      .i_register_write_data    (w_register_write_data),
      .i_register_strobe        (w_register_strobe),
      .o_register_active        (w_register_active[0+:1]),
      .o_register_ready         (w_register_ready[0+:1]),
      .o_register_status        (w_register_status[0+:2]),
      .o_register_read_data     (w_register_read_data[0+:32]),
      .o_register_value         (w_register_value[0+:32]),
      .o_bit_field_read_valid   (w_bit_field_read_valid),
      .o_bit_field_write_valid  (w_bit_field_write_valid),
      .o_bit_field_mask         (w_bit_field_mask),
      .o_bit_field_write_data   (w_bit_field_write_data),
      .i_bit_field_read_data    (w_bit_field_read_data),
      .i_bit_field_value        (w_bit_field_value)
    );
    if (1) begin : g_dir
      rggen_bit_field #(
        .WIDTH          (32),
        .INITIAL_VALUE  (32'h00000000),
        .SW_WRITE_ONCE  (0),
        .TRIGGER        (0)
      ) u_bit_field (
        .i_clk              (i_clk),
        .i_rst_n            (i_rst_n),
        .i_sw_read_valid    (w_bit_field_read_valid),
        .i_sw_write_valid   (w_bit_field_write_valid),
        .i_sw_write_enable  (1'b1),
        .i_sw_mask          (w_bit_field_mask[0+:32]),
        .i_sw_write_data    (w_bit_field_write_data[0+:32]),
        .o_sw_read_data     (w_bit_field_read_data[0+:32]),
        .o_sw_value         (w_bit_field_value[0+:32]),
        .o_write_trigger    (),
        .o_read_trigger     (),
        .i_hw_write_enable  (1'b0),
        .i_hw_write_data    ({32{1'b0}}),
        .i_hw_set           ({32{1'b0}}),
        .i_hw_clear         ({32{1'b0}}),
        .i_value            ({32{1'b0}}),
        .i_mask             ({32{1'b1}}),
        .o_value            (o_direction_dir),
        .o_value_unmasked   ()
      );
    end
  end endgenerate
  generate if (1) begin : g_data_out
    wire w_bit_field_read_valid;
    wire w_bit_field_write_valid;
    wire [31:0] w_bit_field_mask;
    wire [31:0] w_bit_field_write_data;
    wire [31:0] w_bit_field_read_data;
    wire [31:0] w_bit_field_value;
    `rggen_tie_off_unused_signals(32, 32'hffffffff, w_bit_field_read_data, w_bit_field_value)
    rggen_default_register #(
      .READABLE       (1),
      .WRITABLE       (1),
      .ADDRESS_WIDTH  (4),
      .OFFSET_ADDRESS (4'h4),
      .BUS_WIDTH      (32),
      .DATA_WIDTH     (32)
    ) u_register (
      .i_clk                    (i_clk),
      .i_rst_n                  (i_rst_n),
      .i_register_valid         (w_register_valid),
      .i_register_access        (w_register_access),
      .i_register_address       (w_register_address),
      .i_register_write_data    (w_register_write_data),
      .i_register_strobe        (w_register_strobe),
      .o_register_active        (w_register_active[1+:1]),
      .o_register_ready         (w_register_ready[1+:1]),
      .o_register_status        (w_register_status[2+:2]),
      .o_register_read_data     (w_register_read_data[32+:32]),
      .o_register_value         (w_register_value[32+:32]),
      .o_bit_field_read_valid   (w_bit_field_read_valid),
      .o_bit_field_write_valid  (w_bit_field_write_valid),
      .o_bit_field_mask         (w_bit_field_mask),
      .o_bit_field_write_data   (w_bit_field_write_data),
      .i_bit_field_read_data    (w_bit_field_read_data),
      .i_bit_field_value        (w_bit_field_value)
    );
    if (1) begin : g_value
      rggen_bit_field #(
        .WIDTH          (32),
        .INITIAL_VALUE  (32'h00000000),
        .SW_WRITE_ONCE  (0),
        .TRIGGER        (0)
      ) u_bit_field (
        .i_clk              (i_clk),
        .i_rst_n            (i_rst_n),
        .i_sw_read_valid    (w_bit_field_read_valid),
        .i_sw_write_valid   (w_bit_field_write_valid),
        .i_sw_write_enable  (1'b1),
        .i_sw_mask          (w_bit_field_mask[0+:32]),
        .i_sw_write_data    (w_bit_field_write_data[0+:32]),
        .o_sw_read_data     (w_bit_field_read_data[0+:32]),
        .o_sw_value         (w_bit_field_value[0+:32]),
        .o_write_trigger    (),
        .o_read_trigger     (),
        .i_hw_write_enable  (1'b0),
        .i_hw_write_data    ({32{1'b0}}),
        .i_hw_set           ({32{1'b0}}),
        .i_hw_clear         ({32{1'b0}}),
        .i_value            ({32{1'b0}}),
        .i_mask             ({32{1'b1}}),
        .o_value            (o_data_out_value),
        .o_value_unmasked   ()
      );
    end
  end endgenerate
  generate if (1) begin : g_data_in
    wire w_bit_field_read_valid;
    wire w_bit_field_write_valid;
    wire [31:0] w_bit_field_mask;
    wire [31:0] w_bit_field_write_data;
    wire [31:0] w_bit_field_read_data;
    wire [31:0] w_bit_field_value;
    `rggen_tie_off_unused_signals(32, 32'hffffffff, w_bit_field_read_data, w_bit_field_value)
    rggen_default_register #(
      .READABLE       (1),
      .WRITABLE       (0),
      .ADDRESS_WIDTH  (4),
      .OFFSET_ADDRESS (4'h8),
      .BUS_WIDTH      (32),
      .DATA_WIDTH     (32)
    ) u_register (
      .i_clk                    (i_clk),
      .i_rst_n                  (i_rst_n),
      .i_register_valid         (w_register_valid),
      .i_register_access        (w_register_access),
      .i_register_address       (w_register_address),
      .i_register_write_data    (w_register_write_data),
      .i_register_strobe        (w_register_strobe),
      .o_register_active        (w_register_active[2+:1]),
      .o_register_ready         (w_register_ready[2+:1]),
      .o_register_status        (w_register_status[4+:2]),
      .o_register_read_data     (w_register_read_data[64+:32]),
      .o_register_value         (w_register_value[64+:32]),
      .o_bit_field_read_valid   (w_bit_field_read_valid),
      .o_bit_field_write_valid  (w_bit_field_write_valid),
      .o_bit_field_mask         (w_bit_field_mask),
      .o_bit_field_write_data   (w_bit_field_write_data),
      .i_bit_field_read_data    (w_bit_field_read_data),
      .i_bit_field_value        (w_bit_field_value)
    );
    if (1) begin : g_value
      rggen_bit_field #(
        .WIDTH              (32),
        .STORAGE            (0),
        .EXTERNAL_READ_DATA (1),
        .TRIGGER            (0)
      ) u_bit_field (
        .i_clk              (i_clk),
        .i_rst_n            (i_rst_n),
        .i_sw_read_valid    (w_bit_field_read_valid),
        .i_sw_write_valid   (w_bit_field_write_valid),
        .i_sw_write_enable  (1'b0),
        .i_sw_mask          (w_bit_field_mask[0+:32]),
        .i_sw_write_data    (w_bit_field_write_data[0+:32]),
        .o_sw_read_data     (w_bit_field_read_data[0+:32]),
        .o_sw_value         (w_bit_field_value[0+:32]),
        .o_write_trigger    (),
        .o_read_trigger     (),
        .i_hw_write_enable  (1'b0),
        .i_hw_write_data    ({32{1'b0}}),
        .i_hw_set           ({32{1'b0}}),
        .i_hw_clear         ({32{1'b0}}),
        .i_value            (i_data_in_value),
        .i_mask             ({32{1'b1}}),
        .o_value            (),
        .o_value_unmasked   ()
      );
    end
  end endgenerate
endmodule
