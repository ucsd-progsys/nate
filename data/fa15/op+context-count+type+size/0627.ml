
let rec sumList xs = match xs with | [] -> [] | h::t -> h + (sumList t);;


(* fix

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList xs);;

*)

(* changed spans
(2,43)-(2,45)
(2,69)-(2,70)
*)

(* type error slice
(2,3)-(2,73)
(2,16)-(2,71)
(2,21)-(2,71)
(2,21)-(2,71)
(2,43)-(2,45)
(2,56)-(2,71)
(2,56)-(2,71)
(2,60)-(2,71)
(2,61)-(2,68)
*)