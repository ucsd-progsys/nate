
let rec assoc (d,k,l) =
  match (d, k, l) with
  | (str,num)::t -> if str = k then num else assoc (d, k, t)
  | [] -> d;;


(* fix

let rec assoc (d,k,l) =
  match l with
  | (ki,vi)::t -> if k = ki then vi else assoc (d, k, t)
  | [] -> d;;

*)

(* changed spans
(3,2)-(5,11)
(3,8)-(3,17)
(3,9)-(3,10)
(3,12)-(3,13)
(4,23)-(4,26)
(4,36)-(4,39)
(4,45)-(4,60)
*)

(* type error slice
(3,2)-(5,11)
(3,8)-(3,17)
*)

(* all spans
(2,15)-(5,11)
(3,2)-(5,11)
(3,8)-(3,17)
(3,9)-(3,10)
(3,12)-(3,13)
(3,15)-(3,16)
(4,20)-(4,60)
(4,23)-(4,30)
(4,23)-(4,26)
(4,29)-(4,30)
(4,36)-(4,39)
(4,45)-(4,60)
(4,45)-(4,50)
(4,51)-(4,60)
(4,52)-(4,53)
(4,55)-(4,56)
(4,58)-(4,59)
(5,10)-(5,11)
*)
