
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = if (List.length t) = 2 then a ^ x in
      let base = "" in let l = sl in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = if (List.length t) < 2 then a ^ x else a ^ (x ^ sep) in
      let base = "" in let l = sl in List.fold_left f base l;;

*)

(* changed spans
(6,18)-(6,51)
(6,21)-(6,40)
(7,6)-(7,60)
*)

(* type error slice
(6,18)-(6,51)
(6,46)-(6,51)
(6,48)-(6,49)
*)

(* all spans
(2,18)-(7,60)
(2,22)-(7,60)
(3,2)-(7,60)
(3,8)-(3,10)
(4,10)-(4,12)
(6,6)-(7,60)
(6,12)-(6,51)
(6,14)-(6,51)
(6,18)-(6,51)
(6,21)-(6,40)
(6,21)-(6,36)
(6,22)-(6,33)
(6,34)-(6,35)
(6,39)-(6,40)
(6,46)-(6,51)
(6,48)-(6,49)
(6,46)-(6,47)
(6,50)-(6,51)
(7,6)-(7,60)
(7,17)-(7,19)
(7,23)-(7,60)
(7,31)-(7,33)
(7,37)-(7,60)
(7,37)-(7,51)
(7,52)-(7,53)
(7,54)-(7,58)
(7,59)-(7,60)
*)
