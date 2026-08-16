# frozen_string_literal: true

register_block {
  name 'gpio'
  byte_size 12
  comment 'Simple general purpose I/O controller'

  register {
    name 'direction'
    offset_address 0x0
    bit_field {
      name 'dir'; bit_assignment lsb: 0, width: 32; type :rw; initial_value 0
      comment '0: input, 1: output'
    }
  }

  register {
    name 'data_out'
    offset_address 0x4
    bit_field {
      name 'value'; bit_assignment lsb: 0, width: 32; type :rw; initial_value 0
    }
  }

  register {
    name 'data_in'
    offset_address 0x8
    bit_field {
      name 'value'; bit_assignment lsb: 0, width: 32; type :ro
      comment 'Value sampled from the pins'
    }
  }
}
