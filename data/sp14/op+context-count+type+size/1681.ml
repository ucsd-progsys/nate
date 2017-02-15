
let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile (if (f b) = b then b else wwhile (f, (f b)));;


(* fix

let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) =
  wwhile ((let f x = let xx = (x * x) * x in (xx, (xx < 100)) in f), b);;

*)

(* changed spans
(5,28)-(5,72)
(5,32)-(5,37)
(5,32)-(5,41)
(5,33)-(5,34)
(5,35)-(5,36)
(5,40)-(5,41)
(5,47)-(5,48)
(5,54)-(5,60)
(5,54)-(5,71)
(5,62)-(5,63)
(5,65)-(5,70)
(5,66)-(5,67)
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
(5,21)-(5,72)
(5,28)-(5,72)
(5,47)-(5,48)
(5,54)-(5,60)
(5,54)-(5,71)
(5,61)-(5,71)
(5,62)-(5,63)
(5,65)-(5,70)
(5,66)-(5,67)
(5,68)-(5,69)
*)