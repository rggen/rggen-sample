# frozen_string_literal: true

register_block {
  name 'uart_csr'
  byte_size 32

  register {
    name 'rbr'
    offset_address 0x00
    type [:indirect, ['lcr.dlab', 0]]
    comment 'Receiver Buffer Register'

    bit_field { bit_assignment lsb: 0, width: 8; type :rotrg }
  }

  register {
    name 'thr'
    offset_address 0x00
    type [:indirect, ['lcr.dlab', 0]]
    comment 'Transmitter Holding Register'

    bit_field { bit_assignment lsb: 0, width: 8; type :wotrg; initial_value 0xFF }
  }

  register {
    name 'ier'
    offset_address 0x04
    type [:indirect, ['lcr.dlab', 0]]
    comment 'Interrupt Enable Register'

    bit_field {
      name 'erbfi'; bit_assignment lsb: 0, width: 1; type :rw; initial_value 0
      comment <<~'COMMENT'
        Enable Received Data Available Interrupt
        0: Disables Received Data Available Interrupts
        1: Enables Received Data Available Interrupts
      COMMENT
    }

    bit_field {
      name 'etbei'; bit_assignment lsb: 1, width: 1; type :rw; initial_value 0
      comment <<~'COMMENT'
        Enable Transmitter Holding Register Empty Interrupt
        0: Disables Transmitter Holding Register Empty Interrupts
        1: Enables Transmitter Holding Register Interrupts
      COMMENT
    }

    bit_field {
      name 'elsi'; bit_assignment lsb: 2, width: 1; type :rw; initial_value 0
      comment <<~'COMMENT'
        Enable Receiver Line Status Interrupt
        0: Disables Receiver Line Status Interrupts
        1: Enables Receiver Line Status Interrupts
      COMMENT
    }

    bit_field {
      name 'edssi'; bit_assignment lsb: 3, width: 1; type :rw; initial_value 0
      comment <<~'COMMENT'
        Enable Modem Status Interrupt
        0: Disables Modem Status Interrupts
        1: Enables Modem Status Interrupts
      COMMENT
    }
  }

  register {
    name 'iir'
    offset_address 0x08
    comment 'Interrupt Identification Register'

    bit_field {
      name 'intpend'; bit_assignment lsb: 0, width: 1; type :ro; initial_value 1
      comment <<~'COMMENT'
        0: Interrupt is pending
        1: No interrupt is pending
      COMMENT
    }

    bit_field {
      name 'intid2'; bit_assignment lsb: 1, width: 3; type :ro; initial_value 0b000
      comment <<~'COMMENT'
        Interrupt ID
        011: Receiver Line Status (Highest)
        010: Received Data Available (Second)
        110: Character Timeout (Second)
        001: Transmitter Holding Register Empty (Third)
        000: Modem Status (Fourth)
      COMMENT
    }
  }

  register {
    name 'fcr'
    offset_address 0x08
    comment 'FIFO Control Register'

    bit_field {
      name 'fifoen'; bit_assignment lsb: 0, width: 1; type :wo; initial_value 0
      comment <<~'COMMENT'
        FIFO Enable
        1: Enables FIFOs
      COMMENT
    }

    bit_field {
      name 'rcvr_fifo_reset'; bit_assignment lsb: 1, width: 1; type :w1trg
      comment <<~'COMMENT'
        Receiver FIFO Reset
        1: Resets RCVR FIFO
      COMMENT
    }

    bit_field {
      name 'xmit_fifo_reset'; bit_assignment lsb: 2, width: 1; type :w1trg
      comment <<~'COMMENT'
        Transmitter FIFO Reset
        1: Resets XMIT FIFO
      COMMENT
    }

    bit_field {
      name 'dma_mode_select'; bit_assignment lsb: 3, width: 1; type :wo; initial_value 0
      comment <<~'COMMENT'
        DMA Mode Select
        0: Mode 0
        1: Mode 1
      COMMENT
    }

    bit_field {
      name 'rcvr_fifo_trigger_level'; bit_assignment lsb: 6, width: 2; type :wo; initial_value 0b00
      comment <<~'COMMENT'
        RCVR FIFO Trigger Level
        0b00: 1 byte
        0b01: 4 bytes
        0b10: 8 bytes
        0b11: 14 bytes
      COMMENT
    }
  }

  register {
    name 'lcr'
    offset_address 0x0C
    comment 'line control register'

    bit_field {
      name 'wls'; bit_assignment lsb: 0, width: 2; type :rw; initial_value 0b11
      comment <<~'COMMENT'
        Word Length Select
        0b00: 5 bits/character
        0b01: 6 bits/character
        0b10: 7 bits/character
        0b11: 8 bits/character
      COMMENT
    }

    bit_field {
      name 'stb'; bit_assignment lsb: 2, width: 1; type :rw; initial_value 0
      comment <<~'COMMENT'
        Number of Stop Bits
        0: 1 Stop bit
        1: 2 Stop bits or 1.5, if 5 bits/character selected
      COMMENT
    }

    bit_field {
      name 'pen'; bit_assignment lsb: 3, width: 1; type :rw; initial_value 0
      comment <<~'COMMENT'
        Parity Enable
        1: Enables parity
        0: Disables parity
      COMMENT
    }

    bit_field {
      name 'eps'; bit_assignment lsb: 4, width: 1; type :rw; initial_value 0
      comment <<~'COMMENT'
        Even Parity Select
        1: Selects Even parity
        0: Selects Odd parity
      COMMENT
    }

    bit_field {
      name 'stick_parity'; bit_assignment lsb: 5, width: 1; type :rw; initial_value 0
      comment <<~'COMMENT'
        Stick Parity
        1: Stick Parity is enabled
        0: Stick Parity is disabled
      COMMENT
    }

    bit_field {
      name 'set_break'; bit_assignment lsb: 6, width: 1; type :rw; initial_value 0
      comment <<~'COMMENT'
        Set Break
        1: Enables break condition
        0: Disables break condition
      COMMENT
    }

    bit_field {
      name 'dlab'; bit_assignment lsb: 7, width: 1; type :rw; initial_value 0
      comment <<~'COMMENT'
        Divisor Latch Access Bit.
        1: Allows access to the Divisor Latch Registers and reading of the FIFO Control Register
        0: Allows access to RBR, THR, IER and IIR registers
      COMMENT
    }
  }

  register {
    name 'mrc'
    offset_address 0x10
    comment 'Modem Control Register'

    bit_field {
      name 'dtr'; bit_assignment lsb: 0, width: 1; type :rw; initial_value 0
      comment <<~'COMMENT'
        Data Terminal Ready
        1: Drives DTRN Low
        0: Drives DTRN High
      COMMENT
    }

    bit_field {
      name 'rts'; bit_assignment lsb: 1, width: 1; type :rw; initial_value 0
      comment <<~'COMMENT'
        Request To Send
        1: Drives RTSN Low
        0: Drives RTSN High
      COMMENT
    }

    bit_field {
      name 'out1'; bit_assignment lsb: 2, width: 1; type :rw; initial_value 0
      comment <<~'COMMENT'
        User Output 1
        1: Drives OUT1N Low
        0: Drives OUT1N High
      COMMENT
    }

    bit_field {
      name 'out2'; bit_assignment lsb: 3, width: 1; type :rw; initial_value 0
      comment <<~'COMMENT'
        User Output 2
        1: Drives OUT1N Low
        0: Drives OUT1N High
      COMMENT
    }

    bit_field {
      name 'loop'; bit_assignment lsb: 4, width: 1; type :rw; initial_value 0
      comment <<~'COMMENT'
        Loop Back
        1: Enables loop back
      COMMENT
    }
  }

  register {
    name 'lsr'
    offset_address 0x14
    comment 'Line Status Register'

    bit_field {
      name 'dr'; bit_assignment lsb: 0, width: 1; type :ro; initial_value 0
      comment <<~'COMMENT'
        Data Ready
        0: All the data in RBR or FIFO is read
        1: Complete incoming character has been received and transferred into the RBR of FIFO
      COMMENT
    }

    bit_field {
      name 'oe'; bit_assignment lsb: 1, width: 1; type :rotrg; initial_value 0
      comment 'Overrun Error'
    }

    bit_field {
      name 'pe'; bit_assignment lsb: 2, width: 1; type :rotrg; initial_value 0
      comment 'Parity Error'
    }

    bit_field {
      name 'fe'; bit_assignment lsb: 3, width: 1; type :rotrg; initial_value 0
      comment 'Framing Error'
    }

    bit_field {
      name 'bi'; bit_assignment lsb: 4, width: 1; type :rotrg; initial_value 0
      comment 'Break Interrupt'
    }

    bit_field {
      name 'thre'; bit_assignment lsb: 5, width: 1; type :ro; initial_value 0
      comment <<~'COMMENT'
        Transmitter Holding Register Empty
        0: THR or Transmitter FIFO has data to transmit
        1: THR and Transmitter FIFO are empty
      COMMENT
    }

    bit_field {
      name 'temt'; bit_assignment lsb: 6, width: 1; type :ro; initial_value 0
      comment <<~'COMMENT'
        Transmitter Empty:
        0: THR or Transmitter shift register contains data
        1: THR, Transmitter FIFO and Transmitter shift register are empty
      COMMENT
    }

    bit_field {
      name 'error_in_rcvr_fifo'; bit_assignment lsb: 7, width: 1; type :ro; initial_value 0
      comment 'RCVR FIFO contains at least one receiver error (Parity, Framing, Break condition)'
    }
  }

  register {
    name 'msr'
    offset_address 0x18
    comment 'Modem Status Register'

    bit_field {
      name 'dcts'; bit_assignment lsb: 0, width: 1; type :rotrg; initial_value 0
      comment <<~'COMMENT'
        Delta Clear To Send
        Change in CTSN after last MSR read
      COMMENT
    }

    bit_field {
      name 'ddsr'; bit_assignment lsb: 1, width: 1; type :rotrg; initial_value 0
      comment <<~'COMMENT'
        Delta Data Set Ready
        Change in DSRN after last MSR read
      COMMENT
    }

    bit_field {
      name 'teri'; bit_assignment lsb: 2, width: 1; type :ro; initial_value 0
      comment <<~'COMMENT'
        Trailing Edge Ring Indicator
        RIN has changed from a Low to a High
      COMMENT
    }

    bit_field {
      name 'ddcd'; bit_assignment lsb: 3, width: 1; type :rotrg; initial_value 0
      comment <<~'COMMENT'
        Delta Data Carrier Detect
        Change in DCDN after last MSR read
      COMMENT
    }

    bit_field {
      name 'cts'; bit_assignment lsb: 4, width: 1; type :ro
      comment <<~'COMMENT'
        Clear To Send
        Complement of CTSN input
      COMMENT
    }

    bit_field {
      name 'dsr'; bit_assignment lsb: 5, width: 1; type :ro
      comment <<~'COMMENT'
        Data Set Ready
        Complement of DSRN input
      COMMENT
    }

    bit_field {
      name 'ri'; bit_assignment lsb: 6, width: 1; type :ro
      comment <<~'COMMENT'
        Ring Indicator
        Complement of RIN input
      COMMENT
    }

    bit_field {
      name 'dcd'; bit_assignment lsb: 7, width: 1; type :ro
      comment <<~'COMMENT'
        Data Carrier Detect
        Complement of DCDN input
      COMMENT
    }
  }

  register {
    name 'scratch'
    offset_address 0x1c
    comment 'Scratch Register'

    bit_field { bit_assignment lsb: 0, width: 8; type :rw; initial_value 0 }
  }

  register {
    name 'dll'
    offset_address 0x00
    type [:indirect, ['lcr.dlab', 1]]
    comment 'Divisor Latch (Least Significant Byte) Register'

    bit_field { bit_assignment lsb: 0, width: 8; type :rw; initial_value default: 0 }
  }

  register {
    name 'dlm'
    offset_address 0x04
    type [:indirect, ['lcr.dlab', 1]]
    comment 'Divisor Latch (Most Significant Byte) Register'

    bit_field { bit_assignment lsb: 0, width: 8; type :rw; initial_value default: 0 }
  }
}
