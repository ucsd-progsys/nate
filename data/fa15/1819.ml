
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let r = List.rev t in
        let seen' = seen in
        (if 1 = 2 then seen' := (h :: seen');
         (let rest' = t in helper (seen', rest'))) in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let assignSeen h r seen = if List.mem h r then seen else h :: seen in
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let r = List.rev t in
        let seen' = assignSeen h r seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(3,2)-(11,27)
(8,20)-(8,24)
(9,8)-(10,50)
(9,9)-(9,44)
(9,12)-(9,13)
(9,12)-(9,17)
(9,16)-(9,17)
(9,23)-(9,28)
(9,23)-(9,44)
(9,29)-(9,31)
(9,32)-(9,44)
(9,33)-(9,34)
(9,38)-(9,43)
(10,9)-(10,49)
*)

(* type error slice
(9,23)-(9,28)
(9,23)-(9,44)
(9,29)-(9,31)
(9,32)-(9,44)
(9,38)-(9,43)
*)

(* all spans
(2,21)-(11,27)
(3,2)-(11,27)
(3,18)-(10,50)
(4,4)-(10,50)
(4,10)-(4,14)
(5,12)-(5,16)
(7,8)-(10,50)
(7,16)-(7,26)
(7,16)-(7,24)
(7,25)-(7,26)
(8,8)-(10,50)
(8,20)-(8,24)
(9,8)-(10,50)
(9,9)-(9,44)
(9,12)-(9,17)
(9,12)-(9,13)
(9,16)-(9,17)
(9,23)-(9,44)
(9,29)-(9,31)
(9,23)-(9,28)
(9,32)-(9,44)
(9,33)-(9,34)
(9,38)-(9,43)
(10,9)-(10,49)
(10,22)-(10,23)
(10,27)-(10,48)
(10,27)-(10,33)
(10,34)-(10,48)
(10,35)-(10,40)
(10,42)-(10,47)
(11,2)-(11,27)
(11,2)-(11,10)
(11,11)-(11,27)
(11,12)-(11,18)
(11,19)-(11,26)
(11,20)-(11,22)
(11,24)-(11,25)
*)
