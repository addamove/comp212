
(* for testing *)

fun ilToString(l : int list) : string =
		case l of
			[] => "[]"
		| x :: xs => Int.toString x ^ "::" ^ ilToString(xs)

fun slToString(l : string list) : string =
		case l of
			[] => "[]"
		| x :: xs => x ^ "::" ^ slToString(xs)

fun islToString(l : (int * string) list) : string =
		case l of
			[] => "[]"
		| (n,s) :: xs => "(" ^ Int.toString n ^ "," ^ s ^ ")" ^ "::" ^ islToString(xs)

fun testisl (s : string) (n : (int * string) list) (m : (int * string) list) : unit =
		case n = m of
			true => print ("Test " ^ s ^ " OK\n")
		| false => print ("Test " ^ s ^ " FAILED:\n    Expected: " ^ islToString m ^ "\n    Got: " ^ islToString n ^ "\n")

fun testilsl (s : string) ((is,ss) : int list * string list) ((is',ss') : int list * string list) : unit =
		case (is,ss) = (is',ss') of
			true => print ("Test " ^ s ^ " OK\n")
		| false => print ("Test " ^ s ^ " FAILED:\n    Expected: " ^ ilToString is' ^ "," ^ slToString ss' ^ "\n    Got: " ^ ilToString is ^ "," ^ slToString ss ^  "\n")

fun testb (s : string) (n : bool) (m : bool) : unit =
		case n = m of
			true => print ("Test " ^ s ^ " OK\n")
		| false => print ("Test " ^ s ^ " FAILED:\n    Expected: " ^ Bool.toString m ^ "\n    Got: " ^ Bool.toString n  ^ "\n")

fun testili (s : string) ((is,i) : int list * int) ((is',i') : int list * int) : unit =
		case (is,i) = (is',i') of
			true => print ("Test " ^ s ^ " OK\n")
		| false => print ("Test " ^ s ^ " FAILED:\n    Expected: " ^ ilToString is' ^ "," ^ Int.toString i' ^ "\n    Got: " ^ ilToString is ^ "," ^ Int.toString i ^  "\n")
            
fun testil (s : string) (n : int list) (m : int list) : unit =
		case n = m of
			true => print ("Test " ^ s ^ " OK\n")
		| false => print ("Test " ^ s ^ " FAILED:\n    Expected: " ^ ilToString m ^ "\n    Got: " ^ ilToString n ^ "\n")


(* ---------------------------------------------------------------------- *)
(* performs the transformation of pairing the nth element from the first list with the nth *)
(* element of the second list. *)
(* Function is applied to a pair of lists of different length, the *)
(* length of the returned list should be the minimum of the lengths of the argument lists *)
fun zip (nil, l2 : string list) : (int * string) list = []
	| zip(l1, nil) = []
	| zip (l1, l2) = (hd (l1), hd (l2)) :: zip(tl (l1), tl (l2))

(* Tests for zip *)
fun test_zip() =
		(
			testisl "z1" (zip ([1,2], ["a","b"])) [(1,"a"), (2,"b")];
			testisl "z2" (zip ([1,2, 3], ["a","b"])) [(1,"a"), (2,"b")];
			testisl "z3" (zip ([], ["a","b"])) []
		)

(*Does the opposite of zip*)
fun unzip (l: (int * string) list)  = let fun helper (zl:(int * string) list, il: int list,sl: string list) =
					case zl
					of nil => (rev il,rev sl)
					| x::xs =>  helper(xs, (#1 x)::il, (#2 x)::sl)
		in
			helper(l, [], [])
		end

(* Tests for unzip *)
fun test_unzip() =
		(
			testilsl "u1" (unzip [(1,"a"), (2,"b")]) ([1,2], ["a","b"]);
			testilsl "u2" (unzip [(1,"a"), (2,"b"), (3, "c")]) ([1,2,3], ["a","b", "c"]);
			testilsl "u3" (unzip []) ([], [])
		)

fun lasHelp ([], x : int, acc : int) : int list * int = ([], acc)
	| lasHelp(a::xs,x, acc) = case (a = x) of
			true => lasHelp(xs, x, acc + 1)
		|false => (a::xs, acc)

(* Tests for lasHelp *)
fun test_lasHelp() =
		(
			testili "help1" (lasHelp ([2], 1, 3)) ([2], 3);
			testili "help2" (lasHelp([1, 2, 3], 4, 1)) ([1, 2, 3], 1);
			testili "help3" (lasHelp([2, 2, 6, 3], 2, 2)) ([6, 3], 4)
		)

fun look_and_say ([]:int list) : int list = []
	| look_and_say(a::l)=
		let val (l',c)=lasHelp(a::l,a,0)
		in
			c::a::look_and_say(l')
		end


fun test_look_and_say() =	
		(
			testil "ls1" (look_and_say([3,3,2,2,2,1])) ([2,3,3,2,1,1])
		)

 

fun sum (nil) = 0
	| sum (x::xs) = x + sum(xs)


fun powerset [] = []
	| powerset [x] = [[],[x]]
	| powerset (x::xs) =
		let
			val power_subset = powerset xs
		in
			(List.map (fn L => x::L) power_subset) @ power_subset
		end

fun subset_sum(nil, s) = if s = 0 then true else false
	|subset_sum (l : int list, s : int) : bool =
		case List.find (fn x => x = s) (List.map (fn il =>sum(il)) (powerset(l))) of
			SOME(x) => true
		|   NONE => false

(* Tests for subset_sum *)
fun test_subset_sum() =
		(
			testb "ss1" ( subset_sum ([], 0)) true;
			testb "ss2" ( subset_sum ([1,2,3 ,6], 4)) true;
			testb "ss3" ( subset_sum ([1,5,3,9], 7)) false
		)

    
fun run() =
		(test_zip();
			test_unzip();
			test_lasHelp();
			test_look_and_say();
			test_subset_sum()

		)