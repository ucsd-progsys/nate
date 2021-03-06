
let rec wwhile (f,b) =
  let (number,boolean) = f b in
  if boolean then wwhile (f, number) else number;;

let fixpoint (f,b) =
  wwhile
    (fun y  ->
       fun x  -> let z = f x in if z = b then (x, true) else ((y z), b));;


(* fix

let rec wwhile (f,b) =
  let (number,boolean) = f b in
  if boolean then wwhile (f, number) else number;;

let fixpoint (f,b) =
  wwhile (let y x = let xx = f x in (xx, (xx != x)) in (y, b));;

*)

(* changed spans
(8,4)-(9,72)
(9,17)-(9,71)
(9,32)-(9,71)
(9,35)-(9,36)
(9,35)-(9,40)
(9,39)-(9,40)
(9,47)-(9,48)
(9,50)-(9,54)
(9,62)-(9,67)
(9,65)-(9,66)
*)

(* type error slice
(4,18)-(4,24)
(4,18)-(4,36)
(4,25)-(4,36)
(7,2)-(7,8)
(7,2)-(9,72)
(8,4)-(9,72)
*)

(* all spans
(2,16)-(4,48)
(3,2)-(4,48)
(3,25)-(3,28)
(3,25)-(3,26)
(3,27)-(3,28)
(4,2)-(4,48)
(4,5)-(4,12)
(4,18)-(4,36)
(4,18)-(4,24)
(4,25)-(4,36)
(4,26)-(4,27)
(4,29)-(4,35)
(4,42)-(4,48)
(6,14)-(9,72)
(7,2)-(9,72)
(7,2)-(7,8)
(8,4)-(9,72)
(9,7)-(9,71)
(9,17)-(9,71)
(9,25)-(9,28)
(9,25)-(9,26)
(9,27)-(9,28)
(9,32)-(9,71)
(9,35)-(9,40)
(9,35)-(9,36)
(9,39)-(9,40)
(9,46)-(9,55)
(9,47)-(9,48)
(9,50)-(9,54)
(9,61)-(9,71)
(9,62)-(9,67)
(9,63)-(9,64)
(9,65)-(9,66)
(9,69)-(9,70)
*)
