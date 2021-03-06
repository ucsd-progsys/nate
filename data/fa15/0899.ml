
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l =
  match l with | [] -> "[]" | l -> "[" ^ (sepConcat ";" (List.map f l) "]");;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l =
  match l with
  | [] -> "[]"
  | l -> "[" ^ ((sepConcat ";" (List.map f l)) ^ "]");;

*)

(* changed spans
(10,41)-(10,75)
(10,42)-(10,51)
*)

(* type error slice
(2,3)-(7,60)
(2,18)-(7,58)
(2,22)-(7,58)
(3,2)-(7,58)
(4,10)-(4,12)
(10,41)-(10,75)
(10,42)-(10,51)
*)

(* all spans
(2,18)-(7,58)
(2,22)-(7,58)
(3,2)-(7,58)
(3,8)-(3,10)
(4,10)-(4,12)
(6,6)-(7,58)
(6,12)-(6,31)
(6,14)-(6,31)
(6,18)-(6,31)
(6,20)-(6,21)
(6,18)-(6,19)
(6,22)-(6,31)
(6,27)-(6,28)
(6,23)-(6,26)
(6,29)-(6,30)
(7,6)-(7,58)
(7,17)-(7,18)
(7,22)-(7,58)
(7,30)-(7,31)
(7,35)-(7,58)
(7,35)-(7,49)
(7,50)-(7,51)
(7,52)-(7,56)
(7,57)-(7,58)
(9,17)-(10,75)
(9,19)-(10,75)
(10,2)-(10,75)
(10,8)-(10,9)
(10,23)-(10,27)
(10,35)-(10,75)
(10,39)-(10,40)
(10,35)-(10,38)
(10,41)-(10,75)
(10,42)-(10,51)
(10,52)-(10,55)
(10,56)-(10,70)
(10,57)-(10,65)
(10,66)-(10,67)
(10,68)-(10,69)
(10,71)-(10,74)
*)
