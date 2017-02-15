
let rec digitsOfInt n =
  match n with | 0 -> [] | _ -> (digitsOfInt (n / 10)) :: (n mod 10);;


(* fix

let rec digitsOfInt n =
  match n with | 0 -> [] | _ -> (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(3,32)-(3,54)
(3,58)-(3,68)
(3,59)-(3,60)
(3,65)-(3,67)
*)

(* type error slice
(2,3)-(3,70)
(2,20)-(3,68)
(3,2)-(3,68)
(3,32)-(3,54)
(3,32)-(3,68)
(3,32)-(3,68)
(3,32)-(3,68)
(3,33)-(3,44)
(3,58)-(3,68)
*)