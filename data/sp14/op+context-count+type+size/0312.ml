
let rec digitsOfInt n = if n < 0 then [] else [digitsOfInt (n / 10)];;


(* fix

let rec digitsOfInt n = if n < 0 then [] else digitsOfInt (n / 10);;

*)

(* changed spans
(2,46)-(2,68)
*)

(* type error slice
(2,3)-(2,70)
(2,20)-(2,68)
(2,24)-(2,68)
(2,46)-(2,68)
(2,46)-(2,68)
(2,47)-(2,58)
(2,47)-(2,67)
*)