
let pipe fs =
  let f a x combine c = x (a c) in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x c = x (a c) in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,12)-(3,31)
(3,35)-(3,77)
*)

(* type error slice
(3,2)-(3,77)
(3,8)-(3,31)
(3,10)-(3,31)
(3,12)-(3,31)
(3,20)-(3,31)
(3,26)-(3,31)
(3,27)-(3,28)
(3,29)-(3,30)
(3,35)-(3,77)
(3,44)-(3,49)
(3,48)-(3,49)
(3,53)-(3,67)
(3,53)-(3,77)
(3,68)-(3,69)
(3,70)-(3,74)
*)