
let pipe fs =
  let f a x result = a x in let base = f 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x n = x (a n) in let base f = 0 in List.fold_left f base fs;;

*)

(* changed spans
(3,12)-(3,24)
(3,21)-(3,22)
(3,28)-(3,70)
(3,39)-(3,40)
(3,41)-(3,42)
*)

(* type error slice
(3,2)-(3,70)
(3,8)-(3,24)
(3,21)-(3,22)
(3,21)-(3,24)
(3,39)-(3,40)
(3,39)-(3,42)
(3,41)-(3,42)
*)