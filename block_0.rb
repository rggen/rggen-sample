# frozen_string_literal: true

register_block {
  name 'block_0'
  byte_size 256

  register {
    name 'register_0'
    bit_field { name 'bit_field_0'; bit_assignment width: 4; type :rw  ; initial_value 0; comment 'this is register_0.bit_field_0' }
    bit_field { name 'bit_field_1'; bit_assignment width: 4; type :rw  ; initial_value 0 }
    bit_field { name 'bit_field_2'; bit_assignment width: 1; type :rw  ; initial_value 0 }
    bit_field { name 'bit_field_3'; bit_assignment width: 2; type :w1  ; initial_value 0 }
    bit_field { name 'bit_field_4'; bit_assignment width: 2; type :wrc ; initial_value 0 }
    bit_field { name 'bit_field_5'; bit_assignment width: 2; type :wrs ; initial_value 0 }
    bit_field { name 'bit_field_6'; bit_assignment width: 2; type :rowo; initial_value 0 }
  }

  register {
    name 'register_1'
    bit_field { bit_assignment lsb: 0, width: 1; type :rw; initial_value 0 }
  }

  register {
    name 'register_2'
    offset_address 0x08
    bit_field { name 'bit_field_0'; bit_assignment lsb:  0, width: 4; type :ro }
    bit_field { name 'bit_field_1'; bit_assignment lsb:  8, width: 4; type :ro }
    bit_field { name 'bit_field_2'; bit_assignment lsb: 16, width: 8; type :rof; initial_value 0xab }
    bit_field { name 'bit_field_3'; bit_assignment lsb: 24, width: 8; type :reserved }
  }

  register {
    name 'register_3'
    offset_address 0x08
    bit_field { name 'bit_field_0'; bit_assignment lsb:  0, width: 4; type :wo ; initial_value 0 }
    bit_field { name 'bit_field_1'; bit_assignment lsb:  4, width: 4; type :wo1; initial_value 0 }
    bit_field { name 'bit_field_2'; bit_assignment lsb:  8, width: 4; type :w0trg }
    bit_field { name 'bit_field_3'; bit_assignment lsb: 16, width: 4; type :w1trg }
  }

  register {
    name 'register_4'
    offset_address 0x0C
    bit_field { name 'bit_field_0'; bit_assignment lsb:  0, width: 4; type :rc; initial_value 0 }
    bit_field { name 'bit_field_1'; bit_assignment lsb:  8, width: 4; type :rc; initial_value 0; reference 'register_0.bit_field_0' }
    bit_field { name 'bit_field_2'; bit_assignment lsb: 12, width: 4; type :ro;                  reference 'register_4.bit_field_1' }
    bit_field { name 'bit_field_3'; bit_assignment lsb: 16, width: 4; type :rs; initial_value 0 }
  }

  register {
    name 'register_5'
    offset_address 0x10
    bit_field { name 'bit_field_0'; bit_assignment lsb:  0, width: 2; type :rwc; initial_value 0 }
    bit_field { name 'bit_field_1'; bit_assignment lsb:  2, width: 2; type :rwc; initial_value 0; reference 'register_3.bit_field_2' }
    bit_field { name 'bit_field_2'; bit_assignment lsb:  4, width: 2; type :rws; initial_value 0 }
    bit_field { name 'bit_field_3'; bit_assignment lsb:  6, width: 2; type :rws; initial_value 0; reference 'register_3.bit_field_3' }
    bit_field { name 'bit_field_4'; bit_assignment lsb:  8, width: 2; type :rwe; initial_value 0 }
    bit_field { name 'bit_field_5'; bit_assignment lsb: 10, width: 2; type :rwe; initial_value 0; reference 'register_0.bit_field_2' }
    bit_field { name 'bit_field_6'; bit_assignment lsb: 12, width: 2; type :rwe; initial_value 0; reference 'register_1' }
    bit_field { name 'bit_field_7'; bit_assignment lsb: 16, width: 2; type :rwl; initial_value 0 }
    bit_field { name 'bit_field_8'; bit_assignment lsb: 18, width: 2; type :rwl; initial_value 0; reference 'register_0.bit_field_2' }
    bit_field { name 'bit_field_9'; bit_assignment lsb: 20, width: 2; type :rwl; initial_value 0; reference 'register_1' }
  }

  register {
    name 'register_6'
    offset_address 0x14
    bit_field { name 'bit_field_0'; bit_assignment lsb:  0, width: 4; type :w0c; initial_value 0 }
    bit_field { name 'bit_field_1'; bit_assignment lsb:  4, width: 4; type :w0c; initial_value 0; reference 'register_0.bit_field_0' }
    bit_field { name 'bit_field_2'; bit_assignment lsb:  8, width: 4; type :ro ;                  reference 'register_6.bit_field_1' }
    bit_field { name 'bit_field_3'; bit_assignment lsb: 12, width: 4; type :w1c; initial_value 0 }
    bit_field { name 'bit_field_4'; bit_assignment lsb: 16, width: 4; type :w1c; initial_value 0; reference 'register_0.bit_field_0' }
    bit_field { name 'bit_field_5'; bit_assignment lsb: 20, width: 4; type :ro ;                  reference 'register_6.bit_field_4' }
    bit_field { name 'bit_field_6'; bit_assignment lsb: 24, width: 4; type :w0s; initial_value 0 }
    bit_field { name 'bit_field_7'; bit_assignment lsb: 28, width: 4; type :w1s; initial_value 0 }
    bit_field { name 'bit_field_8'; bit_assignment lsb: 32, width: 4; type :w0t; initial_value 0 }
    bit_field { name 'bit_field_9'; bit_assignment lsb: 36, width: 4; type :w1t; initial_value 0 }
  }

  register {
    name 'register_7'
    offset_address 0x1C
    bit_field { name 'bit_field_0'; bit_assignment lsb:  0, width: 4; type :w0crs; initial_value 0 }
    bit_field { name 'bit_field_1'; bit_assignment lsb:  8, width: 4; type :w1crs; initial_value 0 }
    bit_field { name 'bit_field_2'; bit_assignment lsb: 16, width: 4; type :w0src; initial_value 0 }
    bit_field { name 'bit_field_3'; bit_assignment lsb: 24, width: 4; type :w1src; initial_value 0 }
  }

  register {
    name 'register_8'
    offset_address 0x20
    bit_field { name 'bit_field_0'; bit_assignment lsb:  0, width: 4; type :wc  ; initial_value 0 }
    bit_field { name 'bit_field_1'; bit_assignment lsb:  8, width: 4; type :ws  ; initial_value 0 }
    bit_field { name 'bit_field_2'; bit_assignment lsb: 16, width: 4; type :woc ; initial_value 0 }
    bit_field { name 'bit_field_3'; bit_assignment lsb: 24, width: 4; type :wos ; initial_value 0 }
    bit_field { name 'bit_field_4'; bit_assignment lsb: 32, width: 4; type :wcrs; initial_value 0 }
    bit_field { name 'bit_field_5'; bit_assignment lsb: 40, width: 4; type :wsrc; initial_value 0 }
  }

  register {
    name 'register_9'
    offset_address 0x30
    size 4
    # bit assignments: [ 3:0] [19:16] [35:32] [51:48]
    bit_field { name 'bit_field_0'; bit_assignment lsb: 0, width: 4, sequence_size: 4, step: 16; type :rw; initial_value 0            }
    # bit assignments: [ 7:4] [23:20] [39:36] [55:52]
    bit_field { name 'bit_field_1'; bit_assignment lsb: 4, width: 4, sequence_size: 4, step: 16; type :rw; initial_value default: 0   }
    # bit assignments: [11:8] [27:24] [43:40] [59:56]
    bit_field { name 'bit_field_2'; bit_assignment lsb: 8, width: 4, sequence_size: 4, step: 16; type :rw; initial_value [0, 1, 2, 3] }
  }

  register {
    name 'register_10'
    offset_address 0x50
    size [2, 4]
    type [:indirect, 'register_0.bit_field_0', 'register_0.bit_field_1', ['register_0.bit_field_2', 0]]
    # bit assignments: [ 7:0] [23:16] [39:32] [55:48]
    bit_field { name 'bit_field_0'; bit_assignment lsb: 0, width: 8, sequence_size: 4, step: 16; type :rw; initial_value 0 }
    # bit assignments: [15:8] [31:24] [47:40] [63:56]
    bit_field { name 'bit_field_1'; bit_assignment lsb: 8, width: 8, sequence_size: 4, step: 16; type :rw; initial_value 0 }
  }

  register {
    name 'register_11'
    offset_address 0x50
    type [:indirect, ['register_0.bit_field_2', 1]]
    bit_field { name 'bit_field_0'; bit_assignment lsb: 0, width: 1; type :rw; initial_value 0 }
  }

  register {
    name 'register_12'
    offset_address 0x54
    type [:indirect, ['register_0.bit_field_2', 1]]
    bit_field { name 'bit_field_0'; bit_assignment lsb: 0, width: 1; type :rw; initial_value 0 }
  }

  register {
    name 'register_13'
    offset_address 0x60
    type :reserved
  }

  register {
    name 'register_14'
    offset_address 0x80
    size 32
    type :external
  }
}
