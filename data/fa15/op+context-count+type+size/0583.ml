
let rec digitsOfInt n =
  match n <= 0 with
  | true  -> []
  | false  -> [digitsOfInt (n / 10); n mod 10];;


(* fix

let rec digitsOfInt n =
  match n <= 0 with
  | true  -> []
  | false  -> (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(5,14)-(5,46)
(5,15)-(5,35)
(5,37)-(5,38)
(5,37)-(5,45)
(5,43)-(5,45)
*)

(* type error slice
(2,3)-(5,48)
(2,20)-(5,46)
(3,2)-(5,46)
(5,14)-(5,46)
(5,14)-(5,46)
(5,15)-(5,26)
(5,15)-(5,35)
*)