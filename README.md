# Digital-electronics-1
## Header 2
### Header 3

__Bold text__ _italic text_

* Menu item 1
* Menu item 2
  * Subitem 1
  * Subitem 3

1. Item 1
1. Item 2
1. Item 3
1. Item 4

[Link to google](https://google.com)

Custom | Table
------ | -----
Item in table | Item in table
Another item | Last item

```vhdl
-- (this is a VHDL comment)
/*
    this is a block comment (VHDL-2008)
*/
-- import std_logic from the IEEE library
library IEEE;
use IEEE.std_logic_1164.all;

-- this is the entity
entity ANDGATE is
  port ( 
    I1 : in std_logic;
    I2 : in std_logic;
    O  : out std_logic);
end entity ANDGATE;

-- this is the architecture
architecture RTL of ANDGATE is
begin
  O <= I1 and I2;
end architecture RTL;
```
