
let sqsum xs =
  let f a x a x = a + (x * x) in let base = "" in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x a x = a + x in
  let base = 0 in List.fold_left (fun a  -> fun x  -> a + (x * x)) 0 xs;;

*)

(* changed spans
(3,22)-(3,29)
(3,27)-(3,28)
(3,33)-(3,74)
(3,44)-(3,46)
(3,50)-(3,74)
(3,65)-(3,66)
(3,67)-(3,71)
(3,72)-(3,74)
*)

(* type error slice
(3,2)-(3,74)
(3,8)-(3,29)
(3,10)-(3,29)
(3,12)-(3,29)
(3,33)-(3,74)
(3,44)-(3,46)
(3,50)-(3,64)
(3,50)-(3,74)
(3,65)-(3,66)
(3,67)-(3,71)
*)