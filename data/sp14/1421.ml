
let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | 0 -> [0] | _ -> (digitsOfInt (n / 10)) @ (n mod 10));;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | 0 -> [0] | _ -> (digitsOfInt (n / 10)) @ [n mod 10]);;

*)

(* changed spans
(5,64)-(5,74)
*)

(* type error slice
(5,39)-(5,74)
(5,62)-(5,63)
(5,64)-(5,74)
*)

(* all spans
(2,20)-(5,75)
(3,2)-(5,75)
(3,5)-(3,10)
(3,5)-(3,6)
(3,9)-(3,10)
(4,7)-(4,9)
(5,7)-(5,75)
(5,14)-(5,15)
(5,28)-(5,31)
(5,29)-(5,30)
(5,39)-(5,74)
(5,62)-(5,63)
(5,39)-(5,61)
(5,40)-(5,51)
(5,52)-(5,60)
(5,53)-(5,54)
(5,57)-(5,59)
(5,64)-(5,74)
(5,65)-(5,66)
(5,71)-(5,73)
*)
