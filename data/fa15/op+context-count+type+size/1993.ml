
let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | true  -> wwhile (f, b') | false  -> b';;

let fixpoint (f,b) = wwhile ((let func (x,y) = (f x) = y in func), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | true  -> wwhile (f, b') | false  -> b';;

let fixpoint (f,b) = wwhile ((fun b'  -> let x = f b' in (x, (b' != x))), b);;

*)

(* changed spans
(5,29)-(5,65)
(5,40)-(5,56)
(5,47)-(5,52)
(5,47)-(5,56)
(5,50)-(5,51)
(5,55)-(5,56)
(5,60)-(5,64)
(5,67)-(5,68)
*)

(* type error slice
(3,2)-(3,77)
(3,16)-(3,17)
(3,16)-(3,19)
(3,48)-(3,54)
(3,48)-(3,62)
(3,55)-(3,62)
(3,56)-(3,57)
(5,21)-(5,27)
(5,21)-(5,69)
(5,28)-(5,69)
(5,29)-(5,65)
(5,29)-(5,65)
(5,40)-(5,56)
(5,47)-(5,56)
(5,60)-(5,64)
*)