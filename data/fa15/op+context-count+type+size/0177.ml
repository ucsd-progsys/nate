
let rec digitsOfInt n =
  if n < 0 then [] else [n mod 10] @ [digitsOfInt (n / 10)];;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(3,5)-(3,10)
(3,24)-(3,34)
(3,25)-(3,26)
(3,25)-(3,33)
(3,31)-(3,33)
(3,37)-(3,59)
*)

(* type error slice
(2,3)-(3,61)
(2,20)-(3,59)
(3,2)-(3,59)
(3,24)-(3,59)
(3,35)-(3,36)
(3,37)-(3,59)
(3,37)-(3,59)
(3,38)-(3,49)
(3,38)-(3,58)
*)