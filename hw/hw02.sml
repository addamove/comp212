(* helper functions for testing -- you don't need to read these! *)

(* test a function that returns an int *)
fun testi (s : string) (n : int) (m : int) : unit =
    case n = m of
        true => print ("Test " ^ s ^ " OK\n")
      | false => print ("Test " ^ s ^ " FAILED:\n    Expected: " ^ Int.toString m ^ "\n    Got: " ^ Int.toString n ^ "\n")

fun testii (s : string) (n : int * int) (m : int * int) : unit =
    case n = m of
        true => print ("Test " ^ s ^ " OK\n")
      | false => let val (x,y) = n
                     val (x',y') = m
                 in
                     print ("Test " ^ s ^ " FAILED:\n    Expected: " ^ Int.toString x' ^ " , " ^ Int.toString y'  ^ "\n    Got: " ^ Int.toString x ^ " , " ^ Int.toString y ^ "\n")
                 end

(* ********************************************************************** *)

(* READ THIS COMMENT!
 *
 * In this file there are various lines marked by a comment like so:
 *
 *    raise Fail "unimplemented"  (* DELETE THIS LINE *)
 *
 * You do not need to delete these lines immediately, but they should be gone by
 * the time you hand in your homework. They are placeholders for your
 * implementations of the functions specified in the homework. Without them,
 * this file would not load.
 *
 * If you remove such a line without implementing the function it is associated
 * with, this file will not load. Only remove such lines when you are ready to
 * implement their associated function.
 *)
(* Purpose: returns true if n is even, false otherwise.
   Assumes n is a natural number *)
fun evenP (n : int) : bool =
    case n
     of 0 => true
      | 1 => false
      | _ => evenP (n-2)

(* Purpose: returns true if n is odd, false otherwise.
   Assumes n is a natural number *)
fun oddP (n : int) : bool =
    case n
     of 0 => false
      | 1 => true
      | _ => oddP (n-2)

(* Purpose: returns m + n. Assumes m and n are natural numbers. *)
fun add (m : int, n : int) =
  case m of
    0 => n
  | _ => 1 + (add (m - 1, n))

(* Task: Implement and document this function. *)
(* DOCUMENTATION GOES HERE *)
fun mult (m : int, n : int) : int =
    case n of
      0 => 0
    | _ => add(m, mult(m, n - 1))

fun test_mult() =
    (
        testi "test_mult 1" (mult(4,3)) 12;
        testi "test_mult 2" (mult(0,3)) 0;
        testi "test_mult 3" (mult(4,30)) 120;
        testi "test_mult 4" (mult(0,0)) 0
     )
        
(* Task: Implement and document this function. *)
(* DOCUMENTATION GOES HERE *)
fun halves (n : int) : int * int =
    case n of
      ~1 => (0, 1)
    | 0 => (0, 0)
    | _ => halves (n - 2)

fun test_halves() = 
    (testii "h1" (halves(4)) (2,2)
     (* add more tests here *)
     )

(* Task: Implement this function. *)
(*  DOCUMENTATION GOES HERE *)
fun divmod (n : int, d : int) : int * int =
    raise Fail "divmod unimplemented"  (* DELETE THIS LINE *)

fun test_divmod() =
    (testii "d1" (divmod(100,10)) (10,0)
     (* add more tests here *)
     )

(* Task: Implement this function. *)
(* DOCUMENTATION GOES HERE *)
fun sum_digits (n : int, b : int) : int =
    raise Fail "sum_digits unimplemented"  (* DELETE THIS LINE *)

fun test_sum_digits() =
    (testi "s1" (sum_digits(123,10)) 6
     (* add more tests here *)
     )

fun run() =
    (test_mult();
     test_halves();
     test_divmod();
     test_sum_digits())
