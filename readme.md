# Bit Multiplier

Base two (binary) naturally provides an easy way to multiply two binary numbers.

[Watch a binary multiplication tutorial](http://www.youtube.com/watch?v=QW0XNZPyWUk)

For example:

Binary number 1 is "10101"

Binary number 2 is "11111"

The product is found by choosing either #1 or #2 and moving through each bit individually, using each digit to multiply against another number then adding the sum of all those numbers together.

```
     11111
   x 10101
 --------- 
	 11111
    000000
   1111100
  00000000
 111110000

11111 + 000000 + 1111100 + 00000000 + 111110000 = 1010001011
```

## Rules
- Cannot coerce the binary strings into Ruby binary or integer types
