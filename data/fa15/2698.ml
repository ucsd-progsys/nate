
let notEqual x y = (x = y) = false;;

let rec wwhile (f,b) =
  let z = f b in
  match z with | (x,y) -> if y = false then x else wwhile (f, x);;

let fixpoint (f,b) =
  let newFunc b = ((f b), (notEqual b f b)) in wwhile (newFunc, b);;


(* fix

let notEqual x y = (x = y) = false;;

let rec wwhile (f,b) =
  let z = f b in
  match z with | (x,y) -> if y = false then x else wwhile (f, x);;

let fixpoint (f,b) =
  let newFunc b = ((f b), (notEqual b (f b))) in wwhile (newFunc, b);;

*)

(* changed spans
(9,26)-(9,42)
(9,38)-(9,39)
*)

(* type error slice
(2,3)-(2,36)
(2,13)-(2,34)
(2,15)-(2,34)
(2,19)-(2,34)
(9,26)-(9,42)
(9,27)-(9,35)
*)

(* all spans
(2,13)-(2,34)
(2,15)-(2,34)
(2,19)-(2,34)
(2,19)-(2,26)
(2,20)-(2,21)
(2,24)-(2,25)
(2,29)-(2,34)
(4,16)-(6,64)
(5,2)-(6,64)
(5,10)-(5,13)
(5,10)-(5,11)
(5,12)-(5,13)
(6,2)-(6,64)
(6,8)-(6,9)
(6,26)-(6,64)
(6,29)-(6,38)
(6,29)-(6,30)
(6,33)-(6,38)
(6,44)-(6,45)
(6,51)-(6,64)
(6,51)-(6,57)
(6,58)-(6,64)
(6,59)-(6,60)
(6,62)-(6,63)
(8,14)-(9,66)
(9,2)-(9,66)
(9,14)-(9,43)
(9,18)-(9,43)
(9,19)-(9,24)
(9,20)-(9,21)
(9,22)-(9,23)
(9,26)-(9,42)
(9,27)-(9,35)
(9,36)-(9,37)
(9,38)-(9,39)
(9,40)-(9,41)
(9,47)-(9,66)
(9,47)-(9,53)
(9,54)-(9,66)
(9,55)-(9,62)
(9,64)-(9,65)
*)