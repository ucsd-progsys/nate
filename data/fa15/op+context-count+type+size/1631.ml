
let rec wwhile (f,b) = let (i,t) = f b in if t then wwhile (f, i) else i;;

let fixpoint (f,b) = wwhile (((f b) = b), b);;


(* fix

let rec wwhile (f,b) = let (i,t) = f b in if t then wwhile (f, i) else i;;

let fixpoint (f,b) =
  wwhile
    ((let g b = let xx = f b in if b = xx then (xx, false) else (xx, true) in
      g), b);;

*)

(* changed spans
(4,29)-(4,40)
(4,30)-(4,35)
(4,38)-(4,39)
(4,42)-(4,43)
*)

(* type error slice
(2,35)-(2,36)
(2,35)-(2,38)
(2,52)-(2,58)
(2,52)-(2,65)
(2,59)-(2,65)
(2,60)-(2,61)
(4,21)-(4,27)
(4,21)-(4,44)
(4,28)-(4,44)
(4,29)-(4,40)
*)