
let rec digitsOfInt n =
  if n < 0 then [] else [] @ (([n mod 10] digitsOfInt n) / 10);;


(* fix

let rec digitsOfInt n = if n < 0 then [] else [] @ [n mod 10];;

*)

(* changed spans
(3,29)-(3,62)
(3,30)-(3,56)
(3,42)-(3,53)
(3,54)-(3,55)
(3,59)-(3,61)
*)

(* type error slice
(3,24)-(3,62)
(3,27)-(3,28)
(3,29)-(3,62)
(3,30)-(3,56)
(3,31)-(3,41)
*)

(* all spans
(2,20)-(3,62)
(3,2)-(3,62)
(3,5)-(3,10)
(3,5)-(3,6)
(3,9)-(3,10)
(3,16)-(3,18)
(3,24)-(3,62)
(3,27)-(3,28)
(3,24)-(3,26)
(3,29)-(3,62)
(3,30)-(3,56)
(3,31)-(3,41)
(3,32)-(3,40)
(3,32)-(3,33)
(3,38)-(3,40)
(3,42)-(3,53)
(3,54)-(3,55)
(3,59)-(3,61)
*)