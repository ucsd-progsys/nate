
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = let fx x = x in wwhile (fx, b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt b = if f b then (b, true) else (b, false) in wwhile (funt, b);;

*)

(* changed spans
(6,21)-(6,51)
(6,28)-(6,33)
(6,32)-(6,33)
(6,37)-(6,43)
(6,37)-(6,51)
(6,44)-(6,51)
(6,45)-(6,47)
*)

(* type error slice
(2,3)-(4,70)
(2,16)-(4,68)
(3,2)-(4,68)
(3,12)-(3,13)
(3,12)-(3,15)
(3,14)-(3,15)
(4,2)-(4,68)
(4,8)-(4,11)
(4,42)-(4,48)
(4,42)-(4,55)
(4,49)-(4,55)
(4,53)-(4,54)
(6,21)-(6,51)
(6,28)-(6,33)
(6,32)-(6,33)
(6,37)-(6,43)
(6,37)-(6,51)
(6,44)-(6,51)
(6,45)-(6,47)
*)