
let rec sumList xs = match xs with | [] -> [] | x::xs' -> x + (1 sumList xs');;


(* fix

let rec sumList xs = match xs with | [] -> 0 | x::xs' -> x + (sumList xs');;

*)

(* changed spans
(2,43)-(2,45)
(2,62)-(2,77)
(2,63)-(2,64)
*)

(* type error slice
(2,21)-(2,77)
(2,21)-(2,77)
(2,43)-(2,45)
(2,58)-(2,77)
(2,62)-(2,77)
(2,63)-(2,64)
*)