
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
      let (i,j) = x in ((((i + j) + a) / 10), (((i + j) + a) mod 10)) in
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
(20,23)-(20,69)
(20,36)-(20,37)
(20,46)-(20,68)
(20,58)-(20,59)
(21,4)-(23,51)
*)

(* type error slice
(19,4)-(23,51)
(19,10)-(20,69)
(19,12)-(20,69)
(20,6)-(20,69)
(20,23)-(20,69)
(20,25)-(20,38)
(20,36)-(20,37)
(23,18)-(23,32)
(23,18)-(23,44)
(23,33)-(23,34)
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
(17,11)-(24,34)
(17,14)-(24,34)
(18,2)-(24,34)
(18,11)-(23,51)
(19,4)-(23,51)
(19,10)-(20,69)
(19,12)-(20,69)
(20,6)-(20,69)
(20,18)-(20,19)
(20,23)-(20,69)
(20,24)-(20,44)
(20,25)-(20,38)
(20,26)-(20,33)
(20,27)-(20,28)
(20,31)-(20,32)
(20,36)-(20,37)
(20,41)-(20,43)
(20,46)-(20,68)
(20,47)-(20,60)
(20,48)-(20,55)
(20,49)-(20,50)
(20,53)-(20,54)
(20,58)-(20,59)
(20,65)-(20,67)
(21,4)-(23,51)
(21,15)-(21,22)
(21,16)-(21,17)
(21,19)-(21,21)
(22,4)-(23,51)
(22,15)-(22,55)
(22,15)-(22,27)
(22,28)-(22,41)
(22,29)-(22,37)
(22,38)-(22,40)
(22,42)-(22,55)
(22,43)-(22,51)
(22,52)-(22,54)
(23,4)-(23,51)
(23,18)-(23,44)
(23,18)-(23,32)
(23,33)-(23,34)
(23,35)-(23,39)
(23,40)-(23,44)
(23,48)-(23,51)
(24,2)-(24,34)
(24,2)-(24,12)
(24,13)-(24,34)
(24,14)-(24,17)
(24,18)-(24,33)
(24,19)-(24,26)
(24,27)-(24,29)
(24,30)-(24,32)
*)
