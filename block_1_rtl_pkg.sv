package block_1_rtl_pkg;
  localparam int REGISTER_FILE_0_REGISTER_0_BYTE_WIDTH = 4;
  localparam int REGISTER_FILE_0_REGISTER_0_BYTE_SIZE = 4;
  localparam bit [6:0] REGISTER_FILE_0_REGISTER_0_BYTE_OFFSET = 7'h00;
  localparam int REGISTER_FILE_0_REGISTER_0_BIT_FIELD_0_BIT_WIDTH = 8;
  localparam bit [7:0] REGISTER_FILE_0_REGISTER_0_BIT_FIELD_0_BIT_MASK = 8'hff;
  localparam int REGISTER_FILE_0_REGISTER_0_BIT_FIELD_0_BIT_OFFSET = 0;
  localparam int REGISTER_FILE_0_REGISTER_1_BYTE_WIDTH = 4;
  localparam int REGISTER_FILE_0_REGISTER_1_BYTE_SIZE = 4;
  localparam bit [6:0] REGISTER_FILE_0_REGISTER_1_BYTE_OFFSET = 7'h04;
  localparam int REGISTER_FILE_0_REGISTER_1_BIT_FIELD_0_BIT_WIDTH = 8;
  localparam bit [7:0] REGISTER_FILE_0_REGISTER_1_BIT_FIELD_0_BIT_MASK = 8'hff;
  localparam int REGISTER_FILE_0_REGISTER_1_BIT_FIELD_0_BIT_OFFSET = 0;
  localparam int REGISTER_FILE_1_REGISTER_0_BYTE_WIDTH = 4;
  localparam int REGISTER_FILE_1_REGISTER_0_BYTE_SIZE = 4;
  localparam int REGISTER_FILE_1_REGISTER_0_ARRAY_SIZE[1] = '{2};
  localparam bit [6:0] REGISTER_FILE_1_REGISTER_0_BYTE_OFFSET[2] = '{7'h10, 7'h10};
  localparam int REGISTER_FILE_1_REGISTER_0_BIT_FIELD_0_BIT_WIDTH = 8;
  localparam bit [7:0] REGISTER_FILE_1_REGISTER_0_BIT_FIELD_0_BIT_MASK = 8'hff;
  localparam int REGISTER_FILE_1_REGISTER_0_BIT_FIELD_0_BIT_OFFSET = 0;
  localparam int REGISTER_FILE_1_REGISTER_1_BYTE_WIDTH = 4;
  localparam int REGISTER_FILE_1_REGISTER_1_BYTE_SIZE = 4;
  localparam int REGISTER_FILE_1_REGISTER_1_ARRAY_SIZE[1] = '{2};
  localparam bit [6:0] REGISTER_FILE_1_REGISTER_1_BYTE_OFFSET[2] = '{7'h10, 7'h10};
  localparam int REGISTER_FILE_1_REGISTER_1_BIT_FIELD_0_BIT_WIDTH = 8;
  localparam bit [7:0] REGISTER_FILE_1_REGISTER_1_BIT_FIELD_0_BIT_MASK = 8'hff;
  localparam int REGISTER_FILE_1_REGISTER_1_BIT_FIELD_0_BIT_OFFSET = 0;
  localparam int REGISTER_FILE_2_REGISTER_FILE_0_REGISTER_0_BYTE_WIDTH = 4;
  localparam int REGISTER_FILE_2_REGISTER_FILE_0_REGISTER_0_BYTE_SIZE = 48;
  localparam int REGISTER_FILE_2_REGISTER_FILE_0_REGISTER_0_ARRAY_SIZE[3] = '{2, 2, 3};
  localparam bit [6:0] REGISTER_FILE_2_REGISTER_FILE_0_REGISTER_0_BYTE_OFFSET[2][2][3] = '{'{'{7'h20, 7'h24, 7'h28}, '{7'h2c, 7'h30, 7'h34}}, '{'{7'h3c, 7'h40, 7'h44}, '{7'h48, 7'h4c, 7'h50}}};
  localparam int REGISTER_FILE_2_REGISTER_FILE_0_REGISTER_0_BIT_FIELD_0_BIT_WIDTH = 4;
  localparam bit [3:0] REGISTER_FILE_2_REGISTER_FILE_0_REGISTER_0_BIT_FIELD_0_BIT_MASK = 4'hf;
  localparam int REGISTER_FILE_2_REGISTER_FILE_0_REGISTER_0_BIT_FIELD_0_BIT_OFFSET[2] = '{0, 4};
  localparam int REGISTER_FILE_2_REGISTER_FILE_0_REGISTER_0_BIT_FIELD_1_BIT_WIDTH = 4;
  localparam bit [3:0] REGISTER_FILE_2_REGISTER_FILE_0_REGISTER_0_BIT_FIELD_1_BIT_MASK = 4'hf;
  localparam int REGISTER_FILE_2_REGISTER_FILE_0_REGISTER_0_BIT_FIELD_1_BIT_OFFSET[2] = '{8, 12};
  localparam int REGISTER_FILE_2_REGISTER_FILE_0_REGISTER_0_BIT_FIELD_2_BIT_WIDTH = 4;
  localparam bit [3:0] REGISTER_FILE_2_REGISTER_FILE_0_REGISTER_0_BIT_FIELD_2_BIT_MASK = 4'hf;
  localparam int REGISTER_FILE_2_REGISTER_FILE_0_REGISTER_0_BIT_FIELD_2_BIT_OFFSET[2] = '{16, 20};
  localparam int REGISTER_FILE_2_REGISTER_FILE_0_REGISTER_1_BYTE_WIDTH = 4;
  localparam int REGISTER_FILE_2_REGISTER_FILE_0_REGISTER_1_BYTE_SIZE = 8;
  localparam int REGISTER_FILE_2_REGISTER_FILE_0_REGISTER_1_ARRAY_SIZE[1] = '{2};
  localparam bit [6:0] REGISTER_FILE_2_REGISTER_FILE_0_REGISTER_1_BYTE_OFFSET[2] = '{7'h38, 7'h54};
  localparam int REGISTER_FILE_2_REGISTER_FILE_0_REGISTER_1_BIT_FIELD_0_BIT_WIDTH = 1;
  localparam bit REGISTER_FILE_2_REGISTER_FILE_0_REGISTER_1_BIT_FIELD_0_BIT_MASK = 1'h1;
  localparam int REGISTER_FILE_2_REGISTER_FILE_0_REGISTER_1_BIT_FIELD_0_BIT_OFFSET[2] = '{0, 1};
endpackage
