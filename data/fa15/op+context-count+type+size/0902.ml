
let pipe fs =
  let f a x result = a x in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x n = x (a n) in let base f = 0 in List.fold_left f base fs;;

*)

(* changed spans
(3,12)-(3,24)
(3,21)-(3,22)
(3,28)-(3,68)
(3,39)-(3,40)
*)

(* type error slice
(3,2)-(3,68)
(3,8)-(3,24)
(3,21)-(3,22)
(3,21)-(3,24)
(3,28)-(3,68)
(3,39)-(3,40)
(3,44)-(3,58)
(3,44)-(3,68)
(3,59)-(3,60)
(3,61)-(3,65)
*)