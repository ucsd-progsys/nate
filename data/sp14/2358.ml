
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = if t then "" else "a" in
      let l = sl in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = if t = [] then "A" else "" in
      let l = sl in List.fold_left f base l;;

*)

(* changed spans
(7,20)-(7,21)
(7,27)-(7,29)
(7,35)-(7,38)
*)

(* type error slice
(3,2)-(8,43)
(7,17)-(7,38)
(7,20)-(7,21)
*)

(* all spans
(2,18)-(8,43)
(2,22)-(8,43)
(3,2)-(8,43)
(3,8)-(3,10)
(4,10)-(4,12)
(6,6)-(8,43)
(6,12)-(6,31)
(6,14)-(6,31)
(6,18)-(6,31)
(6,20)-(6,21)
(6,18)-(6,19)
(6,22)-(6,31)
(6,27)-(6,28)
(6,23)-(6,26)
(6,29)-(6,30)
(7,6)-(8,43)
(7,17)-(7,38)
(7,20)-(7,21)
(7,27)-(7,29)
(7,35)-(7,38)
(8,6)-(8,43)
(8,14)-(8,16)
(8,20)-(8,43)
(8,20)-(8,34)
(8,35)-(8,36)
(8,37)-(8,41)
(8,42)-(8,43)
*)
