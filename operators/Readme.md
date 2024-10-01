# Operators
Logical Operators

Bitwise Operators

Shift Operators

Concatenation  Operators

Relational Operators

Equality Operators

Conditional Operators

Arthmetic Operators

# Logical Operators
AND - && , OR - || , NOT - !

For AND(&&)

If both the inputs are high the output is also high(TRUE), if one of the input is unknown then the output is also unknown, if one of the input is low so it fails.
Note: output will be 1-True, 0-False, x-Unknown

For OR(||)

If one of the input is high then the output is high else low.

For NOT(!)

It is opposite to above operations.
# Bitwise Operators
AND - & , OR - |, XOR - ^, NEGATION - ~,XNOR - ~^

All these operations will happen bit by bit.

a = 111, b = 101 then y=a&b is a[2] & b[2]=y[2] .... output is 101
# Shift Operators
There are two types of shift operators

Logical shift operators     : <<  and >>
Arithmetic shift operators : <<< and >>>

The shift operator in Verilog is used to shift data in a variable. The left hand side of the operator contains the variable to shift, the right hand side of the operator contains the number of shifts to perform.
The normal shifts << and >> shift your input and pad with zeros. The arithmetic shift >>> preserves the sign of the MSB of your variable. This is useful for inputs that are signed (can be positive or negative). In practice, <<< and << behave the same.
