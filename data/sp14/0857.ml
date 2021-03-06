
let rec digitsOfInt n =
  let ns = [] in
  match n with
  | 0 -> ns
  | n -> if n < 0 then [] else [(n mod 10) :: (digitsOfInt (n / 10))];;


(* fix

let rec digitsOfInt n =
  let ns = [] in
  match n with
  | 0 -> ns
  | n -> if n < 0 then [] else (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(6,31)-(6,69)
*)

(* type error slice
(2,3)-(6,71)
(2,20)-(6,69)
(3,2)-(6,69)
(4,2)-(6,69)
(6,9)-(6,69)
(6,31)-(6,69)
(6,32)-(6,68)
(6,46)-(6,68)
(6,47)-(6,58)
*)

(* all spans
(2,20)-(6,69)
(3,2)-(6,69)
(3,11)-(3,13)
(4,2)-(6,69)
(4,8)-(4,9)
(5,9)-(5,11)
(6,9)-(6,69)
(6,12)-(6,17)
(6,12)-(6,13)
(6,16)-(6,17)
(6,23)-(6,25)
(6,31)-(6,69)
(6,32)-(6,68)
(6,32)-(6,42)
(6,33)-(6,34)
(6,39)-(6,41)
(6,46)-(6,68)
(6,47)-(6,58)
(6,59)-(6,67)
(6,60)-(6,61)
(6,64)-(6,66)
*)
