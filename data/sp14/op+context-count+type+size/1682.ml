
let rec wwhile (f,b) =
  let (b',c') = f b in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile (if (f b) = b then b else ((f b), b));;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) =
  let f x = let xx = f b in (xx, (xx <> b)) in wwhile (f, b);;

*)

(* changed spans
(5,21)-(5,27)
(5,21)-(5,65)
(5,28)-(5,65)
(5,32)-(5,37)
(5,32)-(5,41)
(5,40)-(5,41)
(5,47)-(5,48)
(5,55)-(5,60)
(5,56)-(5,57)
(5,62)-(5,63)
*)

(* type error slice
(5,28)-(5,65)
(5,28)-(5,65)
(5,47)-(5,48)
(5,54)-(5,64)
(5,62)-(5,63)
*)

(* all spans
(2,16)-(3,64)
(3,2)-(3,64)
(3,16)-(3,19)
(3,16)-(3,17)
(3,18)-(3,19)
(3,23)-(3,64)
(3,26)-(3,36)
(3,26)-(3,28)
(3,31)-(3,36)
(3,42)-(3,44)
(3,50)-(3,64)
(3,50)-(3,56)
(3,57)-(3,64)
(3,58)-(3,59)
(3,61)-(3,63)
(5,14)-(5,65)
(5,21)-(5,65)
(5,21)-(5,27)
(5,28)-(5,65)
(5,32)-(5,41)
(5,32)-(5,37)
(5,33)-(5,34)
(5,35)-(5,36)
(5,40)-(5,41)
(5,47)-(5,48)
(5,54)-(5,64)
(5,55)-(5,60)
(5,56)-(5,57)
(5,58)-(5,59)
(5,62)-(5,63)
*)
