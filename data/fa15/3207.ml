
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

let bigMul l1 l2 =
  let f a x =
    let (x1,x2) = x in
    let (c,a1::a2) = a in
    let v = (x1 * x2) + c in ((v / 10), ([v / 10] @ ([v mod 10] @ a2))) in
  let base = (0, [0]) in
  let args =
    let (ar1,ar2) = padZero (l1 l2) in List.rev (List.combine ar1 ar2) in
  let (_,res) = List.fold_left f base args in res;;


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
  else
    (match i with
     | 1 -> l
     | 10 -> l @ [0]
     | _ -> bigAdd l (mulByDigit (i - 1) l));;

let bigMul l1 l2 =
  let f a x =
    let (c,a') = a in
    let m = mulByDigit x l2 in let s = bigAdd m a' in ((c + 1), s) in
  let base = (0, [0]) in
  let args = l1 in let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(15,11)-(23,49)
(16,2)-(23,49)
(19,12)-(19,21)
(22,4)-(22,70)
(22,20)-(22,27)
(22,28)-(22,35)
(22,29)-(22,31)
(22,39)-(22,47)
(22,39)-(22,70)
(22,48)-(22,70)
(22,49)-(22,61)
(22,62)-(22,65)
(22,66)-(22,69)
(23,2)-(23,49)
*)

(* type error slice
(5,3)-(13,43)
(5,12)-(13,41)
(5,15)-(13,41)
(22,4)-(22,70)
(22,20)-(22,27)
(22,20)-(22,35)
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
(5,12)-(13,41)
(5,15)-(13,41)
(6,2)-(13,41)
(6,11)-(6,25)
(6,11)-(6,22)
(6,23)-(6,25)
(7,2)-(13,41)
(7,11)-(7,25)
(7,11)-(7,22)
(7,23)-(7,25)
(8,2)-(13,41)
(8,5)-(8,12)
(8,5)-(8,7)
(8,10)-(8,12)
(9,7)-(9,15)
(9,8)-(9,10)
(9,12)-(9,14)
(11,4)-(13,41)
(11,7)-(11,14)
(11,7)-(11,9)
(11,12)-(11,14)
(12,9)-(12,41)
(12,10)-(12,12)
(12,14)-(12,40)
(12,35)-(12,36)
(12,15)-(12,34)
(12,16)-(12,21)
(12,22)-(12,23)
(12,24)-(12,33)
(12,25)-(12,27)
(12,30)-(12,32)
(12,37)-(12,39)
(13,9)-(13,41)
(13,10)-(13,36)
(13,31)-(13,32)
(13,11)-(13,30)
(13,12)-(13,17)
(13,18)-(13,19)
(13,20)-(13,29)
(13,21)-(13,23)
(13,26)-(13,28)
(13,33)-(13,35)
(13,38)-(13,40)
(15,11)-(23,49)
(15,14)-(23,49)
(16,2)-(23,49)
(16,8)-(19,71)
(16,10)-(19,71)
(17,4)-(19,71)
(17,18)-(17,19)
(18,4)-(19,71)
(18,21)-(18,22)
(19,4)-(19,71)
(19,12)-(19,25)
(19,12)-(19,21)
(19,13)-(19,15)
(19,18)-(19,20)
(19,24)-(19,25)
(19,29)-(19,71)
(19,30)-(19,38)
(19,31)-(19,32)
(19,35)-(19,37)
(19,40)-(19,70)
(19,50)-(19,51)
(19,41)-(19,49)
(19,42)-(19,48)
(19,42)-(19,43)
(19,46)-(19,48)
(19,52)-(19,69)
(19,64)-(19,65)
(19,53)-(19,63)
(19,54)-(19,62)
(19,54)-(19,55)
(19,60)-(19,62)
(19,66)-(19,68)
(20,2)-(23,49)
(20,13)-(20,21)
(20,14)-(20,15)
(20,17)-(20,20)
(20,18)-(20,19)
(21,2)-(23,49)
(22,4)-(22,70)
(22,20)-(22,35)
(22,20)-(22,27)
(22,28)-(22,35)
(22,29)-(22,31)
(22,32)-(22,34)
(22,39)-(22,70)
(22,39)-(22,47)
(22,48)-(22,70)
(22,49)-(22,61)
(22,62)-(22,65)
(22,66)-(22,69)
(23,2)-(23,49)
(23,16)-(23,42)
(23,16)-(23,30)
(23,31)-(23,32)
(23,33)-(23,37)
(23,38)-(23,42)
(23,46)-(23,49)
*)
