
let lt10 q = q < 10;;

let rec additivePersistence n = if lt10 n then n else 55 :: 66;;


(* fix

let incre i = i + 1;;

let lt10 q = q < 10;;

let rec additivePersistence n =
  if lt10 n then n else (match n with | n -> incre n);;

*)

(* changed spans
(2,9)-(2,19)
(4,54)-(4,56)
(4,54)-(4,62)
(4,60)-(4,62)
*)

(* type error slice
(2,3)-(2,21)
(2,9)-(2,19)
(2,13)-(2,14)
(2,13)-(2,19)
(2,13)-(2,19)
(2,17)-(2,19)
(4,32)-(4,62)
(4,32)-(4,62)
(4,35)-(4,39)
(4,35)-(4,41)
(4,40)-(4,41)
(4,47)-(4,48)
(4,54)-(4,62)
(4,54)-(4,62)
(4,60)-(4,62)
*)