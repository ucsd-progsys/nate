
let rec digitsOfInt n = if n < 0 then [] else n mod 10;;


(* fix

let rec digitsOfInt n = if n < 0 then [] else [n mod 10];;

*)

(* changed spans
(2,46)-(2,54)
*)

(* type error slice
(2,24)-(2,54)
(2,24)-(2,54)
(2,38)-(2,40)
(2,46)-(2,54)
*)