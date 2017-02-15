
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = "[" ^ ((sepConcat ("; ", (List.map (f, l)))) ^ "]");;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l =
  let newList = List.map f l in "[" ^ ((sepConcat "; " newList) ^ "]");;

*)

(* changed spans
(9,23)-(9,74)
(9,27)-(9,28)
(9,30)-(9,67)
(9,41)-(9,66)
(9,48)-(9,65)
(9,49)-(9,57)
(9,58)-(9,64)
(9,59)-(9,60)
(9,62)-(9,63)
*)

(* type error slice
(2,3)-(7,60)
(2,18)-(7,58)
(6,22)-(6,31)
(6,23)-(6,26)
(6,27)-(6,28)
(9,30)-(9,67)
(9,31)-(9,40)
(9,41)-(9,66)
(9,48)-(9,65)
(9,49)-(9,57)
(9,58)-(9,64)
*)