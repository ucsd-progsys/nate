
let pipe fs =
  let f a x = (a x) + (x a) in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs y = let f a x = x a in let base = y in List.fold_left f base fs;;

*)

(* changed spans
(3,2)-(3,73)
(3,8)-(3,27)
(3,14)-(3,19)
(3,14)-(3,27)
(3,15)-(3,16)
(3,22)-(3,27)
(3,23)-(3,24)
(3,31)-(3,73)
(3,40)-(3,45)
(3,44)-(3,45)
(3,49)-(3,73)
*)

(* type error slice
(3,2)-(3,73)
(3,8)-(3,27)
(3,10)-(3,27)
(3,14)-(3,19)
(3,14)-(3,27)
(3,15)-(3,16)
(3,17)-(3,18)
(3,22)-(3,27)
(3,23)-(3,24)
(3,25)-(3,26)
(3,49)-(3,63)
(3,49)-(3,73)
(3,64)-(3,65)
*)