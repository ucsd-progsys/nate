
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (fun x  -> (((f x), (not ((f x) = x))), b));;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((fun x  -> ((f x), (not ((f x) = x)))), b);;

*)

(* changed spans
(4,28)-(4,71)
(4,40)-(4,66)
*)

(* type error slice
(2,55)-(2,61)
(2,55)-(2,69)
(2,62)-(2,69)
(4,21)-(4,27)
(4,21)-(4,71)
(4,28)-(4,71)
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
(4,14)-(4,71)
(4,21)-(4,71)
(4,21)-(4,27)
(4,28)-(4,71)
(4,39)-(4,70)
(4,40)-(4,66)
(4,41)-(4,46)
(4,42)-(4,43)
(4,44)-(4,45)
(4,48)-(4,65)
(4,49)-(4,52)
(4,53)-(4,64)
(4,54)-(4,59)
(4,55)-(4,56)
(4,57)-(4,58)
(4,62)-(4,63)
(4,68)-(4,69)
*)
