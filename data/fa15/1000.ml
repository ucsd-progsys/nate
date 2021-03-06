
let helper (f,b) =
  let x = f b in match b with | x -> (x, (x != b)) | _ -> (x, true);;

let rec wwhile (f,b) =
  let (x,y) = f b in match y with | false  -> x | true  -> wwhile (f, x);;

let fixpoint (f,b) = wwhile ((helper (f, b)), b);;


(* fix

let helper (f,b) = let f b = let x = f b in (x, (x != b)) in f;;

let rec wwhile (f,b) =
  let (x,y) = f b in match y with | false  -> x | true  -> wwhile (f, x);;

let fixpoint (f,b) = wwhile ((helper (f, b)), b);;

*)

(* changed spans
(3,2)-(3,67)
(3,17)-(3,67)
(3,23)-(3,24)
(3,58)-(3,67)
(3,59)-(3,60)
(3,62)-(3,66)
*)

(* type error slice
(2,3)-(3,69)
(2,12)-(3,67)
(3,2)-(3,67)
(3,17)-(3,67)
(3,58)-(3,67)
(6,14)-(6,15)
(6,14)-(6,17)
(6,59)-(6,65)
(6,59)-(6,72)
(6,66)-(6,72)
(6,67)-(6,68)
(8,21)-(8,27)
(8,21)-(8,48)
(8,28)-(8,48)
(8,29)-(8,44)
(8,30)-(8,36)
*)

(* all spans
(2,12)-(3,67)
(3,2)-(3,67)
(3,10)-(3,13)
(3,10)-(3,11)
(3,12)-(3,13)
(3,17)-(3,67)
(3,23)-(3,24)
(3,37)-(3,50)
(3,38)-(3,39)
(3,41)-(3,49)
(3,42)-(3,43)
(3,47)-(3,48)
(3,58)-(3,67)
(3,59)-(3,60)
(3,62)-(3,66)
(5,16)-(6,72)
(6,2)-(6,72)
(6,14)-(6,17)
(6,14)-(6,15)
(6,16)-(6,17)
(6,21)-(6,72)
(6,27)-(6,28)
(6,46)-(6,47)
(6,59)-(6,72)
(6,59)-(6,65)
(6,66)-(6,72)
(6,67)-(6,68)
(6,70)-(6,71)
(8,14)-(8,48)
(8,21)-(8,48)
(8,21)-(8,27)
(8,28)-(8,48)
(8,29)-(8,44)
(8,30)-(8,36)
(8,37)-(8,43)
(8,38)-(8,39)
(8,41)-(8,42)
(8,46)-(8,47)
*)
