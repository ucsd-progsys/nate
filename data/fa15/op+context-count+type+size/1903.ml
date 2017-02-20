
let rec clone x n =
  if n < 1 then [] else (match n with | _ -> x :: (clone x (n - 1)));;

let c y = y;;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 = s2
  then (l1, l2)
  else
    if s1 > s2
    then (l1, ((clone 0 (s1 - s2)) @ l2))
    else (((clone 0 (s2 - s1)) @ l1), l2);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      let c::c'::c'' = a1 in
      let s::s' = a2 in
      let v = (x1 + x2) + c' in
      (([c + 1] @ [v / 10]), (s' @ ([s + c'] @ [v mod 10]))) in
    let base = ([0; 0], [5]) in
    let args = List.combine l1 l2 in
    let (duh,res) = List.fold_left f base args in (duh, res) in
  add (padZero l1 l2);;

let rec mulByDigit i l =
  match i with | 0 -> [] | 1 -> l | _ -> bigAdd l (mulByDigit (i - 1) l);;


(* fix

let rec clone x n =
  if n < 1 then [] else (match n with | _ -> x :: (clone x (n - 1)));;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 = s2
  then (l1, l2)
  else
    if s1 > s2
    then (l1, ((clone 0 (s1 - s2)) @ l2))
    else (((clone 0 (s2 - s1)) @ l1), l2);;

let rec removeZero l =
  if l = []
  then []
  else (let h::t = l in match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (c,a1::a2) = a in
      let v = (x1 + x2) + c in ((v / 10), ([v / 10] @ ([v mod 10] @ a2))) in
    let base = (0, [0]) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i < 1
  then []
  else (match i with | 1 -> l | _ -> bigAdd l (mulByDigit (i - 1) l));;

*)

(* changed spans
(5,6)-(5,11)
(5,10)-(5,11)
(8,2)-(15,41)
(9,2)-(15,41)
(17,11)-(29,21)
(18,2)-(29,21)
(19,4)-(28,60)
(20,6)-(25,60)
(21,6)-(25,60)
(22,6)-(25,60)
(22,23)-(22,25)
(23,6)-(25,60)
(23,18)-(23,20)
(24,6)-(25,60)
(24,26)-(24,28)
(25,7)-(25,27)
(25,9)-(25,10)
(25,9)-(25,14)
(25,13)-(25,14)
(25,18)-(25,26)
(25,30)-(25,32)
(25,35)-(25,58)
(25,37)-(25,38)
(25,37)-(25,43)
(25,41)-(25,43)
(25,45)-(25,46)
(25,47)-(25,57)
(26,4)-(28,60)
(26,16)-(26,22)
(26,20)-(26,21)
(26,25)-(26,26)
(27,15)-(27,33)
(28,4)-(28,60)
(28,50)-(28,60)
(28,51)-(28,54)
(29,2)-(29,5)
(32,2)-(32,72)
(32,8)-(32,9)
(32,22)-(32,24)
(32,32)-(32,33)
(32,63)-(32,64)
(32,67)-(32,68)
*)

(* type error slice
(17,3)-(29,23)
(17,11)-(29,21)
(17,14)-(29,21)
(18,2)-(29,21)
(18,2)-(29,21)
(18,11)-(28,60)
(19,4)-(28,60)
(26,4)-(28,60)
(27,4)-(28,60)
(28,4)-(28,60)
(28,50)-(28,60)
(29,2)-(29,5)
(29,2)-(29,21)
(32,2)-(32,72)
(32,2)-(32,72)
(32,22)-(32,24)
(32,41)-(32,47)
(32,41)-(32,72)
*)

(* all spans
(2,14)-(3,68)
(2,16)-(3,68)
(3,2)-(3,68)
(3,5)-(3,10)
(3,5)-(3,6)
(3,9)-(3,10)
(3,16)-(3,18)
(3,24)-(3,68)
(3,31)-(3,32)
(3,45)-(3,67)
(3,45)-(3,46)
(3,50)-(3,67)
(3,51)-(3,56)
(3,57)-(3,58)
(3,59)-(3,66)
(3,60)-(3,61)
(3,64)-(3,65)
(5,6)-(5,11)
(5,10)-(5,11)
(7,12)-(15,41)
(7,15)-(15,41)
(8,2)-(15,41)
(8,11)-(8,25)
(8,11)-(8,22)
(8,23)-(8,25)
(9,2)-(15,41)
(9,11)-(9,25)
(9,11)-(9,22)
(9,23)-(9,25)
(10,2)-(15,41)
(10,5)-(10,12)
(10,5)-(10,7)
(10,10)-(10,12)
(11,7)-(11,15)
(11,8)-(11,10)
(11,12)-(11,14)
(13,4)-(15,41)
(13,7)-(13,14)
(13,7)-(13,9)
(13,12)-(13,14)
(14,9)-(14,41)
(14,10)-(14,12)
(14,14)-(14,40)
(14,35)-(14,36)
(14,15)-(14,34)
(14,16)-(14,21)
(14,22)-(14,23)
(14,24)-(14,33)
(14,25)-(14,27)
(14,30)-(14,32)
(14,37)-(14,39)
(15,9)-(15,41)
(15,10)-(15,36)
(15,31)-(15,32)
(15,11)-(15,30)
(15,12)-(15,17)
(15,18)-(15,19)
(15,20)-(15,29)
(15,21)-(15,23)
(15,26)-(15,28)
(15,33)-(15,35)
(15,38)-(15,40)
(17,11)-(29,21)
(17,14)-(29,21)
(18,2)-(29,21)
(18,11)-(28,60)
(19,4)-(28,60)
(19,10)-(25,60)
(19,12)-(25,60)
(20,6)-(25,60)
(20,20)-(20,21)
(21,6)-(25,60)
(21,20)-(21,21)
(22,6)-(25,60)
(22,23)-(22,25)
(23,6)-(25,60)
(23,18)-(23,20)
(24,6)-(25,60)
(24,14)-(24,28)
(24,14)-(24,23)
(24,15)-(24,17)
(24,20)-(24,22)
(24,26)-(24,28)
(25,6)-(25,60)
(25,7)-(25,27)
(25,16)-(25,17)
(25,8)-(25,15)
(25,9)-(25,14)
(25,9)-(25,10)
(25,13)-(25,14)
(25,18)-(25,26)
(25,19)-(25,25)
(25,19)-(25,20)
(25,23)-(25,25)
(25,29)-(25,59)
(25,33)-(25,34)
(25,30)-(25,32)
(25,35)-(25,58)
(25,45)-(25,46)
(25,36)-(25,44)
(25,37)-(25,43)
(25,37)-(25,38)
(25,41)-(25,43)
(25,47)-(25,57)
(25,48)-(25,56)
(25,48)-(25,49)
(25,54)-(25,56)
(26,4)-(28,60)
(26,15)-(26,28)
(26,16)-(26,22)
(26,17)-(26,18)
(26,20)-(26,21)
(26,24)-(26,27)
(26,25)-(26,26)
(27,4)-(28,60)
(27,15)-(27,33)
(27,15)-(27,27)
(27,28)-(27,30)
(27,31)-(27,33)
(28,4)-(28,60)
(28,20)-(28,46)
(28,20)-(28,34)
(28,35)-(28,36)
(28,37)-(28,41)
(28,42)-(28,46)
(28,50)-(28,60)
(28,51)-(28,54)
(28,56)-(28,59)
(29,2)-(29,21)
(29,2)-(29,5)
(29,6)-(29,21)
(29,7)-(29,14)
(29,15)-(29,17)
(29,18)-(29,20)
(31,19)-(32,72)
(31,21)-(32,72)
(32,2)-(32,72)
(32,8)-(32,9)
(32,22)-(32,24)
(32,32)-(32,33)
(32,41)-(32,72)
(32,41)-(32,47)
(32,48)-(32,49)
(32,50)-(32,72)
(32,51)-(32,61)
(32,62)-(32,69)
(32,63)-(32,64)
(32,67)-(32,68)
(32,70)-(32,71)
*)
