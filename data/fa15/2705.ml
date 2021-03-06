
let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | h::t -> let (a,b) = h in if a = k then b else assoc t;;


(* fix

let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | h::t -> let (a,b) = h in if a = k then b else assoc (d, k, t);;

*)

(* changed spans
(5,56)-(5,57)
*)

(* type error slice
(2,3)-(5,59)
(2,15)-(5,57)
(3,2)-(5,57)
(5,50)-(5,55)
(5,50)-(5,57)
(5,56)-(5,57)
*)

(* all spans
(2,15)-(5,57)
(3,2)-(5,57)
(3,8)-(3,9)
(4,10)-(4,11)
(5,12)-(5,57)
(5,24)-(5,25)
(5,29)-(5,57)
(5,32)-(5,37)
(5,32)-(5,33)
(5,36)-(5,37)
(5,43)-(5,44)
(5,50)-(5,57)
(5,50)-(5,55)
(5,56)-(5,57)
*)
