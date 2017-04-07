
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let rest' = List.rev t in
        let seen' = seen in
        (if (List.mem h rest') = false then h :: seen'; helper (seen', rest')) in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t -> let seen' = h :: seen in let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,8)-(9,78)
(7,20)-(7,28)
(7,20)-(7,30)
(7,29)-(7,30)
(8,20)-(8,24)
(9,8)-(9,78)
(9,9)-(9,54)
(9,12)-(9,30)
(9,12)-(9,38)
(9,13)-(9,21)
(9,22)-(9,23)
(9,24)-(9,29)
(9,33)-(9,38)
(9,49)-(9,54)
(9,56)-(9,77)
*)

(* type error slice
(9,8)-(9,78)
(9,9)-(9,54)
(9,9)-(9,54)
(9,9)-(9,54)
(9,44)-(9,54)
*)

(* all spans
(2,21)-(10,27)
(3,2)-(10,27)
(3,18)-(9,78)
(4,4)-(9,78)
(4,10)-(4,14)
(5,12)-(5,16)
(7,8)-(9,78)
(7,20)-(7,30)
(7,20)-(7,28)
(7,29)-(7,30)
(8,8)-(9,78)
(8,20)-(8,24)
(9,8)-(9,78)
(9,9)-(9,54)
(9,12)-(9,38)
(9,12)-(9,30)
(9,13)-(9,21)
(9,22)-(9,23)
(9,24)-(9,29)
(9,33)-(9,38)
(9,44)-(9,54)
(9,44)-(9,45)
(9,49)-(9,54)
(9,9)-(9,54)
(9,56)-(9,77)
(9,56)-(9,62)
(9,63)-(9,77)
(9,64)-(9,69)
(9,71)-(9,76)
(10,2)-(10,27)
(10,2)-(10,10)
(10,11)-(10,27)
(10,12)-(10,18)
(10,19)-(10,26)
(10,20)-(10,22)
(10,24)-(10,25)
*)