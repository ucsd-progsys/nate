
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile (let fin b' = (b', ((f b') = b')) in ((fin b), b));;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (let fin bt = (bt, ((f bt) = bt)) in (fin, b));;

*)

(* changed spans
(5,18)-(5,42)
(5,24)-(5,26)
(5,32)-(5,34)
(5,38)-(5,40)
(5,46)-(5,58)
(5,47)-(5,54)
(5,56)-(5,57)
*)

(* type error slice
(2,37)-(2,38)
(2,37)-(2,40)
(2,55)-(2,61)
(2,55)-(2,69)
(2,62)-(2,69)
(2,63)-(2,64)
(5,2)-(5,8)
(5,2)-(5,59)
(5,9)-(5,59)
(5,18)-(5,42)
(5,23)-(5,42)
(5,46)-(5,58)
(5,47)-(5,54)
(5,48)-(5,51)
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
(4,14)-(5,59)
(5,2)-(5,59)
(5,2)-(5,8)
(5,9)-(5,59)
(5,18)-(5,42)
(5,23)-(5,42)
(5,24)-(5,26)
(5,28)-(5,41)
(5,29)-(5,35)
(5,30)-(5,31)
(5,32)-(5,34)
(5,38)-(5,40)
(5,46)-(5,58)
(5,47)-(5,54)
(5,48)-(5,51)
(5,52)-(5,53)
(5,56)-(5,57)
*)
