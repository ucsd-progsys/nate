
let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) = let f x = (f, ((f b) = b)) in wwhile ((f b), b);;


(* fix

let wwhile (f,b) =
  let rec helper (f,b) (x,y) =
    match y with | true  -> helper (f, x) (f b) | false  -> x in
  helper (f, b) (b, true);;

let fixpoint (f,b) = let f x = ((f x), ((f b) = b)) in wwhile (f, b);;

*)

(* changed spans
(7,32)-(7,33)
(7,35)-(7,46)
(7,59)-(7,64)
(7,66)-(7,67)
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
(7,21)-(7,68)
(7,27)-(7,47)
(7,31)-(7,47)
(7,51)-(7,57)
(7,51)-(7,68)
(7,58)-(7,68)
(7,59)-(7,64)
(7,60)-(7,61)
*)