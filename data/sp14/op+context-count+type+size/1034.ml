
let rec listReverse l =
  match l with | [] -> [] | _::tl -> (listReverse tl) + tl;;


(* fix

let rec listReverse l = match l with | [] -> [] | _::tl -> listReverse tl;;

*)

(* changed spans
(3,37)-(3,58)
(3,56)-(3,58)
*)

(* type error slice
(2,3)-(3,60)
(2,20)-(3,58)
(3,2)-(3,58)
(3,2)-(3,58)
(3,2)-(3,58)
(3,2)-(3,58)
(3,23)-(3,25)
(3,37)-(3,53)
(3,37)-(3,58)
(3,37)-(3,58)
(3,37)-(3,58)
(3,38)-(3,49)
(3,56)-(3,58)
*)