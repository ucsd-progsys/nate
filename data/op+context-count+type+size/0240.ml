
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ (n mod 10);;



let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;


(* changed spans
(3,51)-(3,52)
(3,60)-(3,61)
*)

(* type error slice
(3,27)-(3,60)
*)
