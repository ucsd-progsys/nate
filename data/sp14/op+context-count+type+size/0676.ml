
let rec clone x n = let accum = [] in if n < 1 then [] else (clone x n) - 1;;


(* fix

let rec clone x n = let accum = [] in if n < 1 then [] else clone x n;;

*)

(* changed spans
(2,60)-(2,75)
(2,74)-(2,75)
*)

(* type error slice
(2,3)-(2,77)
(2,14)-(2,75)
(2,16)-(2,75)
(2,20)-(2,75)
(2,38)-(2,75)
(2,38)-(2,75)
(2,52)-(2,54)
(2,60)-(2,71)
(2,60)-(2,75)
(2,60)-(2,75)
(2,61)-(2,66)
*)