
let rec sumList xs = match xs with | [] -> 0 | h::t -> h + sumList;;


(* fix

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

*)

(* changed spans
(2,59)-(2,66)
*)

(* type error slice
(2,3)-(2,68)
(2,16)-(2,66)
(2,55)-(2,66)
(2,59)-(2,66)
*)