
let pipe fs =
  let f a x x' = x' (x a) in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x x' = x (a x') in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,17)-(3,19)
(3,20)-(3,25)
(3,23)-(3,24)
(3,29)-(3,71)
*)

(* type error slice
(3,2)-(3,71)
(3,8)-(3,25)
(3,10)-(3,25)
(3,12)-(3,25)
(3,17)-(3,19)
(3,17)-(3,25)
(3,29)-(3,71)
(3,38)-(3,43)
(3,42)-(3,43)
(3,47)-(3,61)
(3,47)-(3,71)
(3,62)-(3,63)
(3,64)-(3,68)
*)