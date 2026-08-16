library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.rggen_rtl.all;

entity gpio is
  generic (
    ADDRESS_WIDTH: positive := 4;
    PRE_DECODE: boolean := false;
    BASE_ADDRESS: unsigned := x"0";
    ERROR_STATUS: boolean := false;
    INSERT_SLICER: boolean := false
  );
  port (
    i_clk: in std_logic;
    i_rst_n: in std_logic;
    i_psel: in std_logic;
    i_penable: in std_logic;
    i_paddr: in std_logic_vector(ADDRESS_WIDTH-1 downto 0);
    i_pprot: in std_logic_vector(2 downto 0);
    i_pwrite: in std_logic;
    i_pstrb: in std_logic_vector(3 downto 0);
    i_pwdata: in std_logic_vector(31 downto 0);
    o_pready: out std_logic;
    o_prdata: out std_logic_vector(31 downto 0);
    o_pslverr: out std_logic;
    o_direction_dir: out std_logic_vector(31 downto 0);
    o_data_out_value: out std_logic_vector(31 downto 0);
    i_data_in_value: in std_logic_vector(31 downto 0)
  );
end gpio;

architecture rtl of gpio is
  signal register_valid: std_logic;
  signal register_access: std_logic_vector(1 downto 0);
  signal register_address: std_logic_vector(3 downto 0);
  signal register_write_data: std_logic_vector(31 downto 0);
  signal register_strobe: std_logic_vector(31 downto 0);
  signal register_active: std_logic_vector(2 downto 0);
  signal register_ready: std_logic_vector(2 downto 0);
  signal register_status: std_logic_vector(5 downto 0);
  signal register_read_data: std_logic_vector(95 downto 0);
  signal register_value: std_logic_vector(95 downto 0);
begin
  u_adapter: entity work.rggen_apb_adaper
    generic map (
      ADDRESS_WIDTH       => ADDRESS_WIDTH,
      LOCAL_ADDRESS_WIDTH => 4,
      BUS_WIDTH           => 32,
      REGISTERS           => 3,
      PRE_DECODE          => PRE_DECODE,
      BASE_ADDRESS        => BASE_ADDRESS,
      BYTE_SIZE           => 12,
      ERROR_STATUS        => ERROR_STATUS,
      INSERT_SLICER       => INSERT_SLICER
    )
    port map (
      i_clk                 => i_clk,
      i_rst_n               => i_rst_n,
      i_psel                => i_psel,
      i_penable             => i_penable,
      i_paddr               => i_paddr,
      i_pprot               => i_pprot,
      i_pwrite              => i_pwrite,
      i_pstrb               => i_pstrb,
      i_pwdata              => i_pwdata,
      o_pready              => o_pready,
      o_prdata              => o_prdata,
      o_pslverr             => o_pslverr,
      o_register_valid      => register_valid,
      o_register_access     => register_access,
      o_register_address    => register_address,
      o_register_write_data => register_write_data,
      o_register_strobe     => register_strobe,
      i_register_active     => register_active,
      i_register_ready      => register_ready,
      i_register_status     => register_status,
      i_register_read_data  => register_read_data
    );
  g_direction: block
    signal bit_field_read_valid: std_logic;
    signal bit_field_write_valid: std_logic;
    signal bit_field_mask: std_logic_vector(31 downto 0);
    signal bit_field_write_data: std_logic_vector(31 downto 0);
    signal bit_field_read_data: std_logic_vector(31 downto 0);
    signal bit_field_value: std_logic_vector(31 downto 0);
  begin
    \g_tie_off\: for \__i\ in 0 to 31 generate
      g: if (bit_slice(x"ffffffff", \__i\) = '0') generate
        bit_field_read_data(\__i\) <= '0';
        bit_field_value(\__i\) <= '0';
      end generate;
    end generate;
    u_register: entity work.rggen_default_register
      generic map (
        READABLE        => true,
        WRITABLE        => true,
        ADDRESS_WIDTH   => 4,
        OFFSET_ADDRESS  => x"0",
        BUS_WIDTH       => 32,
        DATA_WIDTH      => 32
      )
      port map (
        i_clk                   => i_clk,
        i_rst_n                 => i_rst_n,
        i_register_valid        => register_valid,
        i_register_access       => register_access,
        i_register_address      => register_address,
        i_register_write_data   => register_write_data,
        i_register_strobe       => register_strobe,
        o_register_active       => register_active(0),
        o_register_ready        => register_ready(0),
        o_register_status       => register_status(1 downto 0),
        o_register_read_data    => register_read_data(31 downto 0),
        o_register_value        => register_value(31 downto 0),
        o_bit_field_read_valid  => bit_field_read_valid,
        o_bit_field_write_valid => bit_field_write_valid,
        o_bit_field_mask        => bit_field_mask,
        o_bit_field_write_data  => bit_field_write_data,
        i_bit_field_read_data   => bit_field_read_data,
        i_bit_field_value       => bit_field_value
      );
    g_dir: block
    begin
      u_bit_field: entity work.rggen_bit_field
        generic map (
          WIDTH           => 32,
          INITIAL_VALUE   => slice(x"00000000", 32, 0),
          SW_WRITE_ONCE   => false,
          TRIGGER         => false
        )
        port map (
          i_clk             => i_clk,
          i_rst_n           => i_rst_n,
          i_sw_read_valid   => bit_field_read_valid,
          i_sw_write_valid  => bit_field_write_valid,
          i_sw_write_enable => "1",
          i_sw_mask         => bit_field_mask(31 downto 0),
          i_sw_write_data   => bit_field_write_data(31 downto 0),
          o_sw_read_data    => bit_field_read_data(31 downto 0),
          o_sw_value        => bit_field_value(31 downto 0),
          o_write_trigger   => open,
          o_read_trigger    => open,
          i_hw_write_enable => "0",
          i_hw_write_data   => (others => '0'),
          i_hw_set          => (others => '0'),
          i_hw_clear        => (others => '0'),
          i_value           => (others => '0'),
          i_mask            => (others => '1'),
          o_value           => o_direction_dir,
          o_value_unmasked  => open
        );
    end block;
  end block;
  g_data_out: block
    signal bit_field_read_valid: std_logic;
    signal bit_field_write_valid: std_logic;
    signal bit_field_mask: std_logic_vector(31 downto 0);
    signal bit_field_write_data: std_logic_vector(31 downto 0);
    signal bit_field_read_data: std_logic_vector(31 downto 0);
    signal bit_field_value: std_logic_vector(31 downto 0);
  begin
    \g_tie_off\: for \__i\ in 0 to 31 generate
      g: if (bit_slice(x"ffffffff", \__i\) = '0') generate
        bit_field_read_data(\__i\) <= '0';
        bit_field_value(\__i\) <= '0';
      end generate;
    end generate;
    u_register: entity work.rggen_default_register
      generic map (
        READABLE        => true,
        WRITABLE        => true,
        ADDRESS_WIDTH   => 4,
        OFFSET_ADDRESS  => x"4",
        BUS_WIDTH       => 32,
        DATA_WIDTH      => 32
      )
      port map (
        i_clk                   => i_clk,
        i_rst_n                 => i_rst_n,
        i_register_valid        => register_valid,
        i_register_access       => register_access,
        i_register_address      => register_address,
        i_register_write_data   => register_write_data,
        i_register_strobe       => register_strobe,
        o_register_active       => register_active(1),
        o_register_ready        => register_ready(1),
        o_register_status       => register_status(3 downto 2),
        o_register_read_data    => register_read_data(63 downto 32),
        o_register_value        => register_value(63 downto 32),
        o_bit_field_read_valid  => bit_field_read_valid,
        o_bit_field_write_valid => bit_field_write_valid,
        o_bit_field_mask        => bit_field_mask,
        o_bit_field_write_data  => bit_field_write_data,
        i_bit_field_read_data   => bit_field_read_data,
        i_bit_field_value       => bit_field_value
      );
    g_value: block
    begin
      u_bit_field: entity work.rggen_bit_field
        generic map (
          WIDTH           => 32,
          INITIAL_VALUE   => slice(x"00000000", 32, 0),
          SW_WRITE_ONCE   => false,
          TRIGGER         => false
        )
        port map (
          i_clk             => i_clk,
          i_rst_n           => i_rst_n,
          i_sw_read_valid   => bit_field_read_valid,
          i_sw_write_valid  => bit_field_write_valid,
          i_sw_write_enable => "1",
          i_sw_mask         => bit_field_mask(31 downto 0),
          i_sw_write_data   => bit_field_write_data(31 downto 0),
          o_sw_read_data    => bit_field_read_data(31 downto 0),
          o_sw_value        => bit_field_value(31 downto 0),
          o_write_trigger   => open,
          o_read_trigger    => open,
          i_hw_write_enable => "0",
          i_hw_write_data   => (others => '0'),
          i_hw_set          => (others => '0'),
          i_hw_clear        => (others => '0'),
          i_value           => (others => '0'),
          i_mask            => (others => '1'),
          o_value           => o_data_out_value,
          o_value_unmasked  => open
        );
    end block;
  end block;
  g_data_in: block
    signal bit_field_read_valid: std_logic;
    signal bit_field_write_valid: std_logic;
    signal bit_field_mask: std_logic_vector(31 downto 0);
    signal bit_field_write_data: std_logic_vector(31 downto 0);
    signal bit_field_read_data: std_logic_vector(31 downto 0);
    signal bit_field_value: std_logic_vector(31 downto 0);
  begin
    \g_tie_off\: for \__i\ in 0 to 31 generate
      g: if (bit_slice(x"ffffffff", \__i\) = '0') generate
        bit_field_read_data(\__i\) <= '0';
        bit_field_value(\__i\) <= '0';
      end generate;
    end generate;
    u_register: entity work.rggen_default_register
      generic map (
        READABLE        => true,
        WRITABLE        => false,
        ADDRESS_WIDTH   => 4,
        OFFSET_ADDRESS  => x"8",
        BUS_WIDTH       => 32,
        DATA_WIDTH      => 32
      )
      port map (
        i_clk                   => i_clk,
        i_rst_n                 => i_rst_n,
        i_register_valid        => register_valid,
        i_register_access       => register_access,
        i_register_address      => register_address,
        i_register_write_data   => register_write_data,
        i_register_strobe       => register_strobe,
        o_register_active       => register_active(2),
        o_register_ready        => register_ready(2),
        o_register_status       => register_status(5 downto 4),
        o_register_read_data    => register_read_data(95 downto 64),
        o_register_value        => register_value(95 downto 64),
        o_bit_field_read_valid  => bit_field_read_valid,
        o_bit_field_write_valid => bit_field_write_valid,
        o_bit_field_mask        => bit_field_mask,
        o_bit_field_write_data  => bit_field_write_data,
        i_bit_field_read_data   => bit_field_read_data,
        i_bit_field_value       => bit_field_value
      );
    g_value: block
    begin
      u_bit_field: entity work.rggen_bit_field
        generic map (
          WIDTH               => 32,
          STORAGE             => false,
          EXTERNAL_READ_DATA  => true,
          TRIGGER             => false
        )
        port map (
          i_clk             => i_clk,
          i_rst_n           => i_rst_n,
          i_sw_read_valid   => bit_field_read_valid,
          i_sw_write_valid  => bit_field_write_valid,
          i_sw_write_enable => "0",
          i_sw_mask         => bit_field_mask(31 downto 0),
          i_sw_write_data   => bit_field_write_data(31 downto 0),
          o_sw_read_data    => bit_field_read_data(31 downto 0),
          o_sw_value        => bit_field_value(31 downto 0),
          o_write_trigger   => open,
          o_read_trigger    => open,
          i_hw_write_enable => "0",
          i_hw_write_data   => (others => '0'),
          i_hw_set          => (others => '0'),
          i_hw_clear        => (others => '0'),
          i_value           => i_data_in_value,
          i_mask            => (others => '1'),
          o_value           => open,
          o_value_unmasked  => open
        );
    end block;
  end block;
end rtl;
