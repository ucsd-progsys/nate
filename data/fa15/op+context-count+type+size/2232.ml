
let rec digitsOfInt n =
  let numL = [] in if n > 0 then ((digitsOfInt n) mod 10) :: numL else numL;;


(* fix

let rec digitsOfInt n =
  let numL = [] in if n > 0 then (n mod 10) :: numL else numL;;

*)

(* changed spans
(3,34)-(3,49)
(3,35)-(3,46)
*)

(* type error slice
(2,3)-(3,77)
(2,20)-(3,75)
(3,2)-(3,75)
(3,19)-(3,75)
(3,33)-(3,57)
(3,33)-(3,65)
(3,34)-(3,49)
(3,35)-(3,46)
*)