
let pipe fs =
  let f a x (x,a) = a in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,2)-(3,67)
(3,13)-(3,21)
(3,20)-(3,21)
(3,25)-(3,67)
(3,34)-(3,39)
*)

(* type error slice
(3,2)-(3,67)
(3,8)-(3,21)
(3,10)-(3,21)
(3,13)-(3,21)
(3,20)-(3,21)
(3,25)-(3,67)
(3,34)-(3,39)
(3,38)-(3,39)
(3,43)-(3,57)
(3,43)-(3,67)
(3,58)-(3,59)
(3,60)-(3,64)
*)