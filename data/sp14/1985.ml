
let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | 0 -> [] | _ -> [digitsOfInt (n / 10); n mod 10]);;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | 0 -> [] | _ -> (digitsOfInt (n / 10)) @ [n mod 10]);;

*)

(* changed spans
(5,38)-(5,70)
(5,39)-(5,59)
(5,61)-(5,69)
*)

(* type error slice
(2,3)-(5,73)
(2,20)-(5,71)
(3,2)-(5,71)
(5,7)-(5,71)
(5,38)-(5,70)
(5,39)-(5,50)
(5,39)-(5,59)
*)

(* all spans
(2,20)-(5,71)
(3,2)-(5,71)
(3,5)-(3,10)
(3,5)-(3,6)
(3,9)-(3,10)
(4,7)-(4,9)
(5,7)-(5,71)
(5,14)-(5,15)
(5,28)-(5,30)
(5,38)-(5,70)
(5,39)-(5,59)
(5,39)-(5,50)
(5,51)-(5,59)
(5,52)-(5,53)
(5,56)-(5,58)
(5,61)-(5,69)
(5,61)-(5,62)
(5,67)-(5,69)
*)
