package gpio_ral_pkg;
  import uvm_pkg::*;
  import rggen_ral_pkg::*;
  `include "uvm_macros.svh"
  `include "rggen_ral_macros.svh"
  class direction_reg_model extends rggen_ral_reg;
    rand rggen_ral_field dir;
    function new(string name);
      super.new(name, 32, 0);
    endfunction
    function void build();
      `rggen_ral_create_field(dir, 0, 32, "RW", 0, 32'h00000000, '{}, 1, 0, 0, "")
    endfunction
  endclass
  class data_out_reg_model extends rggen_ral_reg;
    rand rggen_ral_field value;
    function new(string name);
      super.new(name, 32, 0);
    endfunction
    function void build();
      `rggen_ral_create_field(value, 0, 32, "RW", 0, 32'h00000000, '{}, 1, 0, 0, "")
    endfunction
  endclass
  class data_in_reg_model extends rggen_ral_reg;
    rand rggen_ral_field value;
    function new(string name);
      super.new(name, 32, 0);
    endfunction
    function void build();
      `rggen_ral_create_field(value, 0, 32, "RO", 1, 32'h00000000, '{}, 0, 0, 0, "")
    endfunction
  endclass
  class gpio_block_model extends rggen_ral_block;
    rand direction_reg_model direction;
    rand data_out_reg_model data_out;
    rand data_in_reg_model data_in;
    function new(string name);
      super.new(name, 4, 0);
    endfunction
    function void build();
      `rggen_ral_create_reg(direction, '{}, '{}, 4'h0, "RW", "g_direction.u_register")
      `rggen_ral_create_reg(data_out, '{}, '{}, 4'h4, "RW", "g_data_out.u_register")
      `rggen_ral_create_reg(data_in, '{}, '{}, 4'h8, "RO", "g_data_in.u_register")
    endfunction
  endclass
endpackage
