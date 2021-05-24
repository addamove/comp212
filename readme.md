from https://dlicata.wescreates.wesleyan.edu/teaching/fp-s21/index.html

Objectives
The purpose of this course is to introduce the theory and practice of functional programming (FP). The characteristic feature of FP is the emphasis on computing by calculation. The traditional distinction between program and data characteristic of imperative programming (IP) is replaced by an emphasis on classifying expressions by types that specify their behavior. Types include familiar (fixed and arbitrary precision) numeric types, tuples and records (structs), classified values (objects), inductive types such as trees, functions with specified inputs and outputs, and commands such as input and output. Execution of imperative programs is generalized to evaluation of well-typed expressions by a smooth extension of mathematical experience to programming practice.

The advantages of FP are significant:

Verification: There is a close correspondence between the reasoning that justifies the correctness of a program and the program itself. Principles of proof by induction go hand-in-hand with the programming technique of recursion.
Parallelism: Evaluation of compound expressions is naturally parallel in that the values of subexpressions may be determined simultaneously without fear of interference or conflict among them. This gives rise to the central concepts of the work (sequential) and span (idealized parallel) complexity of a program, and allows programs to exploit available parallelism without fear of disrupting their correctness.
Abstraction: FP stresses data-centric computation, with operations that act on compound data structures as whole, rather than via item-by-item processing. More generally, FP emphasizes the isolation of abstract types that clearly separate implementation from interface. Types are used to express and enforce abstraction boundaries, greatly enhancing maintainability of programs, and facilitating team development.
By the end of the course, we expect you to:
write functional programs
analyze their sequential and parallel complexity
reason mathematically about their behavior
structure them using abstract types
