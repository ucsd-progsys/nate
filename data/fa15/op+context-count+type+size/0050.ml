
let rec digitsOfInt n =
  let returnList = [] in
  if n < 0 then [] else returnList @ ((n mod 10) digitsOfInt (n /. 10));;


(* fix

let rec digitsOfInt n =
  let returnList = [] in if n < 0 then [] else digitsOfInt (n / 10);;

*)

(* changed spans
(4,24)-(4,34)
(4,24)-(4,71)
(4,35)-(4,36)
(4,37)-(4,71)
(4,38)-(4,48)
(4,39)-(4,40)
(4,49)-(4,60)
(4,61)-(4,70)
*)

(* type error slice
(4,5)-(4,6)
(4,5)-(4,10)
(4,5)-(4,10)
(4,9)-(4,10)
(4,37)-(4,71)
(4,38)-(4,48)
(4,61)-(4,70)
(4,61)-(4,70)
(4,62)-(4,63)
(4,67)-(4,69)
*)