
let rec clone x n = if x <= 0 then [] else clone [x] (n - 1);;


(* fix

let rec clone x n = if n <= 0 then [] else clone x (n - 1);;

*)

(* changed spans
(2,23)-(2,24)
(2,49)-(2,52)
*)

(* type error slice
(2,3)-(2,62)
(2,14)-(2,60)
(2,43)-(2,48)
(2,43)-(2,60)
(2,49)-(2,52)
(2,50)-(2,51)
*)

(* all spans
(2,14)-(2,60)
(2,16)-(2,60)
(2,20)-(2,60)
(2,23)-(2,29)
(2,23)-(2,24)
(2,28)-(2,29)
(2,35)-(2,37)
(2,43)-(2,60)
(2,43)-(2,48)
(2,49)-(2,52)
(2,50)-(2,51)
(2,53)-(2,60)
(2,54)-(2,55)
(2,58)-(2,59)
*)
