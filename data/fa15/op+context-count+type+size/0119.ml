
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let gs x =
    let isFPoint s = ((f s) - s) < 0 in
    let iterate (t,y) = t y in
    let rec go r = if isFPoint r then r else go (iterate (x, r)) in x in
  wwhile (gs, b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let gs x = let isFPoint s = ((f s) - s) < 0 in ((f x), (isFPoint x)) in
  wwhile (gs, b);;

*)

(* changed spans
(8,4)-(10,69)
(9,4)-(10,69)
(9,17)-(9,27)
(9,24)-(9,25)
(9,26)-(9,27)
(10,4)-(10,69)
(10,15)-(10,64)
(10,19)-(10,64)
(10,22)-(10,32)
(10,31)-(10,32)
(10,38)-(10,39)
(10,45)-(10,64)
*)

(* type error slice
(3,2)-(4,68)
(3,12)-(3,13)
(3,12)-(3,15)
(4,2)-(4,68)
(4,8)-(4,11)
(4,42)-(4,48)
(4,42)-(4,55)
(4,49)-(4,55)
(4,50)-(4,51)
(7,2)-(11,16)
(7,9)-(10,69)
(8,4)-(10,69)
(9,4)-(10,69)
(9,4)-(10,69)
(9,17)-(9,27)
(9,24)-(9,25)
(9,24)-(9,27)
(10,4)-(10,69)
(10,48)-(10,64)
(10,49)-(10,56)
(10,57)-(10,63)
(10,58)-(10,59)
(10,68)-(10,69)
(11,2)-(11,8)
(11,2)-(11,16)
(11,9)-(11,16)
(11,10)-(11,12)
*)