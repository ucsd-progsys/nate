
let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) = wwhile (f, (if b = (f b) then b else b));;


(* fix

let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) = let g b = (b, (f b)) in wwhile (g, b);;

*)

(* changed spans
(7,21)-(7,27)
(7,21)-(7,61)
(7,28)-(7,61)
(7,29)-(7,30)
(7,32)-(7,60)
(7,36)-(7,45)
(7,51)-(7,52)
(7,58)-(7,59)
*)

(* type error slice
(2,3)-(5,27)
(2,12)-(5,25)
(4,28)-(4,34)
(4,28)-(4,47)
(4,35)-(4,41)
(4,36)-(4,37)
(4,42)-(4,47)
(4,43)-(4,44)
(5,2)-(5,8)
(5,2)-(5,25)
(5,9)-(5,15)
(5,10)-(5,11)
(5,16)-(5,25)
(5,17)-(5,18)
(7,21)-(7,27)
(7,21)-(7,61)
(7,28)-(7,61)
(7,29)-(7,30)
(7,32)-(7,60)
(7,36)-(7,37)
(7,36)-(7,45)
(7,36)-(7,45)
(7,40)-(7,45)
(7,41)-(7,42)
(7,51)-(7,52)
*)