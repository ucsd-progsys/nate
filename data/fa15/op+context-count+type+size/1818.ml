
let pipe fs =
  let f a x a = x a in let base a = fs in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x a = x a in let base fs = fs in List.fold_left f base fs;;

*)

(* changed spans
(3,32)-(3,38)
*)

(* type error slice
(3,2)-(3,66)
(3,8)-(3,19)
(3,10)-(3,19)
(3,12)-(3,19)
(3,16)-(3,17)
(3,16)-(3,19)
(3,23)-(3,66)
(3,32)-(3,38)
(3,36)-(3,38)
(3,42)-(3,56)
(3,42)-(3,66)
(3,57)-(3,58)
(3,59)-(3,63)
(3,64)-(3,66)
*)