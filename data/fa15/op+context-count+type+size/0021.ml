
let rec clone x n = match n with | 1 -> [x] | n' -> [clone x (n - 1)];;


(* fix

let rec clone x n =
  match n with | 1 -> [x] | n' -> List.append (clone x (n - 1)) [];;

*)

(* changed spans
(2,52)-(2,69)
(2,53)-(2,58)
*)

(* type error slice
(2,3)-(2,71)
(2,14)-(2,69)
(2,16)-(2,69)
(2,20)-(2,69)
(2,52)-(2,69)
(2,52)-(2,69)
(2,53)-(2,58)
(2,53)-(2,68)
*)