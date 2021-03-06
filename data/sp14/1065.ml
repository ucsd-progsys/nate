
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = let fx = ((f b), ((f b) = b)) in wwhile (fx, b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = let fx b = ((f b), ((f b) = b)) in wwhile (fx, b);;

*)

(* changed spans
(4,30)-(4,50)
*)

(* type error slice
(2,37)-(2,38)
(2,37)-(2,40)
(2,55)-(2,61)
(2,55)-(2,69)
(2,62)-(2,69)
(2,63)-(2,64)
(4,21)-(4,68)
(4,30)-(4,50)
(4,54)-(4,60)
(4,54)-(4,68)
(4,61)-(4,68)
(4,62)-(4,64)
*)

(* all spans
(2,16)-(2,77)
(2,23)-(2,77)
(2,37)-(2,40)
(2,37)-(2,38)
(2,39)-(2,40)
(2,44)-(2,77)
(2,47)-(2,49)
(2,55)-(2,69)
(2,55)-(2,61)
(2,62)-(2,69)
(2,63)-(2,64)
(2,66)-(2,68)
(2,75)-(2,77)
(4,14)-(4,68)
(4,21)-(4,68)
(4,30)-(4,50)
(4,31)-(4,36)
(4,32)-(4,33)
(4,34)-(4,35)
(4,38)-(4,49)
(4,39)-(4,44)
(4,40)-(4,41)
(4,42)-(4,43)
(4,47)-(4,48)
(4,54)-(4,68)
(4,54)-(4,60)
(4,61)-(4,68)
(4,62)-(4,64)
(4,66)-(4,67)
*)
