(* helper functions for testing -- you don't need to read these! *)

(* test a function that returns an int *)
fun testi (s : string) (n : int) (m : int) : unit =
    case n = m of
        true => print ("Test " ^ s ^ " OK\n")
      | false => print ("Test " ^ s ^ " FAILED:\n    Expected: " ^ Int.toString m ^ "\n    Got: " ^ Int.toString n ^ "\n")

(* test a function that returns a bool *)
fun testb (s : string) (n : bool) (m : bool) : unit =
    case n = m of
        true => print ("Test " ^ s ^ " OK\n")
      | false => print ("Test " ^ s ^ " FAILED:\n    Expected: " ^ Bool.toString m ^ "\n    Got: " ^ Bool.toString n  ^ "\n")

(* test a function that returns a string *)
fun tests (s : string) (n : string) (m : string) : unit =
    case n = m of
        true => print ("Test " ^ s ^ " OK\n")
      | false => print ("Test " ^ s ^ " FAILED:\n    Expected: " ^ m ^ "\n    Got: " ^ n ^ "\n")


(* ********************************************************************** 
   Lab code starts here
   **********************************************************************  *)
            
(* Purpose: double the number n
   Examples:
   double 0 ==> 0
   double 2 ==> 4
 *)
fun double (n : int) : int =
    case n of
      0 => 0
    | _ => 2 + double (n - 1)

(* Testing function for double():
   in SMLNJ do
   - test_double();
   to run the tests for this function *)
fun test_double() =
    (testi "da" (double 0) 0;
     testi "db" (double 2) 4;
     testi "dc" (double 3) 6)

(* Purpose: determine whether the number is even
   Examples:
   evenP 0 ==> true
   evenP 3 ==> false
   evenP 12 ==> true
   evenP 27 ==> false
*)
fun evenP (n : int) : bool =
    case n of
      0 => true
    | 1 => false
    | _ => evenP (n - 2)

(* Testing function for evenP *)
fun test_evenP() =
    (testb "ea" (evenP 0) true;
     testb "eb" (evenP 1) false;
     testb "ec" (evenP 12) true;
     testb "ed" (evenP 27) false)

(* TASK: Write summorial, oddP, divisibleByThree, laughs, add 
   Put tests for the functions you write in each testing function.  
*)


(* Purpose: sum all numbers from n to 0
   Examples:
   summorial 0 ==> 0
   summorial 3 ==> 6
   summorial 7 ==> 28
*)

fun summorial (n: int) : int = 
    case n of 
      0 => 0
    | _ => n + summorial (n - 1)

fun test_summorial() =
    ( 
        testi "a" (summorial 0) 0;
        testi "b" (summorial 3) 6;
        testi "c" (summorial 7) 28
     )



(* Purpose: check if number is odd
   Examples:
   oddP 0 ==> false
   oddP 2 ==> true
   oddP 3 ==> false
*)

fun oddP n =
    case n of 
    1 => false
    | 2 => true
    | _ => oddP (n - 2)

    
fun test_oddP() =
    (   testi "a" (summorial 0) 0;
        testi "b" (summorial 3) 6;
        testi "c" (summorial 7) 28
     )


(* Purpose: check if number is divisible by three
   Examples:
   divisibleByThree 0 ==> false
   divisibleByThree 2 ==> false
   divisibleByThree 9 ==> true
*)

fun divisibleByThree n =
    case n of 
    0 => true
    | 1 => false
    | 2 => false
    | _ => divisibleByThree (n - 3)


fun test_divisibleByThree() =
    ( 
        testb "a" (divisibleByThree 0) true;
        testb "b" (divisibleByThree 3) true;
        testb "c" (divisibleByThree 2) false;
        testb "d" (divisibleByThree 7) false
     )


(* Purpose: create string "hahahah...ha" with n characters
   Examples:
   laughs 0 ==> ""
   laughs 2 ==> "ha"
   laughs 9 ==> "hahahahah"
*)
fun laughs n = 
    case n of 
    0 => ""
    | _ => (case evenP n of 
            true => "a"
            | false => "h") ^ laughs (n - 1)

fun test_laughs() =
    ( 
        tests "a" (laughs 0) "";
        tests "b" (laughs 3) "hah";
        tests "c" (laughs 7) "hahahah"
     )

fun test_add() =
    ( (* write tests for add here *)
     )

fun run() =
    (test_double();
     test_evenP();
     test_summorial();
     test_oddP();
     test_divisibleByThree();
     test_laughs();
     test_add()
     )

    
