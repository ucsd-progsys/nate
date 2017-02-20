
let rec clone x n =
  let rec clone_RT acc n =
    if n <= 0 then acc else clone_RT (x :: acc) (n - 1) in
  clone_RT [] n;;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  let diff = len1 - len2 in
  if diff < 0
  then ((List.append (clone 0 (- diff)) l1), l2)
  else (l1, (List.append (clone 0 diff) l2));;

let rec removeZero l =
  match l with | [] -> [] | x::xs -> if x = 0 then removeZero xs else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = ([0], [0]) in
    let base = ([0], [0]) in
    let args = (l1, l2) in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  let rec clone_RT acc n =
    if n <= 0 then acc else clone_RT (x :: acc) (n - 1) in
  clone_RT [] n;;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  let diff = len1 - len2 in
  if diff < 0
  then ((List.append (clone 0 (- diff)) l1), l2)
  else (l1, (List.append (clone 0 diff) l2));;

let rec removeZero l =
  match l with | [] -> [] | x::xs -> if x = 0 then removeZero xs else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = (0, []) in
    let base = (0, []) in
    let args = clone 0 (List.length l1) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(20,17)-(20,20)
(20,22)-(20,25)
(20,23)-(20,24)
(21,16)-(21,19)
(21,21)-(21,24)
(21,22)-(21,23)
(22,15)-(22,23)
(22,16)-(22,18)
(22,20)-(22,22)
(22,27)-(22,74)
*)

(* type error slice
(22,4)-(22,74)
(22,15)-(22,23)
(22,41)-(22,55)
(22,41)-(22,67)
(22,63)-(22,67)
*)

(* all spans
(2,14)-(5,15)
(2,16)-(5,15)
(3,2)-(5,15)
(3,19)-(4,55)
(3,23)-(4,55)
(4,4)-(4,55)
(4,7)-(4,13)
(4,7)-(4,8)
(4,12)-(4,13)
(4,19)-(4,22)
(4,28)-(4,55)
(4,28)-(4,36)
(4,37)-(4,47)
(4,38)-(4,39)
(4,43)-(4,46)
(4,48)-(4,55)
(4,49)-(4,50)
(4,53)-(4,54)
(5,2)-(5,15)
(5,2)-(5,10)
(5,11)-(5,13)
(5,14)-(5,15)
(7,12)-(13,44)
(7,15)-(13,44)
(8,2)-(13,44)
(8,13)-(8,27)
(8,13)-(8,24)
(8,25)-(8,27)
(9,2)-(13,44)
(9,13)-(9,27)
(9,13)-(9,24)
(9,25)-(9,27)
(10,2)-(13,44)
(10,13)-(10,24)
(10,13)-(10,17)
(10,20)-(10,24)
(11,2)-(13,44)
(11,5)-(11,13)
(11,5)-(11,9)
(11,12)-(11,13)
(12,7)-(12,48)
(12,8)-(12,43)
(12,9)-(12,20)
(12,21)-(12,39)
(12,22)-(12,27)
(12,28)-(12,29)
(12,30)-(12,38)
(12,33)-(12,37)
(12,40)-(12,42)
(12,45)-(12,47)
(13,7)-(13,44)
(13,8)-(13,10)
(13,12)-(13,43)
(13,13)-(13,24)
(13,25)-(13,39)
(13,26)-(13,31)
(13,32)-(13,33)
(13,34)-(13,38)
(13,40)-(13,42)
(15,19)-(16,71)
(16,2)-(16,71)
(16,8)-(16,9)
(16,23)-(16,25)
(16,37)-(16,71)
(16,40)-(16,45)
(16,40)-(16,41)
(16,44)-(16,45)
(16,51)-(16,64)
(16,51)-(16,61)
(16,62)-(16,64)
(16,70)-(16,71)
(18,11)-(23,34)
(18,14)-(23,34)
(19,2)-(23,34)
(19,11)-(22,74)
(20,4)-(22,74)
(20,10)-(20,26)
(20,12)-(20,26)
(20,16)-(20,26)
(20,17)-(20,20)
(20,18)-(20,19)
(20,22)-(20,25)
(20,23)-(20,24)
(21,4)-(22,74)
(21,15)-(21,25)
(21,16)-(21,19)
(21,17)-(21,18)
(21,21)-(21,24)
(21,22)-(21,23)
(22,4)-(22,74)
(22,15)-(22,23)
(22,16)-(22,18)
(22,20)-(22,22)
(22,27)-(22,74)
(22,41)-(22,67)
(22,41)-(22,55)
(22,56)-(22,57)
(22,58)-(22,62)
(22,63)-(22,67)
(22,71)-(22,74)
(23,2)-(23,34)
(23,2)-(23,12)
(23,13)-(23,34)
(23,14)-(23,17)
(23,18)-(23,33)
(23,19)-(23,26)
(23,27)-(23,29)
(23,30)-(23,32)
*)
