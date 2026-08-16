## gpio

* byte_size
    * 12
* bus_width
    * 32
* comment
    * Simple general purpose I/O controller

|name|offset_address|
|:--|:--|
|[direction](#gpio-direction)|0x0|
|[data_out](#gpio-data_out)|0x4|
|[data_in](#gpio-data_in)|0x8|

### <div id="gpio-direction"></div>direction

* offset_address
    * 0x0
* type
    * default

|name|bit_assignments|type|initial_value|reference|labels|comment|
|:--|:--|:--|:--|:--|:--|:--|
|dir|[31:0]|rw|0x00000000|||0: input, 1: output|

### <div id="gpio-data_out"></div>data_out

* offset_address
    * 0x4
* type
    * default

|name|bit_assignments|type|initial_value|reference|labels|comment|
|:--|:--|:--|:--|:--|:--|:--|
|value|[31:0]|rw|0x00000000||||

### <div id="gpio-data_in"></div>data_in

* offset_address
    * 0x8
* type
    * default

|name|bit_assignments|type|initial_value|reference|labels|comment|
|:--|:--|:--|:--|:--|:--|:--|
|value|[31:0]|ro||||Value sampled from the pins|
