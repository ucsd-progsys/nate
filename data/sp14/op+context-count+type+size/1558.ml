
let rec clone x n =
  let rec helper a b acc = if b > 0 then helper a (b - 1) (a :: acc) else acc in
  helper x n [];;

let padZero l1 l2 =
  let l1_len = List.length l1 in
  let l2_len = List.length l2 in
  let l_diff = l1_len - l2_len in
  if l_diff < 0
  then (((clone 0 (l_diff * (-1))) @ l1), l2)
  else (l1, ((clone 0 l_diff) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = (x *. x) +. a in
    let base = 0. in
    let args = l1 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  let rec helper a b acc = if b > 0 then helper a (b - 1) (a :: acc) else acc in
  helper x n [];;

let padZero l1 l2 =
  let l1_len = List.length l1 in
  let l2_len = List.length l2 in
  let l_diff = l1_len - l2_len in
  if l_diff < 0
  then (((clone 0 (l_diff * (-1))) @ l1), l2)
  else (l1, ((clone 0 l_diff) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = ([x + 1], [x + 1]) in
    let base = ([], []) in
    let args = l1 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,16)-(19,24)
(19,16)-(19,29)
(19,17)-(19,18)
(19,22)-(19,23)
(19,28)-(19,29)
(20,15)-(20,17)
(21,4)-(21,68)
(22,14)-(22,17)
(22,18)-(22,33)
(22,19)-(22,26)
(22,27)-(22,29)
(22,30)-(22,32)
*)

(* type error slice
(19,4)-(21,68)
(19,10)-(19,29)
(19,16)-(19,29)
(19,28)-(19,29)
(21,21)-(21,68)
(21,35)-(21,49)
(21,35)-(21,61)
(21,50)-(21,51)
*)

(* all spans
(2,14)-(4,15)
(2,16)-(4,15)
(3,2)-(4,15)
(3,17)-(3,77)
(3,19)-(3,77)
(3,21)-(3,77)
(3,27)-(3,77)
(3,30)-(3,35)
(3,30)-(3,31)
(3,34)-(3,35)
(3,41)-(3,68)
(3,41)-(3,47)
(3,48)-(3,49)
(3,50)-(3,57)
(3,51)-(3,52)
(3,55)-(3,56)
(3,58)-(3,68)
(3,59)-(3,60)
(3,64)-(3,67)
(3,74)-(3,77)
(4,2)-(4,15)
(4,2)-(4,8)
(4,9)-(4,10)
(4,11)-(4,12)
(4,13)-(4,15)
(6,12)-(12,36)
(6,15)-(12,36)
(7,2)-(12,36)
(7,15)-(7,29)
(7,15)-(7,26)
(7,27)-(7,29)
(8,2)-(12,36)
(8,15)-(8,29)
(8,15)-(8,26)
(8,27)-(8,29)
(9,2)-(12,36)
(9,15)-(9,30)
(9,15)-(9,21)
(9,24)-(9,30)
(10,2)-(12,36)
(10,5)-(10,15)
(10,5)-(10,11)
(10,14)-(10,15)
(11,7)-(11,45)
(11,8)-(11,40)
(11,35)-(11,36)
(11,9)-(11,34)
(11,10)-(11,15)
(11,16)-(11,17)
(11,18)-(11,33)
(11,19)-(11,25)
(11,28)-(11,32)
(11,37)-(11,39)
(11,42)-(11,44)
(12,7)-(12,36)
(12,8)-(12,10)
(12,12)-(12,35)
(12,30)-(12,31)
(12,13)-(12,29)
(12,14)-(12,19)
(12,20)-(12,21)
(12,22)-(12,28)
(12,32)-(12,34)
(14,19)-(15,74)
(15,2)-(15,74)
(15,8)-(15,9)
(15,23)-(15,25)
(15,36)-(15,74)
(15,39)-(15,44)
(15,39)-(15,40)
(15,43)-(15,44)
(15,50)-(15,62)
(15,50)-(15,60)
(15,61)-(15,62)
(15,68)-(15,74)
(15,68)-(15,69)
(15,73)-(15,74)
(17,11)-(22,34)
(17,14)-(22,34)
(18,2)-(22,34)
(18,11)-(21,68)
(19,4)-(21,68)
(19,10)-(19,29)
(19,12)-(19,29)
(19,16)-(19,29)
(19,16)-(19,24)
(19,17)-(19,18)
(19,22)-(19,23)
(19,28)-(19,29)
(20,4)-(21,68)
(20,15)-(20,17)
(21,4)-(21,68)
(21,15)-(21,17)
(21,21)-(21,68)
(21,35)-(21,61)
(21,35)-(21,49)
(21,50)-(21,51)
(21,52)-(21,56)
(21,57)-(21,61)
(21,65)-(21,68)
(22,2)-(22,34)
(22,2)-(22,12)
(22,13)-(22,34)
(22,14)-(22,17)
(22,18)-(22,33)
(22,19)-(22,26)
(22,27)-(22,29)
(22,30)-(22,32)
*)
