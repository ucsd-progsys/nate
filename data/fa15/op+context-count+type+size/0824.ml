
let rec listReverse l =
  match l with | [] -> [] | h::t -> [listReverse t] @ [h];;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

*)

(* changed spans
(3,36)-(3,51)
*)

(* type error slice
(2,3)-(3,59)
(2,20)-(3,57)
(3,2)-(3,57)
(3,36)-(3,51)
(3,36)-(3,51)
(3,36)-(3,57)
(3,37)-(3,48)
(3,37)-(3,50)
(3,52)-(3,53)
*)