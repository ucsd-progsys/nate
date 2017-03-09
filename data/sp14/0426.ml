
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile
    ((if (f b) = b then (true, (failwith "asd")) else failwith "asd"), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile
    ((if (f b) = b
      then fun b''  -> ((f b), false)
      else (fun b''  -> ((f b), true))), b);;

*)

(* changed spans
(6,24)-(6,48)
(6,25)-(6,29)
(6,32)-(6,40)
(6,41)-(6,46)
(6,54)-(6,62)
(6,54)-(6,68)
(6,63)-(6,68)
*)

(* type error slice
(2,37)-(2,38)
(2,37)-(2,40)
(2,55)-(2,61)
(2,55)-(2,69)
(2,62)-(2,69)
(2,63)-(2,64)
(5,2)-(5,8)
(5,2)-(6,73)
(6,4)-(6,73)
(6,5)-(6,69)
(6,24)-(6,48)
*)

(* all spans
(2,16)-(2,77)
(2,23)-(2,77)
(2,37)-(2,40)
(2,37)-(2,38)
(2,39)-(2,40)
(2,44)-(2,77)
(2,47)-(2,49)
(2,55)-(2,69)
(2,55)-(2,61)
(2,62)-(2,69)
(2,63)-(2,64)
(2,66)-(2,68)
(2,75)-(2,77)
(4,14)-(6,73)
(5,2)-(6,73)
(5,2)-(5,8)
(6,4)-(6,73)
(6,5)-(6,69)
(6,9)-(6,18)
(6,9)-(6,14)
(6,10)-(6,11)
(6,12)-(6,13)
(6,17)-(6,18)
(6,24)-(6,48)
(6,25)-(6,29)
(6,31)-(6,47)
(6,32)-(6,40)
(6,41)-(6,46)
(6,54)-(6,68)
(6,54)-(6,62)
(6,63)-(6,68)
(6,71)-(6,72)
*)