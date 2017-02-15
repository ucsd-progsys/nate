
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
      match x with
      | (i,j)::t -> if (i + j) > 9 then (1, ((i + j) - 10)) else (0, (i + j))
      | [] -> (0, 0) in
    let base = (0, 0) in
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
(20,6)-(22,20)
(21,20)-(21,77)
(21,23)-(21,30)
(21,23)-(21,34)
(21,24)-(21,25)
(21,28)-(21,29)
(21,33)-(21,34)
(21,40)-(21,59)
(21,41)-(21,42)
(21,44)-(21,58)
(21,46)-(21,47)
(21,55)-(21,57)
(21,65)-(21,77)
(21,66)-(21,67)
(21,69)-(21,76)
(21,70)-(21,71)
(22,14)-(22,20)
(22,15)-(22,16)
(22,18)-(22,19)
(23,4)-(25,51)
(23,15)-(23,21)
(23,19)-(23,20)
(24,4)-(25,51)
(24,15)-(24,55)
(25,4)-(25,51)
*)

(* type error slice
(19,4)-(25,51)
(19,10)-(22,20)
(19,12)-(22,20)
(20,6)-(22,20)
(20,6)-(22,20)
(20,12)-(20,13)
(24,4)-(25,51)
(24,15)-(24,27)
(24,15)-(24,55)
(25,18)-(25,32)
(25,18)-(25,44)
(25,33)-(25,34)
(25,40)-(25,44)
*)