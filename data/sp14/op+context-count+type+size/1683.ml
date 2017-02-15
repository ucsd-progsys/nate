
let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile (if (f b) = b then (b, b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) =
  wwhile ((let f x = let xx = (x * x) * x in (xx, (xx < 100)) in f), b);;

*)

(* changed spans
(5,28)-(5,54)
(5,29)-(5,53)
(5,32)-(5,37)
(5,32)-(5,41)
(5,33)-(5,34)
(5,35)-(5,36)
(5,40)-(5,41)
(5,48)-(5,49)
(5,51)-(5,52)
*)

(* type error slice
(3,2)-(3,62)
(3,8)-(3,9)
(3,8)-(3,11)
(3,49)-(3,55)
(3,49)-(3,62)
(3,56)-(3,62)
(3,57)-(3,58)
(3,60)-(3,61)
(5,21)-(5,27)
(5,21)-(5,54)
(5,28)-(5,54)
(5,28)-(5,54)
(5,29)-(5,53)
(5,47)-(5,53)
(5,48)-(5,49)
(5,51)-(5,52)
*)