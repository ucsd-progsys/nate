
let pipe fs = let f a x a = a x in let base a = a in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base a = a in List.fold_left f base fs;;

*)

(* changed spans
(2,24)-(2,31)
(2,28)-(2,29)
(2,28)-(2,31)
(2,35)-(2,77)
*)

(* type error slice
(2,14)-(2,77)
(2,20)-(2,31)
(2,22)-(2,31)
(2,24)-(2,31)
(2,28)-(2,29)
(2,28)-(2,31)
(2,35)-(2,77)
(2,44)-(2,49)
(2,48)-(2,49)
(2,53)-(2,67)
(2,53)-(2,77)
(2,68)-(2,69)
(2,70)-(2,74)
*)