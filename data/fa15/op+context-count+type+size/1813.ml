
let pipe fs = let f a x = a x in let base fs = fs in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x x a = x a in let base fs = fs in List.fold_left f base fs;;

*)

(* changed spans
(2,14)-(2,77)
(2,26)-(2,27)
(2,26)-(2,29)
(2,28)-(2,29)
(2,33)-(2,77)
(2,42)-(2,49)
*)

(* type error slice
(2,14)-(2,77)
(2,20)-(2,29)
(2,22)-(2,29)
(2,26)-(2,27)
(2,26)-(2,29)
(2,53)-(2,67)
(2,53)-(2,77)
(2,68)-(2,69)
*)