
let rec digitsOfInt n = ((digitsOfInt n) / 10) @ [n mod 10];;


(* fix

let rec digitsOfInt n =
  if n > 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(2,24)-(2,46)
(2,24)-(2,59)
(2,38)-(2,39)
*)

(* type error slice
(2,24)-(2,46)
(2,24)-(2,59)
(2,47)-(2,48)
*)

(* all spans
(2,20)-(2,59)
(2,24)-(2,59)
(2,47)-(2,48)
(2,24)-(2,46)
(2,25)-(2,40)
(2,26)-(2,37)
(2,38)-(2,39)
(2,43)-(2,45)
(2,49)-(2,59)
(2,50)-(2,58)
(2,50)-(2,51)
(2,56)-(2,58)
*)
