fun ilToString(l : int list) : string =
    case l of
        [] => "[]"
      | x :: xs => Int.toString x ^ "::" ^ ilToString(xs)

fun testii (s : string) (n : int * int) (m : int * int) : unit =
    case n = m of
        true => print ("Test " ^ s ^ " OK\n")
      | false => let val (x,y) = n
                     val (x',y') = m
                 in
                     print ("Test " ^ s ^ " FAILED:\n    Expected: " ^ Int.toString x' ^ " , " ^ Int.toString y'  ^ "\n    Got: " ^ Int.toString x ^ " , " ^ Int.toString y ^ "\n")
                 end

fun testil (s : string) (n : int list) (m : int list) : unit =
    case n = m of
        true => print ("Test " ^ s ^ " OK\n")
      | false => print ("Test " ^ s ^ " FAILED:\n    Expected: " ^ ilToString m ^ "\n    Got: " ^ ilToString n ^ "\n")

(* ---------------------------------------------------------------------- *)

fun fib (n : int) : int =
    case n
     of ~1 => 0
      | 0 => 1
      | 1 => 1
      | _ => fib(n-1) + fib(n-2)

(* TASK *)
fun fastfib (num : int) =  let fun helper (a, b, 0) = (a,b)
                                   | helper(a, b, n) = helper(b,a+b, n-1)
		in
			helper(0, 1,num)
		end
(* tests for fastfib *)
fun test_fastfib() =
    (
        testii "ff1" (fastfib 1) (1,1);
        testii "ff2" (fastfib 3) (2,3);
        testii "ff1" (fastfib 5) (5,8)
    )

(* TASK *)
fun merge (l1, []) =  l1
    | merge ([], l2) = l2
    | merge (a::xs1, b::xs2) = if a < b then
         a::merge(xs1, b::xs2)
     else
         b::merge(a::xs1, xs2)

fun test_merge()=
    (testil "m1" (merge([1,2],[])) [1,2];
     testil "m2" (merge([1,4, 5],[3, 7, 8])) [1, 3, 4, 5, 7, 8]
    )

fun run() =
    (test_fastfib();
     test_merge())

