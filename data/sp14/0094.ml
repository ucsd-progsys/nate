
let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  else (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (h1,h2) -> (match a with | (v1,v2) -> [((v1 + h1), (v2 + h2))]) in
    let base = (0, 0) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  else (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | (list1,list2) ->
          (match list1 with
           | [] -> (match x with | (h1,h2) -> (((h1 + h2) :: list1), list2))) in
    let base = ([], []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(15,6)-(16,71)
(16,19)-(16,71)
(16,26)-(16,27)
(16,46)-(16,70)
(16,48)-(16,57)
(16,49)-(16,51)
(16,59)-(16,68)
(16,60)-(16,62)
(17,4)-(19,51)
(17,15)-(17,21)
(17,16)-(17,17)
(17,19)-(17,20)
(18,4)-(19,51)
(18,15)-(18,33)
(19,4)-(19,51)
*)

(* type error slice
(14,4)-(19,51)
(14,10)-(16,71)
(14,12)-(16,71)
(15,6)-(16,71)
(16,19)-(16,71)
(16,19)-(16,71)
(16,26)-(16,27)
(16,46)-(16,70)
(19,18)-(19,32)
(19,18)-(19,44)
(19,33)-(19,34)
*)

(* all spans
(2,14)-(2,64)
(2,16)-(2,64)
(2,20)-(2,64)
(2,23)-(2,28)
(2,23)-(2,24)
(2,27)-(2,28)
(2,34)-(2,56)
(2,34)-(2,35)
(2,39)-(2,56)
(2,40)-(2,45)
(2,46)-(2,47)
(2,48)-(2,55)
(2,49)-(2,50)
(2,53)-(2,54)
(2,62)-(2,64)
(4,12)-(7,77)
(4,15)-(7,77)
(5,2)-(7,77)
(5,5)-(5,40)
(5,5)-(5,21)
(5,6)-(5,17)
(5,18)-(5,20)
(5,24)-(5,40)
(5,25)-(5,36)
(5,37)-(5,39)
(6,7)-(6,77)
(6,8)-(6,72)
(6,9)-(6,20)
(6,21)-(6,68)
(6,22)-(6,27)
(6,28)-(6,29)
(6,30)-(6,67)
(6,31)-(6,47)
(6,32)-(6,43)
(6,44)-(6,46)
(6,50)-(6,66)
(6,51)-(6,62)
(6,63)-(6,65)
(6,69)-(6,71)
(6,74)-(6,76)
(7,7)-(7,77)
(7,8)-(7,10)
(7,12)-(7,76)
(7,13)-(7,24)
(7,25)-(7,72)
(7,26)-(7,31)
(7,32)-(7,33)
(7,34)-(7,71)
(7,35)-(7,51)
(7,36)-(7,47)
(7,48)-(7,50)
(7,54)-(7,70)
(7,55)-(7,66)
(7,67)-(7,69)
(7,73)-(7,75)
(9,19)-(10,69)
(10,2)-(10,69)
(10,8)-(10,9)
(10,23)-(10,25)
(10,36)-(10,69)
(10,39)-(10,44)
(10,39)-(10,40)
(10,43)-(10,44)
(10,50)-(10,62)
(10,50)-(10,60)
(10,61)-(10,62)
(10,68)-(10,69)
(12,11)-(20,34)
(12,14)-(20,34)
(13,2)-(20,34)
(13,11)-(19,51)
(14,4)-(19,51)
(14,10)-(16,71)
(14,12)-(16,71)
(15,6)-(16,71)
(15,12)-(15,13)
(16,19)-(16,71)
(16,26)-(16,27)
(16,46)-(16,70)
(16,47)-(16,69)
(16,48)-(16,57)
(16,49)-(16,51)
(16,54)-(16,56)
(16,59)-(16,68)
(16,60)-(16,62)
(16,65)-(16,67)
(17,4)-(19,51)
(17,15)-(17,21)
(17,16)-(17,17)
(17,19)-(17,20)
(18,4)-(19,51)
(18,15)-(18,33)
(18,15)-(18,27)
(18,28)-(18,30)
(18,31)-(18,33)
(19,4)-(19,51)
(19,18)-(19,44)
(19,18)-(19,32)
(19,33)-(19,34)
(19,35)-(19,39)
(19,40)-(19,44)
(19,48)-(19,51)
(20,2)-(20,34)
(20,2)-(20,12)
(20,13)-(20,34)
(20,14)-(20,17)
(20,18)-(20,33)
(20,19)-(20,26)
(20,27)-(20,29)
(20,30)-(20,32)
*)