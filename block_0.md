## block_0

* byte_size
    * 256

|name|
|:--|
|[register_0](#block_0-register_0)|
|[register_1](#block_0-register_1)|
|[register_2](#block_0-register_2)|
|[register_3](#block_0-register_3)|
|[register_4](#block_0-register_4)|
|[register_5](#block_0-register_5)|
|[register_6](#block_0-register_6)|
|[register_7](#block_0-register_7)|
|[register_8](#block_0-register_8)|
|[register_9[4]](#block_0-register_9)|
|[register_10[2][4]](#block_0-register_10)|
|[register_11](#block_0-register_11)|
|[register_12](#block_0-register_12)|
|[register_13](#block_0-register_13)|
|[register_14](#block_0-register_14)|

### <div id="block_0-register_0"></div>register_0

* offset_address
    * 0x00
* type
    * default

|name|bit_assignments|type|initial_value|reference|comment|
|:--|:--|:--|:--|:--|:--|
|bit_field_0|[3:0]|rw|0x0||this is register_0.bit_field_0|
|bit_field_1|[7:4]|rw|0x0|||
|bit_field_2|[8]|rw|0x0|||
|bit_field_3|[10:9]|w1|0x0|||
|bit_field_4|[12:11]|wrc|0x0|||
|bit_field_5|[14:13]|wrs|0x0|||

### <div id="block_0-register_1"></div>register_1

* offset_address
    * 0x04
* type
    * default

|name|bit_assignments|type|initial_value|reference|comment|
|:--|:--|:--|:--|:--|:--|
|register_1|[0]|rw|0x0|||

### <div id="block_0-register_2"></div>register_2

* offset_address
    * 0x08
* type
    * default

|name|bit_assignments|type|initial_value|reference|comment|
|:--|:--|:--|:--|:--|:--|
|bit_field_0|[3:0]|ro||||
|bit_field_1|[11:8]|ro||||
|bit_field_2|[23:16]|rof|0xab|||
|bit_field_3|[31:24]|reserved||||

### <div id="block_0-register_3"></div>register_3

* offset_address
    * 0x08
* type
    * default

|name|bit_assignments|type|initial_value|reference|comment|
|:--|:--|:--|:--|:--|:--|
|bit_field_0|[3:0]|wo|0x0|||
|bit_field_1|[7:4]|wo1|0x0|||
|bit_field_2|[11:8]|w0trg||||
|bit_field_3|[19:16]|w1trg||||

### <div id="block_0-register_4"></div>register_4

* offset_address
    * 0x0c
* type
    * default

|name|bit_assignments|type|initial_value|reference|comment|
|:--|:--|:--|:--|:--|:--|
|bit_field_0|[3:0]|rc|0x0|||
|bit_field_1|[11:8]|rc|0x0|register_0.bit_field_0||
|bit_field_2|[15:12]|ro||register_4.bit_field_1||
|bit_field_3|[19:16]|rs|0x0|||

### <div id="block_0-register_5"></div>register_5

* offset_address
    * 0x10
* type
    * default

|name|bit_assignments|type|initial_value|reference|comment|
|:--|:--|:--|:--|:--|:--|
|bit_field_0|[1:0]|rwc|0x0|||
|bit_field_1|[3:2]|rwc|0x0|register_3.bit_field_2||
|bit_field_2|[5:4]|rws|0x0|||
|bit_field_3|[7:6]|rws|0x0|register_3.bit_field_3||
|bit_field_4|[9:8]|rwe|0x0|||
|bit_field_5|[11:10]|rwe|0x0|register_0.bit_field_2||
|bit_field_6|[13:12]|rwe|0x0|register_1||
|bit_field_7|[17:16]|rwl|0x0|||
|bit_field_8|[19:18]|rwl|0x0|register_0.bit_field_2||
|bit_field_9|[21:20]|rwl|0x0|register_1||

### <div id="block_0-register_6"></div>register_6

* offset_address
    * 0x14
* type
    * default

|name|bit_assignments|type|initial_value|reference|comment|
|:--|:--|:--|:--|:--|:--|
|bit_field_0|[3:0]|w0c|0x0|||
|bit_field_1|[7:4]|w0c|0x0|register_0.bit_field_0||
|bit_field_2|[11:8]|ro||register_6.bit_field_1||
|bit_field_3|[15:12]|w1c|0x0|||
|bit_field_4|[19:16]|w1c|0x0|register_0.bit_field_0||
|bit_field_5|[23:20]|ro||register_6.bit_field_4||
|bit_field_6|[27:24]|w0s|0x0|||
|bit_field_7|[31:28]|w1s|0x0|||
|bit_field_8|[35:32]|w0t|0x0|||
|bit_field_9|[39:36]|w1t|0x0|||

### <div id="block_0-register_7"></div>register_7

* offset_address
    * 0x1c
* type
    * default

|name|bit_assignments|type|initial_value|reference|comment|
|:--|:--|:--|:--|:--|:--|
|bit_field_0|[3:0]|w0crs|0x0|||
|bit_field_1|[11:8]|w1crs|0x0|||
|bit_field_2|[19:16]|w0src|0x0|||
|bit_field_3|[27:24]|w1src|0x0|||

### <div id="block_0-register_8"></div>register_8

* offset_address
    * 0x20
* type
    * default

|name|bit_assignments|type|initial_value|reference|comment|
|:--|:--|:--|:--|:--|:--|
|bit_field_0|[3:0]|wc|0x0|||
|bit_field_1|[11:8]|ws|0x0|||
|bit_field_2|[19:16]|woc|0x0|||
|bit_field_3|[27:24]|wos|0x0|||
|bit_field_4|[35:32]|wcrs|0x0|||
|bit_field_5|[43:40]|wsrc|0x0|||

### <div id="block_0-register_9"></div>register_9[4]

* offset_address
    * 0x30
    * 0x38
    * 0x40
    * 0x48
* type
    * default

|name|bit_assignments|type|initial_value|reference|comment|
|:--|:--|:--|:--|:--|:--|
|bit_field_0[4]|[3:0]<br>[19:16]<br>[35:32]<br>[51:48]|rw|0x0|||
|bit_field_1[4]|[7:4]<br>[23:20]<br>[39:36]<br>[55:52]|rw|default: 0x0|||
|bit_field_2[4]|[11:8]<br>[27:24]<br>[43:40]<br>[59:56]|rw|0x0<br>0x1<br>0x2<br>0x3|||

### <div id="block_0-register_10"></div>register_10[2][4]

* offset_address
    * 0x50
* type
    * indirect
* index_bit_fields
    * register_0.bit_field_0
    * register_0.bit_field_1
    * register_0.bit_field_2: 0

|name|bit_assignments|type|initial_value|reference|comment|
|:--|:--|:--|:--|:--|:--|
|bit_field_0[4]|[7:0]<br>[23:16]<br>[39:32]<br>[55:48]|rw|0x00|||
|bit_field_1[4]|[15:8]<br>[31:24]<br>[47:40]<br>[63:56]|rw|0x00|||

### <div id="block_0-register_11"></div>register_11

* offset_address
    * 0x50
* type
    * indirect
* index_bit_fields
    * register_0.bit_field_2: 1

|name|bit_assignments|type|initial_value|reference|comment|
|:--|:--|:--|:--|:--|:--|
|bit_field_0|[0]|rw|0x0|||

### <div id="block_0-register_12"></div>register_12

* offset_address
    * 0x54
* type
    * indirect
* index_bit_fields
    * register_0.bit_field_2: 1

|name|bit_assignments|type|initial_value|reference|comment|
|:--|:--|:--|:--|:--|:--|
|bit_field_0|[0]|rw|0x0|||

### <div id="block_0-register_13"></div>register_13

* offset_address
    * 0x60
* type
    * reserved

### <div id="block_0-register_14"></div>register_14

* offset_address
    * 0x80
* type
    * external
* byte_size
    * 128 bytes
