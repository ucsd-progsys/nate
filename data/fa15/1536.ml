
let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

let fixpoint (f,b) =
  wwhile ((let f' b = if (f b) = b then b else f b in f' b), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

let fixpoint (f,b) =
  wwhile
    ((let f' b = if (f b) = b then (b, true) else ((f b), false) in f'), b);;

*)

(* changed spans
(6,40)-(6,41)
(6,47)-(6,50)
(6,54)-(6,58)
(6,61)-(6,62)
*)

(* type error slice
(3,2)-(3,63)
(3,8)-(3,9)
(3,8)-(3,11)
(3,41)-(3,47)
(3,41)-(3,55)
(3,48)-(3,55)
(3,49)-(3,50)
(3,52)-(3,54)
(6,2)-(6,8)
(6,2)-(6,63)
(6,9)-(6,63)
(6,10)-(6,59)
(6,18)-(6,50)
(6,22)-(6,50)
(6,25)-(6,30)
(6,25)-(6,34)
(6,26)-(6,27)
(6,33)-(6,34)
(6,47)-(6,48)
(6,47)-(6,50)
(6,54)-(6,56)
(6,54)-(6,58)
(6,57)-(6,58)
(6,61)-(6,62)
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
(5,14)-(6,63)
(6,2)-(6,63)
(6,2)-(6,8)
(6,9)-(6,63)
(6,10)-(6,59)
(6,18)-(6,50)
(6,22)-(6,50)
(6,25)-(6,34)
(6,25)-(6,30)
(6,26)-(6,27)
(6,28)-(6,29)
(6,33)-(6,34)
(6,40)-(6,41)
(6,47)-(6,50)
(6,47)-(6,48)
(6,49)-(6,50)
(6,54)-(6,58)
(6,54)-(6,56)
(6,57)-(6,58)
(6,61)-(6,62)
*)
