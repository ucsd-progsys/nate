
let pipe fs =
  let f a x = function | _ -> x a in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = function | v -> x (a v) in
  let base = function | y -> y in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,33)
(3,32)-(3,33)
(3,37)-(3,77)
(3,48)-(3,49)
(3,53)-(3,77)
*)

(* type error slice
(3,2)-(3,77)
(3,8)-(3,33)
(3,10)-(3,33)
(3,14)-(3,33)
(3,37)-(3,77)
(3,48)-(3,49)
(3,53)-(3,67)
(3,53)-(3,77)
(3,68)-(3,69)
(3,70)-(3,74)
*)

(* all spans
(2,9)-(3,77)
(3,2)-(3,77)
(3,8)-(3,33)
(3,10)-(3,33)
(3,14)-(3,33)
(3,30)-(3,33)
(3,30)-(3,31)
(3,32)-(3,33)
(3,37)-(3,77)
(3,48)-(3,49)
(3,53)-(3,77)
(3,53)-(3,67)
(3,68)-(3,69)
(3,70)-(3,74)
(3,75)-(3,77)
*)
