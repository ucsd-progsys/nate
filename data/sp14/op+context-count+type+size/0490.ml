
let pipe fs =
  let f a x g = (g x) a in let base g = g in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x g = x (a g) in let base g = g in List.fold_left f base fs;;

*)

(* changed spans
(3,16)-(3,21)
(3,17)-(3,18)
(3,22)-(3,23)
(3,27)-(3,69)
*)

(* type error slice
(3,2)-(3,69)
(3,8)-(3,23)
(3,10)-(3,23)
(3,12)-(3,23)
(3,16)-(3,21)
(3,16)-(3,23)
(3,17)-(3,18)
(3,22)-(3,23)
(3,45)-(3,59)
(3,45)-(3,69)
(3,60)-(3,61)
*)