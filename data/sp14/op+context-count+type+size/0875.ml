
let pipe fs =
  let f a x = a + (x a) in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs y = let f a x = x a in let base = y in List.fold_left f base fs;;

*)

(* changed spans
(3,2)-(3,69)
(3,8)-(3,23)
(3,14)-(3,15)
(3,14)-(3,23)
(3,27)-(3,69)
(3,36)-(3,41)
(3,40)-(3,41)
(3,45)-(3,69)
*)

(* type error slice
(3,2)-(3,69)
(3,8)-(3,23)
(3,14)-(3,15)
(3,14)-(3,23)
(3,27)-(3,69)
(3,36)-(3,41)
(3,45)-(3,59)
(3,45)-(3,69)
(3,60)-(3,61)
(3,62)-(3,66)
*)