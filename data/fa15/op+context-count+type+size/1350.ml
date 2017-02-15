
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let difference = (List.length l1) - (List.length l2) in
  if difference > 0
  then (l1, ((clone 0 difference) @ l2))
  else
    if difference < 0
    then (((clone 0 ((-1) * difference)) @ l1), l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let sum = match x with | (x1,x2) -> x1 + x2 in if sum < 10 then x :: a in
    let base = [] in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let difference = (List.length l1) - (List.length l2) in
  if difference > 0
  then (l1, ((clone 0 difference) @ l2))
  else
    if difference < 0
    then (((clone 0 ((-1) * difference)) @ l1), l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = match a with | (o,[]) -> (o, [x]) | (o,l) -> (o, (x :: l)) in
    let base = (0, []) in
    let args =
      let combine (a,b) = a + b in
      List.map combine (List.rev (List.combine l1 l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,6)-(19,76)
(19,16)-(19,49)
(19,22)-(19,23)
(19,42)-(19,44)
(19,42)-(19,49)
(19,47)-(19,49)
(19,53)-(19,76)
(19,56)-(19,59)
(19,56)-(19,64)
(19,62)-(19,64)
(19,70)-(19,76)
(19,75)-(19,76)
(20,4)-(22,51)
(20,15)-(20,17)
(21,4)-(22,51)
(21,15)-(21,44)
(22,4)-(22,51)
(23,14)-(23,17)
(23,18)-(23,33)
(23,19)-(23,26)
(23,27)-(23,29)
(23,30)-(23,32)
*)

(* type error slice
(18,4)-(22,51)
(18,10)-(19,76)
(19,53)-(19,76)
(19,53)-(19,76)
(19,53)-(19,76)
(19,70)-(19,76)
(19,70)-(19,76)
(19,75)-(19,76)
(22,4)-(22,51)
(22,18)-(22,32)
(22,18)-(22,44)
(22,33)-(22,34)
*)