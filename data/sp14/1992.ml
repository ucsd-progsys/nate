
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  let shorter = if len1 < len2 then l1 else l2 in
  let zeros = if shorter = l1 then len2 - len1 else len1 - len2 in
  if shorter = l1
  then ((List.append (clone 0 zeros) shorter), l2)
  else (l1, (List.append (clone 0 zeros) shorter));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (m,n) ->
          if (m + n) > 9 then 1 :: ((m + n) - 10) :: a else (m + n) :: a in
    let base = [] in
    let args = match List.rev (List.combine l1 l2) with | h::t -> h in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  let shorter = if len1 < len2 then l1 else l2 in
  let zeros = if shorter = l1 then len2 - len1 else len1 - len2 in
  if shorter = l1
  then ((List.append (clone 0 zeros) shorter), l2)
  else (l1, (List.append (clone 0 zeros) shorter));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let prevN (n1,n2) = n1 in
      let prev = prevN a in
      let sumlist (p1,p2) = p2 in
      let sum = sumlist a in
      let add (m,n) = m + n in
      let digit = (add x) + prev in
      if digit > 10 then (1, ((digit - 10) :: sum)) else (0, (digit :: sum)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,6)-(21,72)
(19,12)-(19,13)
(21,10)-(21,72)
(21,13)-(21,20)
(21,13)-(21,24)
(21,23)-(21,24)
(21,30)-(21,31)
(21,30)-(21,54)
(21,36)-(21,43)
(21,37)-(21,38)
(21,41)-(21,42)
(21,53)-(21,54)
(21,60)-(21,67)
(21,60)-(21,72)
(21,61)-(21,62)
(21,65)-(21,66)
(21,71)-(21,72)
(22,4)-(24,51)
(22,15)-(22,17)
(23,15)-(23,67)
(23,66)-(23,67)
*)

(* type error slice
(23,4)-(24,51)
(23,15)-(23,67)
(23,21)-(23,29)
(23,21)-(23,50)
(23,30)-(23,50)
(23,31)-(23,43)
(23,66)-(23,67)
(24,18)-(24,32)
(24,18)-(24,44)
(24,40)-(24,44)
*)

(* all spans
(2,14)-(2,65)
(2,16)-(2,65)
(2,20)-(2,65)
(2,23)-(2,29)
(2,23)-(2,24)
(2,28)-(2,29)
(2,35)-(2,37)
(2,43)-(2,65)
(2,43)-(2,44)
(2,48)-(2,65)
(2,49)-(2,54)
(2,55)-(2,56)
(2,57)-(2,64)
(2,58)-(2,59)
(2,62)-(2,63)
(4,12)-(11,50)
(4,15)-(11,50)
(5,2)-(11,50)
(5,13)-(5,27)
(5,13)-(5,24)
(5,25)-(5,27)
(6,2)-(11,50)
(6,13)-(6,27)
(6,13)-(6,24)
(6,25)-(6,27)
(7,2)-(11,50)
(7,16)-(7,46)
(7,19)-(7,30)
(7,19)-(7,23)
(7,26)-(7,30)
(7,36)-(7,38)
(7,44)-(7,46)
(8,2)-(11,50)
(8,14)-(8,63)
(8,17)-(8,29)
(8,17)-(8,24)
(8,27)-(8,29)
(8,35)-(8,46)
(8,35)-(8,39)
(8,42)-(8,46)
(8,52)-(8,63)
(8,52)-(8,56)
(8,59)-(8,63)
(9,2)-(11,50)
(9,5)-(9,17)
(9,5)-(9,12)
(9,15)-(9,17)
(10,7)-(10,50)
(10,8)-(10,45)
(10,9)-(10,20)
(10,21)-(10,36)
(10,22)-(10,27)
(10,28)-(10,29)
(10,30)-(10,35)
(10,37)-(10,44)
(10,47)-(10,49)
(11,7)-(11,50)
(11,8)-(11,10)
(11,12)-(11,49)
(11,13)-(11,24)
(11,25)-(11,40)
(11,26)-(11,31)
(11,32)-(11,33)
(11,34)-(11,39)
(11,41)-(11,48)
(13,19)-(14,69)
(14,2)-(14,69)
(14,8)-(14,9)
(14,23)-(14,25)
(14,36)-(14,69)
(14,39)-(14,44)
(14,39)-(14,40)
(14,43)-(14,44)
(14,50)-(14,62)
(14,50)-(14,60)
(14,61)-(14,62)
(14,68)-(14,69)
(16,11)-(25,34)
(16,14)-(25,34)
(17,2)-(25,34)
(17,11)-(24,51)
(18,4)-(24,51)
(18,10)-(21,72)
(18,12)-(21,72)
(19,6)-(21,72)
(19,12)-(19,13)
(21,10)-(21,72)
(21,13)-(21,24)
(21,13)-(21,20)
(21,14)-(21,15)
(21,18)-(21,19)
(21,23)-(21,24)
(21,30)-(21,54)
(21,30)-(21,31)
(21,35)-(21,54)
(21,35)-(21,49)
(21,36)-(21,43)
(21,37)-(21,38)
(21,41)-(21,42)
(21,46)-(21,48)
(21,53)-(21,54)
(21,60)-(21,72)
(21,60)-(21,67)
(21,61)-(21,62)
(21,65)-(21,66)
(21,71)-(21,72)
(22,4)-(24,51)
(22,15)-(22,17)
(23,4)-(24,51)
(23,15)-(23,67)
(23,21)-(23,50)
(23,21)-(23,29)
(23,30)-(23,50)
(23,31)-(23,43)
(23,44)-(23,46)
(23,47)-(23,49)
(23,66)-(23,67)
(24,4)-(24,51)
(24,18)-(24,44)
(24,18)-(24,32)
(24,33)-(24,34)
(24,35)-(24,39)
(24,40)-(24,44)
(24,48)-(24,51)
(25,2)-(25,34)
(25,2)-(25,12)
(25,13)-(25,34)
(25,14)-(25,17)
(25,18)-(25,33)
(25,19)-(25,26)
(25,27)-(25,29)
(25,30)-(25,32)
*)
