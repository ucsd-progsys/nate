
let join x l = x :: l;;

let rec listReverse l =
  match l with | [] -> [] | hd::tl -> join (listReverse tl) hd;;


(* fix

let join x l = l :: x;;

let rec listReverse l =
  match l with | [] -> [] | hd::tl -> join (listReverse tl) hd;;

*)

(* changed spans
(2,15)-(2,16)
(2,20)-(2,21)
(4,20)-(5,62)
*)

(* type error slice
(2,3)-(2,23)
(2,9)-(2,21)
(2,11)-(2,21)
(2,15)-(2,16)
(2,15)-(2,21)
(2,15)-(2,21)
(4,3)-(5,64)
(4,20)-(5,62)
(5,2)-(5,62)
(5,38)-(5,42)
(5,38)-(5,62)
(5,43)-(5,59)
(5,44)-(5,55)
*)