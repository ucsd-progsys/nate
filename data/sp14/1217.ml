
let rec wwhile (f,b) =
  let calc = f b in let (b',c') = calc in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((let f x = wwhile (f, x) in f b), b);;


(* fix

let rec wwhile (f,b) =
  let calc = f b in let (b',c') = calc in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((fun x  -> (x, (x = b))), b);;

*)

(* changed spans
(5,29)-(5,61)
(5,40)-(5,46)
(5,40)-(5,53)
(5,48)-(5,49)
(5,57)-(5,58)
(5,57)-(5,60)
(5,59)-(5,60)
*)

(* type error slice
(3,2)-(3,75)
(3,13)-(3,14)
(3,13)-(3,16)
(3,20)-(3,75)
(3,34)-(3,38)
(3,42)-(3,75)
(3,53)-(3,59)
(3,53)-(3,67)
(3,60)-(3,67)
(3,61)-(3,62)
(3,73)-(3,75)
(5,21)-(5,27)
(5,21)-(5,65)
(5,28)-(5,65)
(5,29)-(5,61)
(5,36)-(5,53)
(5,40)-(5,46)
(5,40)-(5,53)
(5,57)-(5,58)
(5,57)-(5,60)
*)

(* all spans
(2,16)-(3,75)
(3,2)-(3,75)
(3,13)-(3,16)
(3,13)-(3,14)
(3,15)-(3,16)
(3,20)-(3,75)
(3,34)-(3,38)
(3,42)-(3,75)
(3,45)-(3,47)
(3,53)-(3,67)
(3,53)-(3,59)
(3,60)-(3,67)
(3,61)-(3,62)
(3,64)-(3,66)
(3,73)-(3,75)
(5,14)-(5,65)
(5,21)-(5,65)
(5,21)-(5,27)
(5,28)-(5,65)
(5,29)-(5,61)
(5,36)-(5,53)
(5,40)-(5,53)
(5,40)-(5,46)
(5,47)-(5,53)
(5,48)-(5,49)
(5,51)-(5,52)
(5,57)-(5,60)
(5,57)-(5,58)
(5,59)-(5,60)
(5,63)-(5,64)
*)
