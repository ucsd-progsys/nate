
let sqsum xs =
  let f a x = a * a in
  let base = match xs with | [] -> [] | x::xs' -> f x xs' in
  List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a * a in let base = f 2 xs in List.fold_left f base xs;;

*)

(* changed spans
(4,2)-(5,26)
(4,13)-(4,57)
(4,19)-(4,21)
(4,35)-(4,37)
(4,52)-(4,53)
(4,54)-(4,57)
(5,2)-(5,26)
*)

(* type error slice
(3,2)-(5,26)
(3,8)-(3,19)
(3,10)-(3,19)
(3,14)-(3,15)
(3,14)-(3,19)
(3,14)-(3,19)
(4,13)-(4,57)
(4,13)-(4,57)
(4,35)-(4,37)
(4,50)-(4,51)
(4,50)-(4,57)
(5,2)-(5,16)
(5,2)-(5,26)
(5,17)-(5,18)
*)