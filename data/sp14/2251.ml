
let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | _ -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile ((fun (f,b)  -> if (f b) = b then (b, false) else ((f b), true)), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | _ -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile ((fun a  -> if b = (f b) then (b, false) else ((f b), true)), b);;

*)

(* changed spans
(6,10)-(6,73)
(6,28)-(6,33)
(6,36)-(6,37)
*)

(* type error slice
(2,3)-(3,75)
(2,16)-(3,73)
(3,2)-(3,73)
(3,16)-(3,17)
(3,16)-(3,19)
(3,18)-(3,19)
(3,59)-(3,65)
(3,59)-(3,73)
(3,66)-(3,73)
(3,70)-(3,72)
(6,2)-(6,8)
(6,2)-(6,77)
(6,9)-(6,77)
(6,10)-(6,73)
(6,25)-(6,72)
(6,59)-(6,72)
(6,60)-(6,65)
(6,61)-(6,62)
*)

(* all spans
(2,16)-(3,73)
(3,2)-(3,73)
(3,16)-(3,19)
(3,16)-(3,17)
(3,18)-(3,19)
(3,23)-(3,73)
(3,29)-(3,31)
(3,49)-(3,51)
(3,59)-(3,73)
(3,59)-(3,65)
(3,66)-(3,73)
(3,67)-(3,68)
(3,70)-(3,72)
(5,14)-(6,77)
(6,2)-(6,77)
(6,2)-(6,8)
(6,9)-(6,77)
(6,10)-(6,73)
(6,25)-(6,72)
(6,28)-(6,37)
(6,28)-(6,33)
(6,29)-(6,30)
(6,31)-(6,32)
(6,36)-(6,37)
(6,43)-(6,53)
(6,44)-(6,45)
(6,47)-(6,52)
(6,59)-(6,72)
(6,60)-(6,65)
(6,61)-(6,62)
(6,63)-(6,64)
(6,67)-(6,71)
(6,75)-(6,76)
*)
