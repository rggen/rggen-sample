## block_1

* byte_size
    * 128
* comment
    * this is block_1.<br>this block includes six registers.

|name|
|:--|
|[register_file_0.register_0](#block_1-register_file_0-register_0)|
|[register_file_0.register_1](#block_1-register_file_0-register_1)|
|[register_file_1.register_0[2]](#block_1-register_file_1-register_0)|
|[register_file_1.register_1[2]](#block_1-register_file_1-register_1)|
|[register_file_2[2].register_file_0.register_0[2][3]](#block_1-register_file_2-register_file_0-register_0)|
|[register_file_2[2].register_file_0.register_1](#block_1-register_file_2-register_file_0-register_1)|

### <div id="block_1-register_file_0-register_0"></div>register_file_0.register_0

* offset_address
    * 0x00
* type
    * default
* comment
    * this is register_0.<br>bit_field_0 is within this register.

|name|bit_assignments|type|initial_value|reference|comment|
|:--|:--|:--|:--|:--|:--|
|bit_field_0|[7:0]|rw|0x00|||

### <div id="block_1-register_file_0-register_1"></div>register_file_0.register_1

* offset_address
    * 0x04
* type
    * default

|name|bit_assignments|type|initial_value|reference|comment|
|:--|:--|:--|:--|:--|:--|
|bit_field_0|[7:0]|rw|0x00|||

### <div id="block_1-register_file_1-register_0"></div>register_file_1.register_0[2]

* offset_address
    * 0x10
* type
    * indirect
* index_bit_fields
    * register_file_0.register_0.bit_field_0
    * register_file_0.register_1.bit_field_0: 0

|name|bit_assignments|type|initial_value|reference|comment|
|:--|:--|:--|:--|:--|:--|
|bit_field_0|[7:0]|rw|0x00|||

### <div id="block_1-register_file_1-register_1"></div>register_file_1.register_1[2]

* offset_address
    * 0x10
* type
    * indirect
* index_bit_fields
    * register_file_0.register_0.bit_field_0
    * register_file_0.register_1.bit_field_0: 1

|name|bit_assignments|type|initial_value|reference|comment|
|:--|:--|:--|:--|:--|:--|
|bit_field_0|[7:0]|rw|0x00|||

### <div id="block_1-register_file_2-register_file_0-register_0"></div>register_file_2[2].register_file_0.register_0[2][3]

* offset_address
    * 0x20
    * 0x24
    * 0x28
    * 0x2c
    * 0x30
    * 0x34
    * 0x3c
    * 0x40
    * 0x44
    * 0x48
    * 0x4c
    * 0x50
* type
    * default

|name|bit_assignments|type|initial_value|reference|comment|
|:--|:--|:--|:--|:--|:--|
|bit_field_0[2]|[3:0]<br>[7:4]|rw|0x0|||
|bit_field_1[2]|[11:8]<br>[15:12]|rwe|0x0|register_file_0.register_0.bit_field_0||
|bit_field_2[2]|[19:16]<br>[23:20]|rwl|0x0|register_file_2.register_file_0.register_1.bit_field_0||

### <div id="block_1-register_file_2-register_file_0-register_1"></div>register_file_2[2].register_file_0.register_1

* offset_address
    * 0x38
    * 0x54
* type
    * default

|name|bit_assignments|type|initial_value|reference|comment|
|:--|:--|:--|:--|:--|:--|
|bit_field_0[2]|[0]<br>[1]|rw|0x0|||
