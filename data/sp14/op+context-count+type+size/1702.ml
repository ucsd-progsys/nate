
let sqsum xs =
  let f a x a x = x *. x in let base = 0 in List.fold_left f base xs;;


(* fix

let sqsum xs = let f a x = x * x in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(3,2)-(3,68)
(3,8)-(3,24)
(3,10)-(3,24)
(3,18)-(3,24)
(3,28)-(3,68)
*)

(* type error slice
(3,2)-(3,68)
(3,8)-(3,24)
(3,10)-(3,24)
(3,12)-(3,24)
(3,28)-(3,68)
(3,39)-(3,40)
(3,44)-(3,58)
(3,44)-(3,68)
(3,59)-(3,60)
(3,61)-(3,65)
*)