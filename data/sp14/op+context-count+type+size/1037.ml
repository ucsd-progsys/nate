
let rec digitsOfInt n = if n < 0 then [] else [(digitsOfInt (n / 10)) mod 10];;


(* fix

let rec digitsOfInt n = if n < 0 then [] else digitsOfInt (n / 10);;

*)

(* changed spans
(2,46)-(2,77)
(2,47)-(2,76)
(2,74)-(2,76)
*)

(* type error slice
(2,3)-(2,79)
(2,20)-(2,77)
(2,24)-(2,77)
(2,46)-(2,77)
(2,47)-(2,69)
(2,47)-(2,76)
(2,48)-(2,59)
*)