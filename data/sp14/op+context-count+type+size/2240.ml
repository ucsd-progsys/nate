
let rec digitsOfInt n =
  if n > 0 then (n mod 10) :: ((digitsOfInt n) / 10) else [];;


(* fix

let rec digitsOfInt n =
  if n > 0 then (n mod 10) :: (digitsOfInt (n / 10)) else [];;

*)

(* changed spans
(3,30)-(3,52)
(3,44)-(3,45)
*)

(* type error slice
(2,3)-(3,62)
(2,20)-(3,60)
(3,2)-(3,60)
(3,16)-(3,52)
(3,16)-(3,52)
(3,30)-(3,52)
(3,30)-(3,52)
(3,31)-(3,46)
(3,32)-(3,43)
*)