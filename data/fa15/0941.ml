
let pipe fs =
  let f a x = a (x + x) in let base = 3 in List.fold_left f base fs;;


(* fix

let pipe fs z = let f a x = x a in let base = z in List.fold_left f base fs;;

*)

(* changed spans
(3,2)-(3,67)
(3,14)-(3,15)
(3,16)-(3,23)
(3,21)-(3,22)
(3,38)-(3,39)
*)

(* type error slice
(3,2)-(3,67)
(3,8)-(3,23)
(3,10)-(3,23)
(3,14)-(3,15)
(3,14)-(3,23)
(3,43)-(3,57)
(3,43)-(3,67)
(3,58)-(3,59)
*)

(* all spans
(2,9)-(3,67)
(3,2)-(3,67)
(3,8)-(3,23)
(3,10)-(3,23)
(3,14)-(3,23)
(3,14)-(3,15)
(3,16)-(3,23)
(3,17)-(3,18)
(3,21)-(3,22)
(3,27)-(3,67)
(3,38)-(3,39)
(3,43)-(3,67)
(3,43)-(3,57)
(3,58)-(3,59)
(3,60)-(3,64)
(3,65)-(3,67)
*)
