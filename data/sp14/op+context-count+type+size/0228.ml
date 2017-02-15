
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem l seen then seen else h :: seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then seen else h :: seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,32)-(7,33)
*)

(* type error slice
(4,4)-(8,46)
(4,4)-(8,46)
(7,23)-(7,31)
(7,23)-(7,38)
(7,32)-(7,33)
(7,34)-(7,38)
(7,54)-(7,55)
(7,54)-(7,63)
(7,54)-(7,63)
(7,59)-(7,63)
(8,8)-(8,46)
(8,20)-(8,21)
(8,25)-(8,31)
(8,25)-(8,46)
(8,32)-(8,46)
(8,40)-(8,45)
(9,11)-(9,27)
(9,12)-(9,18)
(9,19)-(9,26)
(9,24)-(9,25)
*)