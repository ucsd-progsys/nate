
let sqsum xs =
  let f a x = a * a in
  let base = match xs with | [] -> xs | hd::tl -> f (f hd hd) tl in
  List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a * a in
  let base = match xs with | hd::tl -> f (f hd hd) tl in
  List.fold_left f base xs;;

*)

(* changed spans
(4,13)-(4,64)
(4,19)-(4,21)
*)

(* type error slice
(4,2)-(5,26)
(4,13)-(4,64)
(4,19)-(4,21)
(4,35)-(4,37)
(4,50)-(4,51)
(4,50)-(4,64)
(4,52)-(4,61)
(4,53)-(4,54)
(4,55)-(4,57)
(4,58)-(4,60)
(4,62)-(4,64)
(5,2)-(5,16)
(5,2)-(5,26)
(5,17)-(5,18)
(5,19)-(5,23)
*)

(* all spans
(2,10)-(5,26)
(3,2)-(5,26)
(3,8)-(3,19)
(3,10)-(3,19)
(3,14)-(3,19)
(3,14)-(3,15)
(3,18)-(3,19)
(4,2)-(5,26)
(4,13)-(4,64)
(4,19)-(4,21)
(4,35)-(4,37)
(4,50)-(4,64)
(4,50)-(4,51)
(4,52)-(4,61)
(4,53)-(4,54)
(4,55)-(4,57)
(4,58)-(4,60)
(4,62)-(4,64)
(5,2)-(5,26)
(5,2)-(5,16)
(5,17)-(5,18)
(5,19)-(5,23)
(5,24)-(5,26)
*)
