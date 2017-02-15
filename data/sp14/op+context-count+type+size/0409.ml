
let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | _ -> wwhile (f, b');;

let fixpoint (f,b) = wwhile ((fun (f,b)  -> if (f b) = b then b else f b), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | _ -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile ((fun f'  -> if (f b) = b then (b, true) else (b, false)), b);;

*)

(* changed spans
(5,29)-(5,73)
(5,62)-(5,63)
(5,69)-(5,70)
(5,69)-(5,72)
(5,71)-(5,72)
(5,75)-(5,76)
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
(5,21)-(5,27)
(5,21)-(5,77)
(5,28)-(5,77)
(5,29)-(5,73)
(5,44)-(5,72)
(5,69)-(5,70)
(5,69)-(5,72)
*)