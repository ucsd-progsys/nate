
let pipe fs =
  let f a x f' d = x (a d) in let base c = c in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x d = x (a d) in let base c = c in List.fold_left f base fs;;

*)

(* changed spans
(3,12)-(3,26)
*)

(* type error slice
(3,2)-(3,72)
(3,8)-(3,26)
(3,10)-(3,26)
(3,12)-(3,26)
(3,15)-(3,26)
(3,21)-(3,26)
(3,22)-(3,23)
(3,24)-(3,25)
(3,30)-(3,72)
(3,39)-(3,44)
(3,43)-(3,44)
(3,48)-(3,62)
(3,48)-(3,72)
(3,63)-(3,64)
(3,65)-(3,69)
*)

(* all spans
(2,9)-(3,72)
(3,2)-(3,72)
(3,8)-(3,26)
(3,10)-(3,26)
(3,12)-(3,26)
(3,15)-(3,26)
(3,19)-(3,26)
(3,19)-(3,20)
(3,21)-(3,26)
(3,22)-(3,23)
(3,24)-(3,25)
(3,30)-(3,72)
(3,39)-(3,44)
(3,43)-(3,44)
(3,48)-(3,72)
(3,48)-(3,62)
(3,63)-(3,64)
(3,65)-(3,69)
(3,70)-(3,72)
*)
