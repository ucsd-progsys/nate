
let rec append l r = match l with | [] -> r | h::t -> h :: (append t r);;

let rec digitsOfInt n = if n <= 0 then [n] else append digitsOfInt (n / 10);;


(* fix

let rec append l r = match l with | [] -> r | h::t -> h :: (append t r);;

let rec digitsOfInt n =
  if n <= 0 then [n] else append (digitsOfInt (n / 10)) [n mod 10];;

*)

(* changed spans
(4,55)-(4,66)
*)

(* type error slice
(2,21)-(2,71)
(2,21)-(2,71)
(2,21)-(2,71)
(2,21)-(2,71)
(2,42)-(2,43)
(2,54)-(2,71)
(2,59)-(2,71)
(2,60)-(2,66)
(2,67)-(2,68)
(2,69)-(2,70)
(4,3)-(4,77)
(4,20)-(4,75)
(4,48)-(4,54)
(4,48)-(4,75)
(4,55)-(4,66)
(4,67)-(4,75)
*)