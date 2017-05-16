
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = if (List.length t) > 2 then a ^ (x ^ sep) else x ^ x in
      let base = "" in let l = sepConcat sep t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = if (List.length t) > 2 then a ^ (x ^ sep) else x ^ x in
      let base = "" in let l = t in List.fold_left f base l;;

*)

(* changed spans
(7,31)-(7,40)
(7,31)-(7,46)
(7,41)-(7,44)
*)

(* type error slice
(2,3)-(7,75)
(2,18)-(7,73)
(2,22)-(7,73)
(3,2)-(7,73)
(4,10)-(4,12)
(7,23)-(7,73)
(7,31)-(7,40)
(7,31)-(7,46)
(7,50)-(7,64)
(7,50)-(7,73)
(7,72)-(7,73)
*)

(* all spans
(2,18)-(7,73)
(2,22)-(7,73)
(3,2)-(7,73)
(3,8)-(3,10)
(4,10)-(4,12)
(6,6)-(7,73)
(6,12)-(6,70)
(6,14)-(6,70)
(6,18)-(6,70)
(6,21)-(6,40)
(6,21)-(6,36)
(6,22)-(6,33)
(6,34)-(6,35)
(6,39)-(6,40)
(6,46)-(6,59)
(6,48)-(6,49)
(6,46)-(6,47)
(6,50)-(6,59)
(6,53)-(6,54)
(6,51)-(6,52)
(6,55)-(6,58)
(6,65)-(6,70)
(6,67)-(6,68)
(6,65)-(6,66)
(6,69)-(6,70)
(7,6)-(7,73)
(7,17)-(7,19)
(7,23)-(7,73)
(7,31)-(7,46)
(7,31)-(7,40)
(7,41)-(7,44)
(7,45)-(7,46)
(7,50)-(7,73)
(7,50)-(7,64)
(7,65)-(7,66)
(7,67)-(7,71)
(7,72)-(7,73)
*)
