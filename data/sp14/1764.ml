
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let first = List.length l1 in
  let sec = List.length l2 in
  if first < sec
  then ((List.append (clone 0 (sec - first)) l1), l2)
  else
    if first > sec
    then (l1, (List.append (clone 0 (first - sec)) l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (i,j) = x in
      let (s,t) = a in
      (((((i + j) + s) + t) / 10), ((((i + j) + s) + t) mod 10)) in
    let base = (0, []) in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let first = List.length l1 in
  let sec = List.length l2 in
  if first < sec
  then ((List.append (clone 0 (sec - first)) l1), l2)
  else
    if first > sec
    then (l1, (List.append (clone 0 (first - sec)) l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (i,j) = x in
      let (s,t) = a in ((((i + j) + s) / 10), ((((i + j) + s) mod 10) :: t)) in
    let base = (0, []) in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(22,10)-(22,17)
(22,25)-(22,26)
(22,35)-(22,63)
(22,38)-(22,45)
(22,53)-(22,54)
(23,4)-(25,51)
*)

(* type error slice
(19,4)-(25,51)
(19,10)-(22,64)
(21,6)-(22,64)
(21,18)-(21,19)
(22,8)-(22,27)
(22,25)-(22,26)
(23,4)-(25,51)
(23,15)-(23,22)
(23,19)-(23,21)
(25,18)-(25,32)
(25,18)-(25,44)
(25,33)-(25,34)
(25,35)-(25,39)
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
(4,12)-(12,17)
(4,15)-(12,17)
(5,2)-(12,17)
(5,14)-(5,28)
(5,14)-(5,25)
(5,26)-(5,28)
(6,2)-(12,17)
(6,12)-(6,26)
(6,12)-(6,23)
(6,24)-(6,26)
(7,2)-(12,17)
(7,5)-(7,16)
(7,5)-(7,10)
(7,13)-(7,16)
(8,7)-(8,53)
(8,8)-(8,48)
(8,9)-(8,20)
(8,21)-(8,44)
(8,22)-(8,27)
(8,28)-(8,29)
(8,30)-(8,43)
(8,31)-(8,34)
(8,37)-(8,42)
(8,45)-(8,47)
(8,50)-(8,52)
(10,4)-(12,17)
(10,7)-(10,18)
(10,7)-(10,12)
(10,15)-(10,18)
(11,9)-(11,55)
(11,10)-(11,12)
(11,14)-(11,54)
(11,15)-(11,26)
(11,27)-(11,50)
(11,28)-(11,33)
(11,34)-(11,35)
(11,36)-(11,49)
(11,37)-(11,42)
(11,45)-(11,48)
(11,51)-(11,53)
(12,9)-(12,17)
(12,10)-(12,12)
(12,14)-(12,16)
(14,19)-(15,69)
(15,2)-(15,69)
(15,8)-(15,9)
(15,23)-(15,25)
(15,36)-(15,69)
(15,39)-(15,44)
(15,39)-(15,40)
(15,43)-(15,44)
(15,50)-(15,62)
(15,50)-(15,60)
(15,61)-(15,62)
(15,68)-(15,69)
(17,11)-(26,34)
(17,14)-(26,34)
(18,2)-(26,34)
(18,11)-(25,51)
(19,4)-(25,51)
(19,10)-(22,64)
(19,12)-(22,64)
(20,6)-(22,64)
(20,18)-(20,19)
(21,6)-(22,64)
(21,18)-(21,19)
(22,6)-(22,64)
(22,7)-(22,33)
(22,8)-(22,27)
(22,9)-(22,22)
(22,10)-(22,17)
(22,11)-(22,12)
(22,15)-(22,16)
(22,20)-(22,21)
(22,25)-(22,26)
(22,30)-(22,32)
(22,35)-(22,63)
(22,36)-(22,55)
(22,37)-(22,50)
(22,38)-(22,45)
(22,39)-(22,40)
(22,43)-(22,44)
(22,48)-(22,49)
(22,53)-(22,54)
(22,60)-(22,62)
(23,4)-(25,51)
(23,15)-(23,22)
(23,16)-(23,17)
(23,19)-(23,21)
(24,4)-(25,51)
(24,15)-(24,55)
(24,15)-(24,27)
(24,28)-(24,41)
(24,29)-(24,37)
(24,38)-(24,40)
(24,42)-(24,55)
(24,43)-(24,51)
(24,52)-(24,54)
(25,4)-(25,51)
(25,18)-(25,44)
(25,18)-(25,32)
(25,33)-(25,34)
(25,35)-(25,39)
(25,40)-(25,44)
(25,48)-(25,51)
(26,2)-(26,34)
(26,2)-(26,12)
(26,13)-(26,34)
(26,14)-(26,17)
(26,18)-(26,33)
(26,19)-(26,26)
(26,27)-(26,29)
(26,30)-(26,32)
*)
