
let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile ((f, (((f b) == (f (b - 1))) && ((f b) == b))), b);;


(* fix

let func (f,b) b = ((f b), ((f b) == b));;

let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((func (f, b)), b);;

*)

(* changed spans
(3,2)-(3,63)
(6,10)-(6,55)
(6,11)-(6,12)
(6,14)-(6,54)
(6,15)-(6,37)
(6,17)-(6,18)
(6,19)-(6,20)
(6,25)-(6,36)
(6,26)-(6,27)
(6,28)-(6,35)
(6,29)-(6,30)
(6,33)-(6,34)
(6,41)-(6,53)
(6,42)-(6,47)
(6,43)-(6,44)
(6,57)-(6,58)
*)

(* type error slice
(3,8)-(3,9)
(3,8)-(3,11)
(3,41)-(3,47)
(3,41)-(3,55)
(3,48)-(3,55)
(3,49)-(3,50)
(6,2)-(6,8)
(6,2)-(6,59)
(6,9)-(6,59)
(6,10)-(6,55)
*)