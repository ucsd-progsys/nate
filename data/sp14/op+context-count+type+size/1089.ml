
let pipe fs =
  let f a x = let a = x in x a in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x x a = x a in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,30)
(3,22)-(3,23)
(3,27)-(3,30)
(3,34)-(3,76)
*)

(* type error slice
(3,14)-(3,30)
(3,22)-(3,23)
(3,27)-(3,28)
(3,27)-(3,30)
(3,29)-(3,30)
*)

(* all spans
(2,9)-(3,76)
(3,2)-(3,76)
(3,8)-(3,30)
(3,10)-(3,30)
(3,14)-(3,30)
(3,22)-(3,23)
(3,27)-(3,30)
(3,27)-(3,28)
(3,29)-(3,30)
(3,34)-(3,76)
(3,43)-(3,48)
(3,47)-(3,48)
(3,52)-(3,76)
(3,52)-(3,66)
(3,67)-(3,68)
(3,69)-(3,73)
(3,74)-(3,76)
*)
