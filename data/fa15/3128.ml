
let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile ((match b with | b' -> if b = b' then (b, false) else (b, true)), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile
    ((fun b'  -> if (f b') = b' then ((f b'), false) else ((f b'), true)), b);;

*)

(* changed spans
(6,10)-(6,73)
(6,17)-(6,18)
(6,35)-(6,36)
(6,39)-(6,41)
(6,47)-(6,57)
(6,48)-(6,49)
(6,51)-(6,56)
(6,64)-(6,65)
(6,67)-(6,71)
*)

(* type error slice
(3,8)-(3,9)
(3,8)-(3,11)
(3,41)-(3,47)
(3,41)-(3,55)
(3,48)-(3,55)
(3,49)-(3,50)
(6,2)-(6,8)
(6,2)-(6,77)
(6,9)-(6,77)
(6,10)-(6,73)
(6,32)-(6,72)
(6,63)-(6,72)
*)

(* all spans
(2,16)-(3,63)
(3,2)-(3,63)
(3,8)-(3,11)
(3,8)-(3,9)
(3,10)-(3,11)
(3,30)-(3,63)
(3,33)-(3,35)
(3,41)-(3,55)
(3,41)-(3,47)
(3,48)-(3,55)
(3,49)-(3,50)
(3,52)-(3,54)
(3,61)-(3,63)
(5,14)-(6,77)
(6,2)-(6,77)
(6,2)-(6,8)
(6,9)-(6,77)
(6,10)-(6,73)
(6,17)-(6,18)
(6,32)-(6,72)
(6,35)-(6,41)
(6,35)-(6,36)
(6,39)-(6,41)
(6,47)-(6,57)
(6,48)-(6,49)
(6,51)-(6,56)
(6,63)-(6,72)
(6,64)-(6,65)
(6,67)-(6,71)
(6,75)-(6,76)
*)
