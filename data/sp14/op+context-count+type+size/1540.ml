
let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (if b = (f b) then true else (false, b));;


(* fix

let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) = wwhile (let func x x = (0, true) in ((func b), b));;

*)

(* changed spans
(3,30)-(3,63)
(5,28)-(5,68)
(5,32)-(5,33)
(5,32)-(5,41)
(5,36)-(5,41)
(5,37)-(5,38)
(5,39)-(5,40)
(5,47)-(5,51)
(5,58)-(5,63)
(5,65)-(5,66)
*)

(* type error slice
(3,41)-(3,47)
(3,41)-(3,55)
(3,48)-(3,55)
(5,21)-(5,27)
(5,21)-(5,68)
(5,28)-(5,68)
(5,28)-(5,68)
(5,47)-(5,51)
(5,57)-(5,67)
*)