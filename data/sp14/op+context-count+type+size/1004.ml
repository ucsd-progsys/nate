
let rec listReverse l = match l with | [] -> l | h::t -> [listReverse t; h];;


(* fix

let rec listReverse l =
  match l with | [] -> l | h::t -> (listReverse t) @ [h];;

*)

(* changed spans
(2,57)-(2,75)
(2,58)-(2,71)
(2,73)-(2,74)
*)

(* type error slice
(2,3)-(2,77)
(2,20)-(2,75)
(2,24)-(2,75)
(2,24)-(2,75)
(2,24)-(2,75)
(2,30)-(2,31)
(2,45)-(2,46)
(2,57)-(2,75)
(2,57)-(2,75)
(2,58)-(2,69)
(2,58)-(2,71)
(2,73)-(2,74)
*)