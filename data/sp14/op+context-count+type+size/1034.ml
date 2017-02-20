
let rec wwhile (f,b) =
  match f b with | (i,true ) -> wwhile (f, i) | (i,false ) -> i;;

let fixpoint (f,b) = wwhile (if b = (f b) then b else ((f b), b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (i,true ) -> wwhile (f, i) | (i,false ) -> i;;

let fixpoint (f,b) =
  let helper x = if b = (f b) then (b, false) else (b, true) in
  wwhile (helper, b);;

*)

(* changed spans
(5,21)-(5,27)
(5,21)-(5,65)
(5,28)-(5,65)
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
(5,14)-(5,65)
(5,21)-(5,65)
(5,21)-(5,27)
(5,28)-(5,65)
(5,32)-(5,41)
(5,32)-(5,33)
(5,36)-(5,41)
(5,37)-(5,38)
(5,39)-(5,40)
(5,47)-(5,48)
(5,54)-(5,64)
(5,55)-(5,60)
(5,56)-(5,57)
(5,58)-(5,59)
(5,62)-(5,63)
*)
