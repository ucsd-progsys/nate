
let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile (let func x = f x in (f, (not ((f b) = b)), b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile ((fun x  -> ((f b), (3 < 4))), b);;

*)

(* changed spans
(5,28)-(5,75)
(5,42)-(5,45)
(5,44)-(5,45)
(5,49)-(5,74)
(5,50)-(5,51)
(5,53)-(5,70)
(5,54)-(5,57)
(5,58)-(5,69)
(5,59)-(5,64)
(5,72)-(5,73)
*)

(* type error slice
(3,49)-(3,55)
(3,49)-(3,62)
(3,56)-(3,62)
(5,21)-(5,27)
(5,21)-(5,75)
(5,28)-(5,75)
(5,49)-(5,74)
*)