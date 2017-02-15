
let rec clone x n =
  match n with | 0 -> [] | a -> if a < 0 then [] else (clone x (n - 1)) @ [x];;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2))
  else ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | ([],[]) -> 0
      | ((h1::t1)::[],(h2::t2)::[]) -> if (h1 + h2) > 9 then 9 in
    let base = [] in
    let args = l1 l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  match n with | 0 -> [] | a -> if a < 0 then [] else (clone x (n - 1)) @ [x];;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2))
  else ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let carry = match a with | (x,y) -> x in
      match x with
      | (addend_a,addend_b) ->
          let new_carry = ((carry + addend_a) + addend_b) / 10 in
          let digit = ((carry + addend_a) + addend_b) mod 10 in
          (match a with | (x,y) -> (new_carry, (digit :: y))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(16,6)-(18,62)
(16,12)-(16,13)
(17,19)-(17,20)
(18,39)-(18,62)
(18,42)-(18,51)
(18,42)-(18,55)
(18,43)-(18,45)
(18,48)-(18,50)
(18,54)-(18,55)
(18,61)-(18,62)
(19,4)-(20,71)
(19,15)-(19,17)
(20,4)-(20,71)
(20,15)-(20,17)
(20,15)-(20,20)
(20,18)-(20,20)
(20,24)-(20,71)
(20,38)-(20,52)
(20,38)-(20,64)
(20,53)-(20,54)
(20,55)-(20,59)
(20,60)-(20,64)
(20,68)-(20,71)
(21,2)-(21,12)
(21,2)-(21,34)
(21,14)-(21,17)
(21,18)-(21,33)
(21,19)-(21,26)
(21,27)-(21,29)
(21,30)-(21,32)
*)

(* type error slice
(5,3)-(8,79)
(5,12)-(8,77)
(5,15)-(8,77)
(6,2)-(8,77)
(7,7)-(7,77)
(7,8)-(7,10)
(8,50)-(8,66)
(8,51)-(8,62)
(8,63)-(8,65)
(14,2)-(21,34)
(14,11)-(20,71)
(15,4)-(20,71)
(15,10)-(18,62)
(15,12)-(18,62)
(16,6)-(18,62)
(17,19)-(17,20)
(18,39)-(18,62)
(18,39)-(18,62)
(18,39)-(18,62)
(18,61)-(18,62)
(19,4)-(20,71)
(19,15)-(19,17)
(20,15)-(20,17)
(20,15)-(20,20)
(20,38)-(20,52)
(20,38)-(20,64)
(20,53)-(20,54)
(20,55)-(20,59)
(21,13)-(21,34)
(21,14)-(21,17)
(21,18)-(21,33)
(21,19)-(21,26)
*)