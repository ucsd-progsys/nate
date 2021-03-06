
let rec assoc (d,k,l) =
  match l with | (x,y)::t when x = k -> y | h::t -> assoc d k | _ -> (-1);;


(* fix

let rec assoc (d,k,l) = match l with | h::t -> assoc (d, k, t);;

*)

(* changed spans
(3,2)-(3,73)
(3,40)-(3,41)
(3,52)-(3,61)
(3,69)-(3,73)
*)

(* type error slice
(2,3)-(3,75)
(2,15)-(3,73)
(3,52)-(3,57)
(3,52)-(3,61)
(3,58)-(3,59)
*)

(* all spans
(2,15)-(3,73)
(3,2)-(3,73)
(3,8)-(3,9)
(3,31)-(3,36)
(3,31)-(3,32)
(3,35)-(3,36)
(3,40)-(3,41)
(3,52)-(3,61)
(3,52)-(3,57)
(3,58)-(3,59)
(3,60)-(3,61)
(3,69)-(3,73)
*)
