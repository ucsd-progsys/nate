
let rec wwhile (f,b) =
  match f b with | (i,true ) -> wwhile (f, i) | (i,false ) -> i;;

let fixpoint (f,b) =
  wwhile ((if b = (f b) then (b, false) else (b, true)), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (i,true ) -> wwhile (f, i) | (i,false ) -> i;;

let fixpoint (f,b) =
  let helper x = if b = (f b) then (b, false) else (b, true) in
  wwhile (helper, b);;

*)

(* changed spans
(6,2)-(6,8)
(6,2)-(6,59)
(6,9)-(6,59)
(6,10)-(6,55)
(6,57)-(6,58)
*)

(* type error slice
(3,8)-(3,9)
(3,8)-(3,11)
(3,32)-(3,38)
(3,32)-(3,45)
(3,39)-(3,45)
(3,40)-(3,41)
(6,2)-(6,8)
(6,2)-(6,59)
(6,9)-(6,59)
(6,10)-(6,55)
(6,45)-(6,54)
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
(5,14)-(6,59)
(6,2)-(6,59)
(6,2)-(6,8)
(6,9)-(6,59)
(6,10)-(6,55)
(6,14)-(6,23)
(6,14)-(6,15)
(6,18)-(6,23)
(6,19)-(6,20)
(6,21)-(6,22)
(6,29)-(6,39)
(6,30)-(6,31)
(6,33)-(6,38)
(6,45)-(6,54)
(6,46)-(6,47)
(6,49)-(6,53)
(6,57)-(6,58)
*)
