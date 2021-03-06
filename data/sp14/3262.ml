
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = if a = "a" then a ^ (x ^ sep) in
      let base = "" in let l = sl in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (x ^ sep) in
      let base = "" in let l = sl in List.fold_left f base l;;

*)

(* changed spans
(6,18)-(6,47)
(6,21)-(6,22)
(6,21)-(6,28)
(6,25)-(6,28)
*)

(* type error slice
(6,18)-(6,47)
(6,34)-(6,47)
(6,36)-(6,37)
*)

(* all spans
(2,18)-(7,60)
(2,22)-(7,60)
(3,2)-(7,60)
(3,8)-(3,10)
(4,10)-(4,12)
(6,6)-(7,60)
(6,12)-(6,47)
(6,14)-(6,47)
(6,18)-(6,47)
(6,21)-(6,28)
(6,21)-(6,22)
(6,25)-(6,28)
(6,34)-(6,47)
(6,36)-(6,37)
(6,34)-(6,35)
(6,38)-(6,47)
(6,41)-(6,42)
(6,39)-(6,40)
(6,43)-(6,46)
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
