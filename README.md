# Verilog
Verilog, standardized as IEEE 1364, is a hardware description language (HDL) used to model electronic systems. It is most commonly used in the design and verification of digital circuits at the register-transfer level of abstraction.It is also used in the verification of analog circuits and mixed-signal circuits, as well as in the design of genetic circuits. In 2009, the Verilog standard (IEEE 1364-2005) was merged into the SystemVerilog standard, creating IEEE Standard 1800-2009. Since then, Verilog has been officially part of the SystemVerilog language. The current version is IEEE standard 1800-2023.
## Abstraction Levels
1. Circuit Level : CMOS
2. Gate Level : Using logic gates like and, or.. etc.

    Y = A & B 
4. Data Flow Level : RTL(Register Transfer Level), Realized through concurrent assignments.

   Y = (A & B) | C
5. Behavioral Level : Highest level of design description.
   
         always@(a,b,sel)
            begin
               if(sel == 0)
                  out = a;
               else
                  out = b;
            end
## Data Types
Their are data types like : Net or Wire, Reg, Integer, Real, Time.

Net or Wire : Nets are continuously driven by combinational logic. They does not hold any value. The default value of Net is 'Z'.

Reg : They hold value. Values retained until updated. The default value of Reg is 'X'.
### Values
0 - Represents a logic zero.

1 - Represents a logic one.

X - Represents a unknown logic value.

Z - Represents a high-impedance value.

Default value of integer is 'X', real is '0', unknown is 'X'.
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
## Compiler Directives
$display or $write - To display/prints the message inside the command.

$strobe - Print the message in last of the execution.

$monitor - It dispalys every time when their is a change in the value of argument.

$stop - Causes  simulation to be suspended.

$finish - This task makes the simulator exit.

$time - System function returns time(64 bit).

$random - To provides a mechanism for generating random numbers(32 bit).
## Assignments
### Continuous Assignments
1. Assigns values to nets.
2. This assignments occurs whenever the value of the right-hand side changes.
3. Executes in parallel.

       wire x,y,z;
       assign x = a & c;
       assign y = a ^ b;
       assign z = b || c;
### Procedural Assignments
1. Update the value of variables under the control of the procedural flow constructs that surround them.
2. Each procedure represents a separate activity flow in verilog, all of which run in parallel.

       begin
           if (sel == 0)
               z = a;
           else
               z = b;
       end
#### Initial Block
1. Execution starts at zero simulation time.
2. Once executable only

       initial
           begin
               ........
               ........  //Parallel execution.
           end
#### Always Block
1. Repeats continuously throughout the duration of the simulation.
2. Loops continuously.

       always
           begin
                .........
           end
#### Sensitivity List
Without sensitivity list, the always block will loop continuously without waiting for a triggering event.

        always@(a or b or sel)    //Sensitivity list is (a or b or sel)
            begin
                if(sel == 1)
                    z = a;
                else
                    z = b;
            end
### Blocking Assignments
1. These are represented with the sign '='.
2. These are executed sequentially.
3. One statement blocks the execution of the other statements until it is executed.
4. Any details attached is also got added to delay in execution of next statements.
5. For combinational we use blocking assignments.

       always@(posedge clk)
           begin
               a = 1'b0;
               b = 1'b1;
               a = b;
               b = #5 a;
           end
### Non-Blocking Assignments
1. A non-blocking assignment is represented with the sign '<='.
2. Its execution is concurrent with that of the following assignment or activity.
3. For all the non-blocking assignments in a block, the right-hand sides are evaluated first. Subsequently the specified assignments are scheduled.
4. It is illegal to use a non-blocking assignment in a continuous assignment statement or in a net declaration.
5. For sequential we use non-blocking assignments.

       initial
           begin
               a <= 1'b1;
               b <= 1'b0;
               c <= b;
           end
#### if else statement
The if construct checks a specific condition and decides execution based on the result.

        always@(...)
            begin
                if(condition)
                    ----
                else
                    ----
            end
#### Case statement
Multiway decision statement that tests whether an expression matches one of a number of other expressions and branches accordingly.

        always@(a or b or c or x)
            begin
                case (x)
                    0 : z = a;
                    1 : z = b;
                    default : z = c;
                endcase
            end
#### for loop

for(i=0;i<10;i++)
#### while loop
Executes a statement until the expression becomes false.

While(...)
## Combinational Circuits
### Encoders
1. Converts human understandable into machine understandable codes.
2. Assign a binary code to an active input line.
3. Produces n no. of outputs where there is 2^n no. of outputs.
### Decoders
1. Converts machine understandable into human understandable codes.
2. Convert 2^n no. of outputs where there is n no. of outputs.
3. Used in wide variety of applications, including data demultiplexing, seven segement displays, and memory address decoding.
### Mux (Multiplexer)
1. A device that selects between several analog or digital signals and forwards the selected input signal to a single output line.
2. The selection is directed by a seperate set of digital input select lines.
3. It consists of 2^n inputs , n no. of select lines.

// Note: For Mux we must refer Shannon's expression.

        Shannon's expression for a 2:1 Mux is Y= ~S.I0 + S.I1
        Shannon's expression for a 4:1 Mux is Y= ~S1.~S0.I0 + ~S1.S0.I1 + S1.~S0.I2 + S1.S0.I3
### DeMux (Demultiplexer)
1. A device that takes single input signal and then selects one output single line.
2. The selection is directed by a seperate set of digital input select lines.
3. It consists of 2^n ouputs , n no. of select lines.
## Sequential Circuits
### Latch
Latches are digital circuits that store a single bit of information and hold its value until it is updated by new input signals. They are used in digital systems as temporary storage elements to store binary information.

In digital electronics different types of latches are:
1. SR Latches
2. Gated SR Latches
3. D Latches
4. Gated D Latches
5. JK Latches
6. T Laches
### Flip Flop
Flip-flops and latches are used as data storage elements to store a single bit (binary digit) of data; one of its two states represents a "one" and the other represents a "zero". Such data storage can be used for storage of state, and such a circuit is described as sequential logic in electronics.

Given Below are the Types of Flip-Flop
1. SR Flip Flop
2. JK Flip Flop
3. D Flip Flop
4. T Flip Flop
### Registers
1. Group of many flipflops to store mulltiple bits of information is called Register.
2. Register can be used to perform the following two different functions.
       1. Data storing
       2. Data shifting (SISO, SIPO, PISO, PIPO)
### Counters
1. It counts the number of clock pulses.
2. Counting can be done by sequential or random manner.
## FSM
1. Systematic way of specifying any sequential logic.
2. Different models in FSM are :
       1. Mealy Model
       2. Moore Model
### Mealy 
1. Output depends on both input & current state of the circuit
2. Next state is dependent on both input & current state.
3. Outputs are Asynchronous. So, glitches can occur.
4. Less number of states. Obviously, less number of flipflops are sufficient for implementation.
5. Not safe to use.
6. Area efficient.
7. ### Mealy 
1. Output depends on both input & current state of the circuit
2. Next state is dependent on both input & current state.
3. Outputs are Asynchronous. So, glitches can occur.
4. Less number of states. Obviously, less number of flipflops are sufficient for implementation.
5. Not safe to use.
6. Area efficient.
