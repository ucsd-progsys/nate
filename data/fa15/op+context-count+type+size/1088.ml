
let sqsum xs =
  let f a x = a +. (x *. x) in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a + (x * x) in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,14)-(3,27)
(3,19)-(3,27)
(3,31)-(3,71)
*)

(* type error slice
(3,2)-(3,71)
(3,8)-(3,27)
(3,14)-(3,15)
(3,14)-(3,27)
(3,31)-(3,71)
(3,42)-(3,43)
(3,47)-(3,61)
(3,47)-(3,71)
(3,62)-(3,63)
(3,64)-(3,68)
*)