
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let lenl1 = List.length l1 in
  let lenl2 = List.length l2 in
  if lenl1 > lenl2
  then (l1, ((clone 0 (lenl1 - lenl2)) @ l2))
  else (((clone 0 (lenl2 - lenl1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (rem,acc) = a in
      let (el1,el2) = x in
      let new_sum = (rem + el1) + el2 in
      let new_rem = if new_sum > 9 then 1 else 0 in
      let norm_sum = if new_sum > 9 then new_sum - 10 else new_sum in
      let larger = if (List.length l1) > (List.length l2) then l1 else l2 in
      if (List.length acc) = ((List.length larger) - 1)
      then
        (if rem = 1
         then (0, ([1; norm_sum] @ acc))
         else (0, (norm_sum :: acc)))
      else (new_rem, (norm_sum :: acc)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  match i with | 1 -> l | _ -> bigAdd ((mulByDigit i) - 1) l;;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let lenl1 = List.length l1 in
  let lenl2 = List.length l2 in
  if lenl1 > lenl2
  then (l1, ((clone 0 (lenl1 - lenl2)) @ l2))
  else (((clone 0 (lenl2 - lenl1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (rem,acc) = a in
      let (el1,el2) = x in
      let new_sum = (rem + el1) + el2 in
      let new_rem = if new_sum > 9 then 1 else 0 in
      let norm_sum = if new_sum > 9 then new_sum - 10 else new_sum in
      let larger = if (List.length l1) > (List.length l2) then l1 else l2 in
      if (List.length acc) = ((List.length larger) - 1)
      then
        (if rem = 1
         then (0, ([1; norm_sum] @ acc))
         else (0, (norm_sum :: acc)))
      else (new_rem, (norm_sum :: acc)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  match i with | 1 -> l | _ -> bigAdd (mulByDigit (i - 1) l) l;;

*)

(* changed spans
(35,38)-(35,58)
(35,39)-(35,53)
(35,51)-(35,52)
*)

(* type error slice
(4,3)-(9,47)
(4,12)-(9,45)
(9,8)-(9,40)
(9,35)-(9,36)
(9,37)-(9,39)
(14,3)-(32,36)
(14,11)-(32,34)
(32,18)-(32,33)
(32,19)-(32,26)
(32,27)-(32,29)
(34,3)-(35,62)
(34,19)-(35,60)
(34,21)-(35,60)
(35,31)-(35,37)
(35,31)-(35,60)
(35,38)-(35,58)
(35,39)-(35,53)
(35,40)-(35,50)
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
(4,12)-(9,45)
(4,15)-(9,45)
(5,2)-(9,45)
(5,14)-(5,28)
(5,14)-(5,25)
(5,26)-(5,28)
(6,2)-(9,45)
(6,14)-(6,28)
(6,14)-(6,25)
(6,26)-(6,28)
(7,2)-(9,45)
(7,5)-(7,18)
(7,5)-(7,10)
(7,13)-(7,18)
(8,7)-(8,45)
(8,8)-(8,10)
(8,12)-(8,44)
(8,39)-(8,40)
(8,13)-(8,38)
(8,14)-(8,19)
(8,20)-(8,21)
(8,22)-(8,37)
(8,23)-(8,28)
(8,31)-(8,36)
(8,41)-(8,43)
(9,7)-(9,45)
(9,8)-(9,40)
(9,35)-(9,36)
(9,9)-(9,34)
(9,10)-(9,15)
(9,16)-(9,17)
(9,18)-(9,33)
(9,19)-(9,24)
(9,27)-(9,32)
(9,37)-(9,39)
(9,42)-(9,44)
(11,19)-(12,74)
(12,2)-(12,74)
(12,8)-(12,9)
(12,23)-(12,25)
(12,36)-(12,74)
(12,39)-(12,44)
(12,39)-(12,40)
(12,43)-(12,44)
(12,50)-(12,62)
(12,50)-(12,60)
(12,61)-(12,62)
(12,68)-(12,74)
(12,68)-(12,69)
(12,73)-(12,74)
(14,11)-(32,34)
(14,14)-(32,34)
(15,2)-(32,34)
(15,11)-(31,51)
(16,4)-(31,51)
(16,10)-(28,39)
(16,12)-(28,39)
(17,6)-(28,39)
(17,22)-(17,23)
(18,6)-(28,39)
(18,22)-(18,23)
(19,6)-(28,39)
(19,20)-(19,37)
(19,20)-(19,31)
(19,21)-(19,24)
(19,27)-(19,30)
(19,34)-(19,37)
(20,6)-(28,39)
(20,20)-(20,48)
(20,23)-(20,34)
(20,23)-(20,30)
(20,33)-(20,34)
(20,40)-(20,41)
(20,47)-(20,48)
(21,6)-(28,39)
(21,21)-(21,66)
(21,24)-(21,35)
(21,24)-(21,31)
(21,34)-(21,35)
(21,41)-(21,53)
(21,41)-(21,48)
(21,51)-(21,53)
(21,59)-(21,66)
(22,6)-(28,39)
(22,19)-(22,73)
(22,22)-(22,57)
(22,22)-(22,38)
(22,23)-(22,34)
(22,35)-(22,37)
(22,41)-(22,57)
(22,42)-(22,53)
(22,54)-(22,56)
(22,63)-(22,65)
(22,71)-(22,73)
(23,6)-(28,39)
(23,9)-(23,55)
(23,9)-(23,26)
(23,10)-(23,21)
(23,22)-(23,25)
(23,29)-(23,55)
(23,30)-(23,50)
(23,31)-(23,42)
(23,43)-(23,49)
(23,53)-(23,54)
(25,8)-(27,37)
(25,12)-(25,19)
(25,12)-(25,15)
(25,18)-(25,19)
(26,14)-(26,40)
(26,15)-(26,16)
(26,18)-(26,39)
(26,33)-(26,34)
(26,19)-(26,32)
(26,20)-(26,21)
(26,23)-(26,31)
(26,35)-(26,38)
(27,14)-(27,36)
(27,15)-(27,16)
(27,18)-(27,35)
(27,19)-(27,27)
(27,31)-(27,34)
(28,11)-(28,39)
(28,12)-(28,19)
(28,21)-(28,38)
(28,22)-(28,30)
(28,34)-(28,37)
(29,4)-(31,51)
(29,15)-(29,22)
(29,16)-(29,17)
(29,19)-(29,21)
(30,4)-(31,51)
(30,15)-(30,44)
(30,15)-(30,23)
(30,24)-(30,44)
(30,25)-(30,37)
(30,38)-(30,40)
(30,41)-(30,43)
(31,4)-(31,51)
(31,18)-(31,44)
(31,18)-(31,32)
(31,33)-(31,34)
(31,35)-(31,39)
(31,40)-(31,44)
(31,48)-(31,51)
(32,2)-(32,34)
(32,2)-(32,12)
(32,13)-(32,34)
(32,14)-(32,17)
(32,18)-(32,33)
(32,19)-(32,26)
(32,27)-(32,29)
(32,30)-(32,32)
(34,19)-(35,60)
(34,21)-(35,60)
(35,2)-(35,60)
(35,8)-(35,9)
(35,22)-(35,23)
(35,31)-(35,60)
(35,31)-(35,37)
(35,38)-(35,58)
(35,39)-(35,53)
(35,40)-(35,50)
(35,51)-(35,52)
(35,56)-(35,57)
(35,59)-(35,60)
*)
