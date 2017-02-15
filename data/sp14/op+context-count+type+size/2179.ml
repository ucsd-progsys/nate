
let rec wwhile (f,b) =
  let rec helper (b',c') = if c' = true then helper (f b') else b' in
  helper (f b);;

let fixpoint (f,b) = wwhile ((f, ((f b) = b)), b);;


(* fix

let rec wwhile (f,b) =
  let rec helper (b',c') = if c' = true then helper (f b') else b' in
  helper (f b);;

let fixpoint (f,b) = wwhile ((fun b  -> ((f b), ((f b) = b))), b);;

*)

(* changed spans
(6,29)-(6,45)
(6,30)-(6,31)
(6,33)-(6,44)
*)

(* type error slice
(2,3)-(4,16)
(2,16)-(4,14)
(4,9)-(4,14)
(4,10)-(4,11)
(6,21)-(6,27)
(6,21)-(6,49)
(6,28)-(6,49)
(6,29)-(6,45)
*)