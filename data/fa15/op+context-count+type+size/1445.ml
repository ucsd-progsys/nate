
let rec clone x n = if x <= 0 then [] else x @ (clone x (n - 1));;


(* fix

let rec clone x n = if x <= 0 then [] else x :: (clone x (n - 1));;

*)

(* changed spans
(2,43)-(2,64)
(2,45)-(2,46)
*)

(* type error slice
(2,23)-(2,24)
(2,23)-(2,29)
(2,23)-(2,29)
(2,28)-(2,29)
(2,43)-(2,44)
(2,43)-(2,64)
(2,45)-(2,46)
*)

(* all spans
(2,14)-(2,64)
(2,16)-(2,64)
(2,20)-(2,64)
(2,23)-(2,29)
(2,23)-(2,24)
(2,28)-(2,29)
(2,35)-(2,37)
(2,43)-(2,64)
(2,45)-(2,46)
(2,43)-(2,44)
(2,47)-(2,64)
(2,48)-(2,53)
(2,54)-(2,55)
(2,56)-(2,63)
(2,57)-(2,58)
(2,61)-(2,62)
*)
