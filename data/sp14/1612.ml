
let rec wwhile (f,b) =
  match f b with | (x,true ) -> wwhile (f, x) | (x,false ) -> x;;

let fixpoint (f,b) = wwhile ((let (x,y) = f b in (x, (x <> b))), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (x,true ) -> wwhile (f, x) | (x,false ) -> x;;

let fixpoint (f,b) =
  wwhile ((let a x = let xx = f x in (xx, (x <> b)) in a), b);;

*)

(* changed spans
(5,29)-(5,63)
(5,42)-(5,45)
(5,44)-(5,45)
(5,49)-(5,62)
(5,53)-(5,61)
(5,65)-(5,66)
*)

(* type error slice
(3,8)-(3,9)
(3,8)-(3,11)
(3,32)-(3,38)
(3,32)-(3,45)
(3,39)-(3,45)
(3,40)-(3,41)
(5,21)-(5,27)
(5,21)-(5,67)
(5,28)-(5,67)
(5,29)-(5,63)
(5,49)-(5,62)
*)

(* all spans
(2,16)-(3,63)
(3,2)-(3,63)
(3,8)-(3,11)
(3,8)-(3,9)
(3,10)-(3,11)
(3,32)-(3,45)
(3,32)-(3,38)
(3,39)-(3,45)
(3,40)-(3,41)
(3,43)-(3,44)
(3,62)-(3,63)
(5,14)-(5,67)
(5,21)-(5,67)
(5,21)-(5,27)
(5,28)-(5,67)
(5,29)-(5,63)
(5,42)-(5,45)
(5,42)-(5,43)
(5,44)-(5,45)
(5,49)-(5,62)
(5,50)-(5,51)
(5,53)-(5,61)
(5,54)-(5,55)
(5,59)-(5,60)
(5,65)-(5,66)
*)
