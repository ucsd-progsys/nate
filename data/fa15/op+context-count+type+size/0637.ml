
let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) = wwhile (let n b = (f, (b = (f b))) in (n, b));;


(* fix

let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) =
  wwhile (let n x = let ff = f b in (ff, (b = ff)) in (n, b));;

*)

(* changed spans
(6,28)-(6,66)
(6,35)-(6,55)
(6,39)-(6,55)
(6,40)-(6,41)
(6,43)-(6,54)
(6,44)-(6,45)
(6,48)-(6,53)
(6,60)-(6,61)
*)

(* type error slice
(2,3)-(4,73)
(2,16)-(4,71)
(3,2)-(4,71)
(3,13)-(3,14)
(3,13)-(3,16)
(3,15)-(3,16)
(4,2)-(4,71)
(4,8)-(4,12)
(4,51)-(4,57)
(4,51)-(4,64)
(4,58)-(4,64)
(4,62)-(4,63)
(6,21)-(6,27)
(6,21)-(6,66)
(6,28)-(6,66)
(6,28)-(6,66)
(6,35)-(6,55)
(6,39)-(6,55)
(6,40)-(6,41)
(6,48)-(6,53)
(6,49)-(6,50)
(6,51)-(6,52)
(6,59)-(6,65)
(6,60)-(6,61)
*)