fun ilToString(l : int list) : string =
		case l of
			[] => "[]"
		| x :: xs => Int.toString x ^ "::" ^ ilToString(xs)

fun testil (s : string) (n : int list) (m : int list) : unit =
		case n = m of
			true => print ("Test " ^ s ^ " OK\n")
		| false => print ("Test " ^ s ^ " FAILED:\n    Expected: " ^ ilToString m ^ "\n    Got: " ^ ilToString n ^ "\n")

(* ---------------------------------------------------------------------- *)
fun evenP(n : int) : bool =
		case n
		of 0 => true
		| 1 => false
		| _ => evenP(n-2)

fun evens  nil = []
	| evens (x::xs) = if evenP(x) then x::evens(xs)
		else evens(xs)

fun test_evens() =
		(testil "e1" (evens [1,2,3,4,5]) [2,4])

(* Will merge 2 lists append([1,2], [3]) => [1,2,3]  *)
fun append(l1, l2)  = let fun helper (l1,l2) =
					case l1
					of nil => l2
					| x::xs =>  helper(xs, x::l2);;
		in
			helper(rev l1, l2)
		end

fun test_append() =
		(
			testil "a1" (append ([1,2,3],[4,5])) [1,2,3,4,5];
			testil "a2" (append ([1,2,6,7],[4,5])) [1,2,6,7,4,5];
			testil "a3" (append ([], [])) [];
			testil "a4" (append ([1,2], [])) [1,2]
		)

(* Will reverse order of elemts in list*)
fun reverse (l) = let fun helper (ol, rl) = 
					case ol
					of nil => rl
					| x::xs => helper(xs, x::rl)
		in
			helper(l,[])
		end

fun test_reverse() =
		(
			testil "r1" (reverse ([1,2,3])) [3,2,1];
			testil "r empty" (reverse ([])) [];
			testil "r one element" (reverse ([1])) [1]
		)

fun run () =
		(test_evens();
			test_append();
			test_reverse())

