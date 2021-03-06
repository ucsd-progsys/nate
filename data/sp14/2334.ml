
let rec clone x n =
  let accum = [] in
  let rec helper accum n =
    if n < 1 then accum else helper (x :: accum) (n - 1) in
  helper accum n;;

let padZero l1 l2 =
  let (a,b) = ((List.length l1), (List.length l2)) in
  if a < b
  then ((List.append (clone 0 (b - a)) l1), l2)
  else if b < a then (l1, (List.append (clone 0 (a - b)) l2)) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (h::t,b) = a in
      if (x + h) > 9
      then
        (if t = []
         then ([], (1 :: ((x + h) - 10) :: b))
         else (let h2::t2 = t in (((h2 + 1) :: t2), (((x + h) - 10) :: b))))
      else (t, ((x + h) :: b)) in
    let base = ((List.rev l1), []) in
    let args = List.rev l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let accum = [] in
  let rec helper x l accum =
    if x != 0 then (helper x) - (1 l (bigAdd l accum)) else accum in
  mulByDigit (helper i l accum);;


(* fix

let rec clone x n =
  let accum = [] in
  let rec helper accum n =
    if n < 1 then accum else helper (x :: accum) (n - 1) in
  helper accum n;;

let padZero l1 l2 =
  let (a,b) = ((List.length l1), (List.length l2)) in
  if a < b
  then ((List.append (clone 0 (b - a)) l1), l2)
  else if b < a then (l1, (List.append (clone 0 (a - b)) l2)) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (h::t,b) = a in
      if (x + h) > 9
      then
        (if t = []
         then ([], (1 :: ((x + h) - 10) :: b))
         else (let h2::t2 = t in (((h2 + 1) :: t2), (((x + h) - 10) :: b))))
      else (t, ((x + h) :: b)) in
    let base = ((List.rev l1), []) in
    let args = List.rev l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let accum = [] in
  let rec helper x l accum =
    if x != 0 then helper (x - 1) l (bigAdd l accum) else accum in
  mulByDigit i (helper i l accum);;

*)

(* changed spans
(34,19)-(34,29)
(34,19)-(34,54)
(34,27)-(34,28)
(34,32)-(34,54)
(35,2)-(35,31)
(35,13)-(35,31)
*)

(* type error slice
(8,3)-(12,77)
(8,12)-(12,75)
(8,15)-(12,75)
(12,26)-(12,60)
(12,27)-(12,38)
(12,57)-(12,59)
(17,3)-(29,36)
(17,11)-(29,34)
(17,14)-(29,34)
(29,18)-(29,33)
(29,19)-(29,26)
(29,30)-(29,32)
(33,2)-(35,31)
(33,17)-(34,65)
(33,19)-(34,65)
(34,4)-(34,65)
(34,19)-(34,29)
(34,19)-(34,54)
(34,20)-(34,26)
(34,32)-(34,54)
(34,33)-(34,34)
(34,37)-(34,53)
(34,38)-(34,44)
(34,47)-(34,52)
(34,60)-(34,65)
(35,13)-(35,31)
(35,14)-(35,20)
*)

(* all spans
(2,14)-(6,16)
(2,16)-(6,16)
(3,2)-(6,16)
(3,14)-(3,16)
(4,2)-(6,16)
(4,17)-(5,56)
(4,23)-(5,56)
(5,4)-(5,56)
(5,7)-(5,12)
(5,7)-(5,8)
(5,11)-(5,12)
(5,18)-(5,23)
(5,29)-(5,56)
(5,29)-(5,35)
(5,36)-(5,48)
(5,37)-(5,38)
(5,42)-(5,47)
(5,49)-(5,56)
(5,50)-(5,51)
(5,54)-(5,55)
(6,2)-(6,16)
(6,2)-(6,8)
(6,9)-(6,14)
(6,15)-(6,16)
(8,12)-(12,75)
(8,15)-(12,75)
(9,2)-(12,75)
(9,14)-(9,50)
(9,15)-(9,31)
(9,16)-(9,27)
(9,28)-(9,30)
(9,33)-(9,49)
(9,34)-(9,45)
(9,46)-(9,48)
(10,2)-(12,75)
(10,5)-(10,10)
(10,5)-(10,6)
(10,9)-(10,10)
(11,7)-(11,47)
(11,8)-(11,42)
(11,9)-(11,20)
(11,21)-(11,38)
(11,22)-(11,27)
(11,28)-(11,29)
(11,30)-(11,37)
(11,31)-(11,32)
(11,35)-(11,36)
(11,39)-(11,41)
(11,44)-(11,46)
(12,7)-(12,75)
(12,10)-(12,15)
(12,10)-(12,11)
(12,14)-(12,15)
(12,21)-(12,61)
(12,22)-(12,24)
(12,26)-(12,60)
(12,27)-(12,38)
(12,39)-(12,56)
(12,40)-(12,45)
(12,46)-(12,47)
(12,48)-(12,55)
(12,49)-(12,50)
(12,53)-(12,54)
(12,57)-(12,59)
(12,67)-(12,75)
(12,68)-(12,70)
(12,72)-(12,74)
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
(17,11)-(29,34)
(17,14)-(29,34)
(18,2)-(29,34)
(18,11)-(28,77)
(19,4)-(28,77)
(19,10)-(26,30)
(19,12)-(26,30)
(20,6)-(26,30)
(20,21)-(20,22)
(21,6)-(26,30)
(21,9)-(21,20)
(21,9)-(21,16)
(21,10)-(21,11)
(21,14)-(21,15)
(21,19)-(21,20)
(23,8)-(25,76)
(23,12)-(23,18)
(23,12)-(23,13)
(23,16)-(23,18)
(24,14)-(24,46)
(24,15)-(24,17)
(24,19)-(24,45)
(24,20)-(24,21)
(24,25)-(24,44)
(24,25)-(24,39)
(24,26)-(24,33)
(24,27)-(24,28)
(24,31)-(24,32)
(24,36)-(24,38)
(24,43)-(24,44)
(25,14)-(25,75)
(25,28)-(25,29)
(25,33)-(25,74)
(25,34)-(25,50)
(25,35)-(25,43)
(25,36)-(25,38)
(25,41)-(25,42)
(25,47)-(25,49)
(25,52)-(25,73)
(25,53)-(25,67)
(25,54)-(25,61)
(25,55)-(25,56)
(25,59)-(25,60)
(25,64)-(25,66)
(25,71)-(25,72)
(26,11)-(26,30)
(26,12)-(26,13)
(26,15)-(26,29)
(26,16)-(26,23)
(26,17)-(26,18)
(26,21)-(26,22)
(26,27)-(26,28)
(27,4)-(28,77)
(27,15)-(27,34)
(27,16)-(27,29)
(27,17)-(27,25)
(27,26)-(27,28)
(27,31)-(27,33)
(28,4)-(28,77)
(28,15)-(28,26)
(28,15)-(28,23)
(28,24)-(28,26)
(28,30)-(28,77)
(28,44)-(28,70)
(28,44)-(28,58)
(28,59)-(28,60)
(28,61)-(28,65)
(28,66)-(28,70)
(28,74)-(28,77)
(29,2)-(29,34)
(29,2)-(29,12)
(29,13)-(29,34)
(29,14)-(29,17)
(29,18)-(29,33)
(29,19)-(29,26)
(29,27)-(29,29)
(29,30)-(29,32)
(31,19)-(35,31)
(31,21)-(35,31)
(32,2)-(35,31)
(32,14)-(32,16)
(33,2)-(35,31)
(33,17)-(34,65)
(33,19)-(34,65)
(33,21)-(34,65)
(34,4)-(34,65)
(34,7)-(34,13)
(34,7)-(34,8)
(34,12)-(34,13)
(34,19)-(34,54)
(34,19)-(34,29)
(34,20)-(34,26)
(34,27)-(34,28)
(34,32)-(34,54)
(34,33)-(34,34)
(34,35)-(34,36)
(34,37)-(34,53)
(34,38)-(34,44)
(34,45)-(34,46)
(34,47)-(34,52)
(34,60)-(34,65)
(35,2)-(35,31)
(35,2)-(35,12)
(35,13)-(35,31)
(35,14)-(35,20)
(35,21)-(35,22)
(35,23)-(35,24)
(35,25)-(35,30)
*)
