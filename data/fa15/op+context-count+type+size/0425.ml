
let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x = y
  then (l1, l2)
  else
    if x < y
    then (((clone 0 (y - x)) @ l1), l2)
    else (l1, ((clone 0 (x - y)) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (l1x,l2x) = x in
      let (a1,a2) = a in
      let test = match a1 with | [] -> 0 | h::t -> h in
      let sum = (l1x + l2x) + test in
      if (List.length a2) = ((List.length l1) - 1)
      then (((sum / 10) :: a1), ((sum / 10) :: (sum mod 10) :: a2))
      else (((sum / 10) :: a1), ((sum mod 10) :: a2)) in
    let base = ([], []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i < 1 then [] else bigAdd l (mulByDigit (i - 1) l);;

let bigMul l1 l2 =
  let f a x =
    let test = match a with | [] -> 1 | h::t -> 10 * h in
    let multi = mulByDigit (test * x) l1 in ((test :: a), (bigAdd multi a)) in
  let base = ([], []) in
  let args = List.rev l2 in let (_,res) = List.fold_left f base args in res;;


(* fix

let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x = y
  then (l1, l2)
  else
    if x < y
    then (((clone 0 (y - x)) @ l1), l2)
    else (l1, ((clone 0 (x - y)) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (l1x,l2x) = x in
      let (a1,a2) = a in
      let test = match a1 with | [] -> 0 | h::t -> h in
      let sum = (l1x + l2x) + test in
      if (List.length a2) = ((List.length l1) - 1)
      then (((sum / 10) :: a1), ((sum / 10) :: (sum mod 10) :: a2))
      else (((sum / 10) :: a1), ((sum mod 10) :: a2)) in
    let base = ([], []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i < 1 then [] else bigAdd l (mulByDigit (i - 1) l);;

let bigMul l1 l2 =
  let f a x =
    let (a1,a2) = a in
    let test = match a1 with | [] -> 1 | h::t -> 10 * h in
    let multi = mulByDigit (test * x) l1 in ((test :: a1), (bigAdd multi a2)) in
  let base = ([], []) in
  let args = List.rev l2 in let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(37,4)-(38,75)
(37,15)-(37,54)
(37,36)-(37,37)
(38,4)-(38,75)
(38,54)-(38,55)
(38,72)-(38,73)
(39,2)-(40,75)
(39,13)-(39,21)
(40,2)-(40,75)
(40,28)-(40,75)
*)

(* type error slice
(36,2)-(40,75)
(36,8)-(38,75)
(36,10)-(38,75)
(37,4)-(38,75)
(37,15)-(37,54)
(37,15)-(37,54)
(37,21)-(37,22)
(38,4)-(38,75)
(38,44)-(38,75)
(40,42)-(40,56)
(40,42)-(40,68)
(40,57)-(40,58)
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
(4,12)-(12,39)
(4,15)-(12,39)
(5,2)-(12,39)
(5,10)-(5,24)
(5,10)-(5,21)
(5,22)-(5,24)
(6,2)-(12,39)
(6,10)-(6,24)
(6,10)-(6,21)
(6,22)-(6,24)
(7,2)-(12,39)
(7,5)-(7,10)
(7,5)-(7,6)
(7,9)-(7,10)
(8,7)-(8,15)
(8,8)-(8,10)
(8,12)-(8,14)
(10,4)-(12,39)
(10,7)-(10,12)
(10,7)-(10,8)
(10,11)-(10,12)
(11,9)-(11,39)
(11,10)-(11,34)
(11,29)-(11,30)
(11,11)-(11,28)
(11,12)-(11,17)
(11,18)-(11,19)
(11,20)-(11,27)
(11,21)-(11,22)
(11,25)-(11,26)
(11,31)-(11,33)
(11,36)-(11,38)
(12,9)-(12,39)
(12,10)-(12,12)
(12,14)-(12,38)
(12,33)-(12,34)
(12,15)-(12,32)
(12,16)-(12,21)
(12,22)-(12,23)
(12,24)-(12,31)
(12,25)-(12,26)
(12,29)-(12,30)
(12,35)-(12,37)
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
(17,11)-(30,34)
(17,14)-(30,34)
(18,2)-(30,34)
(18,11)-(29,51)
(19,4)-(29,51)
(19,10)-(26,53)
(19,12)-(26,53)
(20,6)-(26,53)
(20,22)-(20,23)
(21,6)-(26,53)
(21,20)-(21,21)
(22,6)-(26,53)
(22,17)-(22,52)
(22,23)-(22,25)
(22,39)-(22,40)
(22,51)-(22,52)
(23,6)-(26,53)
(23,16)-(23,34)
(23,16)-(23,27)
(23,17)-(23,20)
(23,23)-(23,26)
(23,30)-(23,34)
(24,6)-(26,53)
(24,9)-(24,50)
(24,9)-(24,25)
(24,10)-(24,21)
(24,22)-(24,24)
(24,28)-(24,50)
(24,29)-(24,45)
(24,30)-(24,41)
(24,42)-(24,44)
(24,48)-(24,49)
(25,11)-(25,67)
(25,12)-(25,30)
(25,13)-(25,23)
(25,14)-(25,17)
(25,20)-(25,22)
(25,27)-(25,29)
(25,32)-(25,66)
(25,33)-(25,43)
(25,34)-(25,37)
(25,40)-(25,42)
(25,47)-(25,65)
(25,47)-(25,59)
(25,48)-(25,51)
(25,56)-(25,58)
(25,63)-(25,65)
(26,11)-(26,53)
(26,12)-(26,30)
(26,13)-(26,23)
(26,14)-(26,17)
(26,20)-(26,22)
(26,27)-(26,29)
(26,32)-(26,52)
(26,33)-(26,45)
(26,34)-(26,37)
(26,42)-(26,44)
(26,49)-(26,51)
(27,4)-(29,51)
(27,15)-(27,23)
(27,16)-(27,18)
(27,20)-(27,22)
(28,4)-(29,51)
(28,15)-(28,44)
(28,15)-(28,23)
(28,24)-(28,44)
(28,25)-(28,37)
(28,38)-(28,40)
(28,41)-(28,43)
(29,4)-(29,51)
(29,18)-(29,44)
(29,18)-(29,32)
(29,33)-(29,34)
(29,35)-(29,39)
(29,40)-(29,44)
(29,48)-(29,51)
(30,2)-(30,34)
(30,2)-(30,12)
(30,13)-(30,34)
(30,14)-(30,17)
(30,18)-(30,33)
(30,19)-(30,26)
(30,27)-(30,29)
(30,30)-(30,32)
(32,19)-(33,55)
(32,21)-(33,55)
(33,2)-(33,55)
(33,5)-(33,10)
(33,5)-(33,6)
(33,9)-(33,10)
(33,16)-(33,18)
(33,24)-(33,55)
(33,24)-(33,30)
(33,31)-(33,32)
(33,33)-(33,55)
(33,34)-(33,44)
(33,45)-(33,52)
(33,46)-(33,47)
(33,50)-(33,51)
(33,53)-(33,54)
(35,11)-(40,75)
(35,14)-(40,75)
(36,2)-(40,75)
(36,8)-(38,75)
(36,10)-(38,75)
(37,4)-(38,75)
(37,15)-(37,54)
(37,21)-(37,22)
(37,36)-(37,37)
(37,48)-(37,54)
(37,48)-(37,50)
(37,53)-(37,54)
(38,4)-(38,75)
(38,16)-(38,40)
(38,16)-(38,26)
(38,27)-(38,37)
(38,28)-(38,32)
(38,35)-(38,36)
(38,38)-(38,40)
(38,44)-(38,75)
(38,45)-(38,56)
(38,46)-(38,50)
(38,54)-(38,55)
(38,58)-(38,74)
(38,59)-(38,65)
(38,66)-(38,71)
(38,72)-(38,73)
(39,2)-(40,75)
(39,13)-(39,21)
(39,14)-(39,16)
(39,18)-(39,20)
(40,2)-(40,75)
(40,13)-(40,24)
(40,13)-(40,21)
(40,22)-(40,24)
(40,28)-(40,75)
(40,42)-(40,68)
(40,42)-(40,56)
(40,57)-(40,58)
(40,59)-(40,63)
(40,64)-(40,68)
(40,72)-(40,75)
*)
