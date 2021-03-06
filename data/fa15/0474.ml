
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile ((f b), x) | (x,y) -> x;;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

*)

(* changed spans
(4,50)-(4,55)
(4,53)-(4,54)
*)

(* type error slice
(2,3)-(4,74)
(2,16)-(4,72)
(4,42)-(4,48)
(4,42)-(4,59)
(4,49)-(4,59)
(4,50)-(4,55)
(4,51)-(4,52)
*)

(* all spans
(2,16)-(4,72)
(3,2)-(4,72)
(3,12)-(3,15)
(3,12)-(3,13)
(3,14)-(3,15)
(4,2)-(4,72)
(4,8)-(4,11)
(4,30)-(4,38)
(4,30)-(4,31)
(4,34)-(4,38)
(4,42)-(4,59)
(4,42)-(4,48)
(4,49)-(4,59)
(4,50)-(4,55)
(4,51)-(4,52)
(4,53)-(4,54)
(4,57)-(4,58)
(4,71)-(4,72)
*)
