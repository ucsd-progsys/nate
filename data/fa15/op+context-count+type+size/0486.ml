
let pipe fs =
  let f a x combine x = x a in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x c = x (a c) in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,12)-(3,27)
(3,20)-(3,27)
(3,26)-(3,27)
(3,31)-(3,73)
(3,40)-(3,45)
*)

(* type error slice
(3,2)-(3,73)
(3,8)-(3,27)
(3,10)-(3,27)
(3,12)-(3,27)
(3,20)-(3,27)
(3,24)-(3,25)
(3,24)-(3,27)
(3,26)-(3,27)
(3,49)-(3,63)
(3,49)-(3,73)
(3,64)-(3,65)
*)