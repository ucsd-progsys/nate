
let pipe fs = let f a x x = a in let base f = f in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x a x = x in let base f = f in List.fold_left f base fs;;

*)

(* changed spans
(2,24)-(2,29)
(2,28)-(2,29)
(2,33)-(2,75)
(2,42)-(2,47)
*)

(* type error slice
(2,14)-(2,75)
(2,20)-(2,29)
(2,22)-(2,29)
(2,24)-(2,29)
(2,28)-(2,29)
(2,51)-(2,65)
(2,51)-(2,75)
(2,66)-(2,67)
*)