
let sqsum xs =
  let f a x a x = a + (x * x) in
  let base base = base in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x a x = a + x in
  let base = 0 in List.fold_left (fun a  -> fun x  -> a + (x * x)) 0 xs;;

*)

(* changed spans
(3,22)-(3,29)
(3,27)-(3,28)
(4,11)-(4,22)
(4,18)-(4,22)
(4,41)-(4,42)
(4,43)-(4,47)
(4,48)-(4,50)
*)

(* type error slice
(3,2)-(4,50)
(3,8)-(3,29)
(3,10)-(3,29)
(3,12)-(3,29)
(3,14)-(3,29)
(3,18)-(3,19)
(3,18)-(3,29)
(4,2)-(4,50)
(4,11)-(4,22)
(4,18)-(4,22)
(4,26)-(4,40)
(4,26)-(4,50)
(4,41)-(4,42)
(4,43)-(4,47)
*)