
let pipe fs =
  let f a x = a (fun x  -> x) in let base f = f in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base f = f in List.fold_left f base fs;;

*)

(* changed spans
(3,2)-(3,75)
(3,14)-(3,15)
(3,14)-(3,29)
(3,16)-(3,29)
(3,33)-(3,75)
*)

(* type error slice
(3,2)-(3,75)
(3,8)-(3,29)
(3,10)-(3,29)
(3,14)-(3,15)
(3,14)-(3,29)
(3,51)-(3,65)
(3,51)-(3,75)
(3,66)-(3,67)
*)