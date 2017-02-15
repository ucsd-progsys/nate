
let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | true  -> wwhile (f, b');;

let fixpoint (f,b) = wwhile ((let g x = f b in ((f b), ((f b) = b))), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | true  -> wwhile (f, b');;

let fixpoint (f,b) = let g x = let n = f x in (n, (n = x)) in wwhile (g, b);;

*)

(* changed spans
(5,21)-(5,27)
(5,21)-(5,72)
(5,28)-(5,72)
(5,29)-(5,68)
(5,40)-(5,43)
(5,42)-(5,43)
(5,48)-(5,53)
(5,49)-(5,50)
(5,51)-(5,52)
(5,56)-(5,61)
(5,57)-(5,58)
(5,59)-(5,60)
(5,64)-(5,65)
(5,70)-(5,71)
*)

(* type error slice
(3,16)-(3,17)
(3,16)-(3,19)
(3,63)-(3,69)
(3,63)-(3,77)
(3,70)-(3,77)
(3,71)-(3,72)
(5,21)-(5,27)
(5,21)-(5,72)
(5,28)-(5,72)
(5,29)-(5,68)
(5,47)-(5,67)
*)