
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = wwhile ((), b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt b = if f b then (b, true) else (b, false) in wwhile (funt, b);;

*)

(* changed spans
(4,53)-(4,54)
(4,67)-(4,68)
(6,29)-(6,31)
*)

(* type error slice
(3,12)-(3,13)
(3,12)-(3,15)
(4,42)-(4,48)
(4,42)-(4,55)
(4,49)-(4,55)
(4,50)-(4,51)
(6,21)-(6,27)
(6,21)-(6,35)
(6,28)-(6,35)
(6,29)-(6,31)
*)

(* all spans
(2,16)-(4,68)
(3,2)-(4,68)
(3,12)-(3,15)
(3,12)-(3,13)
(3,14)-(3,15)
(4,2)-(4,68)
(4,8)-(4,11)
(4,30)-(4,38)
(4,30)-(4,31)
(4,34)-(4,38)
(4,42)-(4,55)
(4,42)-(4,48)
(4,49)-(4,55)
(4,50)-(4,51)
(4,53)-(4,54)
(4,67)-(4,68)
(6,14)-(6,35)
(6,21)-(6,35)
(6,21)-(6,27)
(6,28)-(6,35)
(6,29)-(6,31)
(6,33)-(6,34)
*)
