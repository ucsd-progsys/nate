
let rec digitsOfInt n =
  if n > 0 then let x = n mod 10 in (digitsOfInt n) :: x else [];;


(* fix

let rec digitsOfInt n =
  if n < 0 then [] else (let x = n mod 10 in (digitsOfInt n) @ [x]);;

*)

(* changed spans
(3,5)-(3,10)
(3,16)-(3,56)
(3,24)-(3,32)
(3,36)-(3,51)
(3,36)-(3,56)
(3,55)-(3,56)
(3,62)-(3,64)
*)

(* type error slice
(2,3)-(3,66)
(2,20)-(3,64)
(3,2)-(3,64)
(3,16)-(3,56)
(3,16)-(3,56)
(3,24)-(3,32)
(3,36)-(3,51)
(3,36)-(3,56)
(3,36)-(3,56)
(3,36)-(3,56)
(3,37)-(3,48)
(3,55)-(3,56)
*)