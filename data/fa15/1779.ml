
let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | h::l' -> (match h with | (a,b) -> if a = k then b assoc (d, k, l'));;


(* fix

let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | h::l' -> (match h with | (a,b) -> if a = k then b else assoc (d, k, l'));;

*)

(* changed spans
(5,38)-(5,70)
(5,52)-(5,70)
(5,54)-(5,59)
*)

(* type error slice
(3,2)-(5,71)
(5,13)-(5,71)
(5,20)-(5,21)
(5,52)-(5,53)
(5,52)-(5,70)
(5,60)-(5,70)
(5,67)-(5,69)
*)

(* all spans
(2,15)-(5,71)
(3,2)-(5,71)
(3,8)-(3,9)
(4,10)-(4,11)
(5,13)-(5,71)
(5,20)-(5,21)
(5,38)-(5,70)
(5,41)-(5,46)
(5,41)-(5,42)
(5,45)-(5,46)
(5,52)-(5,70)
(5,52)-(5,53)
(5,54)-(5,59)
(5,60)-(5,70)
(5,61)-(5,62)
(5,64)-(5,65)
(5,67)-(5,69)
*)
