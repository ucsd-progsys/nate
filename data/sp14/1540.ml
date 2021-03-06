
let sqsum xs =
  let f a x = match xs with | [] -> a | hd::tl -> a + (hd * hd) in
  let base = [] in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = match xs with | [] -> a | hd::tl -> a + (hd * hd) in
  let base = f 4 xs in List.fold_left f base xs;;

*)

(* changed spans
(4,13)-(4,15)
(4,19)-(4,43)
*)

(* type error slice
(3,2)-(4,43)
(3,8)-(3,63)
(3,50)-(3,51)
(3,50)-(3,63)
(4,2)-(4,43)
(4,13)-(4,15)
(4,19)-(4,33)
(4,19)-(4,43)
(4,34)-(4,35)
(4,36)-(4,40)
*)

(* all spans
(2,10)-(4,43)
(3,2)-(4,43)
(3,8)-(3,63)
(3,10)-(3,63)
(3,14)-(3,63)
(3,20)-(3,22)
(3,36)-(3,37)
(3,50)-(3,63)
(3,50)-(3,51)
(3,54)-(3,63)
(3,55)-(3,57)
(3,60)-(3,62)
(4,2)-(4,43)
(4,13)-(4,15)
(4,19)-(4,43)
(4,19)-(4,33)
(4,34)-(4,35)
(4,36)-(4,40)
(4,41)-(4,43)
*)
