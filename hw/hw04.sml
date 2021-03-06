
fun ilToString(l : int list) : string =
    case l of
        [] => "[]"
      | x :: xs => Int.toString x ^ "::" ^ ilToString(xs)

fun testil (s : string) (n : int list) (m : int list) : unit =
    case n = m of
        true => print ("Test " ^ s ^ " OK\n")
      | false => print ("Test " ^ s ^ " FAILED:\n    Expected: " ^ ilToString m ^ "\n    Got: " ^ ilToString n ^ "\n")

(* ---------------------------------------------------------------------- *)

(* Purpose: add n to each element of the list l
 * Examples:
 *  add_to_each ([], 7) ==> []
 *  add_to_each (1::2::3::[], 3) ==> 4::5::6::[]
 *  add_to_each (6::5::4::[], ~3) ==> 3::2::1::[]
 *)
fun add_to_each (l : int list, n : int) : int list =
    case l of
        [] => []
      | x::xs => x + n :: add_to_each (xs, n)

fun test_add_to_each() =
    (testil "ae1" (add_to_each ([], 7)) [];
     testil "ae2" (add_to_each ([1, 2, 3], 3)) [4, 5, 6];
     testil "ae2" (add_to_each ([6, 5, 4], ~3)) [3, 2, 1])

(* Purpose: computes the list of prefix sums for the argument list.  The
 *          i-th int in the result list is the sum of the first i int's
 *          in the argument list.
 * Examples:
 *  prefixSum [] ==> []
 *  prefixSum (1::2::3::[]) ==> 1::3::6::[]
 *  prefixSum (5::3::1::[]) ==> 5::8::9::[]
 *)
fun prefixSum (l : int list) : int list =
    case l of
      [] => []
    | x::xs => x :: add_to_each (prefixSum xs, x)

(* Tests for prefixSum *)
fun test_prefix_sum() =
    (testil "ps1" (prefixSum []) [];
     testil "ps2" (prefixSum [1,2,3]) [1,3,6];
     testil "ps3" (prefixSum [5,3,1]) [5,8,9])


(* TASK *)
fun prefixSumHelp (l : int list, n : int) : int list =
    raise Fail "unimplemented"

fun test_pshelp() =
    (testil "psh1" (prefixSumHelp ([], 7)) []
     (* write tests here *)
     )

(* TASK *)
fun prefixSumFast (l : int list) : int list =
    raise Fail "unimplemented"

fun test_psfast() =    
    (testil "psf2" (prefixSumFast [1,2,3]) [1,3,6]
     (* write tests here *)
    )
        
(* ---------------------------------------------------------------------- *)

datatype rel = LT | GEQ
fun intrelcmp (a : int, b : int) : rel =
    case Int.compare(a,b) of LESS => LT | GREATER => GEQ | EQUAL => GEQ

(* TASK *)
fun filter_l (l : int list, bound : int, r : rel) : int list =
    raise Fail "unimplemented"

fun test_filter() =
     (testil "f2" (filter_l([1,2,3,4,5],2,GEQ)) [2,3,4,5];
      testil "fe" (filter_l([42,5,13,83,1,1,34,3,5,2],4,LT)) [1,1,3,2]
      (* write tests here *)
      )
     
        
(* TASK *)
fun quicksort_l (l : int list) : int list =
    raise Fail "unimplemented"

        
fun test_qs() =
     (testil "qs1" (quicksort_l [9,8,7,6,5,4,3]) [3,4,5,6,7,8,9]
      (* write tests here *)
      )

fun run() =
    (test_add_to_each();
     test_prefix_sum();
     test_pshelp();
     test_psfast();
     test_filter();
     test_qs())