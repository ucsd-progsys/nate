
let rec wwhile (f,b) =
  let (f',b') = f b in if b' = true then wwhile (f, f') else f';;

let fixpoint (f,b) = wwhile ((let h x = ((f b), ((f b) != b)) in f), b);;


(* fix

let rec wwhile (f,b) =
  let (f',b') = f b in if b' = true then wwhile (f, f') else f';;

let fixpoint (f,b) = wwhile ((let h x = ((f b), ((f b) != b)) in h), b);;

*)

(* changed spans
(5,65)-(5,66)
*)

(* type error slice
(3,2)-(3,63)
(3,16)-(3,17)
(3,16)-(3,19)
(3,41)-(3,47)
(3,41)-(3,55)
(3,48)-(3,55)
(3,49)-(3,50)
(3,52)-(3,54)
(5,21)-(5,27)
(5,21)-(5,71)
(5,28)-(5,71)
(5,29)-(5,67)
(5,48)-(5,60)
(5,49)-(5,54)
(5,50)-(5,51)
(5,58)-(5,59)
(5,65)-(5,66)
(5,69)-(5,70)
*)

(* all spans
(2,16)-(3,63)
(3,2)-(3,63)
(3,16)-(3,19)
(3,16)-(3,17)
(3,18)-(3,19)
(3,23)-(3,63)
(3,26)-(3,35)
(3,26)-(3,28)
(3,31)-(3,35)
(3,41)-(3,55)
(3,41)-(3,47)
(3,48)-(3,55)
(3,49)-(3,50)
(3,52)-(3,54)
(3,61)-(3,63)
(5,14)-(5,71)
(5,21)-(5,71)
(5,21)-(5,27)
(5,28)-(5,71)
(5,29)-(5,67)
(5,36)-(5,61)
(5,40)-(5,61)
(5,41)-(5,46)
(5,42)-(5,43)
(5,44)-(5,45)
(5,48)-(5,60)
(5,49)-(5,54)
(5,50)-(5,51)
(5,52)-(5,53)
(5,58)-(5,59)
(5,65)-(5,66)
(5,69)-(5,70)
*)
