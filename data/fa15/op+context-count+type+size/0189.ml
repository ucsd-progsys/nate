
let bigMul l1 l2 =
  let f a x = a @ 0 in
  let base = [] in let args = l2 in List.fold_left f base args;;


(* fix

let bigMul l1 l2 =
  let f a x = a @ [0] in
  let base = [] in let args = l2 in List.fold_left f base args;;

*)

(* changed spans
(3,18)-(3,19)
*)

(* type error slice
(3,14)-(3,19)
(3,16)-(3,17)
(3,18)-(3,19)
*)

(* all spans
(2,11)-(4,62)
(2,14)-(4,62)
(3,2)-(4,62)
(3,8)-(3,19)
(3,10)-(3,19)
(3,14)-(3,19)
(3,16)-(3,17)
(3,14)-(3,15)
(3,18)-(3,19)
(4,2)-(4,62)
(4,13)-(4,15)
(4,19)-(4,62)
(4,30)-(4,32)
(4,36)-(4,62)
(4,36)-(4,50)
(4,51)-(4,52)
(4,53)-(4,57)
(4,58)-(4,62)
*)
