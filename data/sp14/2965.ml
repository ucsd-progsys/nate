
let rec digitsOfInt n = if n > 0 then (digitsOfInt n) / 10 else [];;


(* fix

let rec digitsOfInt n = if n > 0 then [5] @ (digitsOfInt (n / 10)) else [1];;

*)

(* changed spans
(2,38)-(2,53)
(2,38)-(2,58)
(2,51)-(2,52)
(2,64)-(2,66)
*)

(* type error slice
(2,24)-(2,66)
(2,38)-(2,58)
(2,64)-(2,66)
*)

(* all spans
(2,20)-(2,66)
(2,24)-(2,66)
(2,27)-(2,32)
(2,27)-(2,28)
(2,31)-(2,32)
(2,38)-(2,58)
(2,38)-(2,53)
(2,39)-(2,50)
(2,51)-(2,52)
(2,56)-(2,58)
(2,64)-(2,66)
*)
