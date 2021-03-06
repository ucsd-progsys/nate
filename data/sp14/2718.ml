
let rec digitsOfInt n =
  if n > 0 then (digitsOfInt (n / 10)) :: (n mod 10) else [];;


(* fix

let rec digitsOfInt n =
  if n > 0 then (n mod 10) :: (digitsOfInt (n / 10)) else [];;

*)

(* changed spans
(3,16)-(3,38)
(3,42)-(3,52)
(3,43)-(3,44)
(3,49)-(3,51)
*)

(* type error slice
(2,3)-(3,62)
(2,20)-(3,60)
(3,2)-(3,60)
(3,16)-(3,38)
(3,16)-(3,52)
(3,17)-(3,28)
(3,42)-(3,52)
*)

(* all spans
(2,20)-(3,60)
(3,2)-(3,60)
(3,5)-(3,10)
(3,5)-(3,6)
(3,9)-(3,10)
(3,16)-(3,52)
(3,16)-(3,38)
(3,17)-(3,28)
(3,29)-(3,37)
(3,30)-(3,31)
(3,34)-(3,36)
(3,42)-(3,52)
(3,43)-(3,44)
(3,49)-(3,51)
(3,58)-(3,60)
*)
