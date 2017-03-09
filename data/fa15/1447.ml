
let rec clone x n =
  match n with | 1 -> [x] | n' -> List.append clone x (n - 1) [];;


(* fix

let rec clone x n =
  match n with | 1 -> [x] | n' -> List.append (clone x (n - 1)) [];;

*)

(* changed spans
(3,34)-(3,64)
(3,46)-(3,51)
*)

(* type error slice
(3,34)-(3,45)
(3,34)-(3,64)
*)

(* all spans
(2,14)-(3,64)
(2,16)-(3,64)
(3,2)-(3,64)
(3,8)-(3,9)
(3,22)-(3,25)
(3,23)-(3,24)
(3,34)-(3,64)
(3,34)-(3,45)
(3,46)-(3,51)
(3,52)-(3,53)
(3,54)-(3,61)
(3,55)-(3,56)
(3,59)-(3,60)
(3,62)-(3,64)
*)