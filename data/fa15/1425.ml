
let rec digitsOfInt n = if n <= 0 then [] else [digitsOfInt (n mod 10)];;


(* fix

let rec digitsOfInt n = if n <= 0 then [] else (digitsOfInt (n mod 10)) @ [];;

*)

(* changed spans
(2,47)-(2,71)
(2,48)-(2,70)
*)

(* type error slice
(2,3)-(2,73)
(2,20)-(2,71)
(2,24)-(2,71)
(2,47)-(2,71)
(2,48)-(2,59)
(2,48)-(2,70)
*)

(* all spans
(2,20)-(2,71)
(2,24)-(2,71)
(2,27)-(2,33)
(2,27)-(2,28)
(2,32)-(2,33)
(2,39)-(2,41)
(2,47)-(2,71)
(2,48)-(2,70)
(2,48)-(2,59)
(2,60)-(2,70)
(2,61)-(2,62)
(2,67)-(2,69)
*)
