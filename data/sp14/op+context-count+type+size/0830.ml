
let pipe fs = let f a x = [fs a] in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x y = x (a y) in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(2,14)-(2,76)
(2,26)-(2,32)
(2,27)-(2,29)
(2,30)-(2,31)
(2,36)-(2,76)
(2,47)-(2,48)
(2,52)-(2,76)
*)

(* type error slice
(2,14)-(2,76)
(2,20)-(2,32)
(2,22)-(2,32)
(2,26)-(2,32)
(2,36)-(2,76)
(2,47)-(2,48)
(2,52)-(2,66)
(2,52)-(2,76)
(2,67)-(2,68)
(2,69)-(2,73)
*)