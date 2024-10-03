# Verilog
Verilog, standardized as IEEE 1364, is a hardware description language (HDL) used to model electronic systems. It is most commonly used in the design and verification of digital circuits at the register-transfer level of abstraction.It is also used in the verification of analog circuits and mixed-signal circuits, as well as in the design of genetic circuits. In 2009, the Verilog standard (IEEE 1364-2005) was merged into the SystemVerilog standard, creating IEEE Standard 1800-2009. Since then, Verilog has been officially part of the SystemVerilog language. The current version is IEEE standard 1800-2023.
## Operators
### 1. Logical Operators
AND - && , OR - || , NOT - !

For AND(&&): If both the inputs are high the output is also high(TRUE), if one of the input is unknown then the output is also unknown, if one of the input is low so it fails.
Note: output will be 1-True, 0-False, x-Unknown

For OR(||) : If one of the input is high then the output is high else low.

For NOT(!) : It is opposite to above operations.
### 2. Bitwise Operators
AND - & , OR - |, XOR - ^, NEGATION - ~,XNOR - ~^

All these operations will happen bit by bit.

a = 111, b = 101 then y=a&b is a[2] & b[2]=y[2] .... output is 101
### 3. Shift Operators
There are two types of shift operators

Logical shift operators     : <<  and >>
Arithmetic shift operators : <<< and >>>

The shift operator in Verilog is used to shift data in a variable. The left hand side of the operator contains the variable to shift, the right hand side of the operator contains the number of shifts to perform.
The normal shifts << and >> shift your input and pad with zeros. The arithmetic shift >>> preserves the sign of the MSB of your variable. This is useful for inputs that are signed (can be positive or negative). In practice, <<< and << behave the same.
### 4. Relational Operators
< <= >= >

An expression with the relational operator will result in a 1 if the expression is evaluated to be true, and 0 if it is false. If either of the operands is X or Z, then the result will be X. Relational operators have a lower precedence than arithmetic operators and all relational operators have the same precedence.
### 5.Equality Operators
Logical: == !=
Case: === !==

Equality operators have the same precedence amongst them and are lower in precedence than relational operators. The result is 1 if true, and O if false. If either of the operands of logical-equality (==) or logical-inequality (!=) is X or Z, then the result will be X. You may use case-equality operator (===) or case-inequality operator (!==) to match including X and Z and will always have a known value.
### 6. Arthmetic Operators       
+, -, *, /, %

Performs arthmetic operations between two operands.
