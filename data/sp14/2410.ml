
let rec clone x n = if n <= 0 then [] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then
    let l1G = (List.length l1) - (List.length l2) in
    (l1, (List.append (clone 0 l1G) l2))
  else
    if (List.length l1) < (List.length l2)
    then
      (let l2G = (List.length l2) - (List.length l1) in
       ((List.append (clone 0 l2G) l1), l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (n1,n2) = x in
      let (carry,rest) = a in
      let total = (n1 + n2) + carry in
      ((total / 10), ((total mod 10) :: rest)) in
    let base = (0, []) in
    let args = List.rev (List.combine ((0 :: l1), (0 :: l2))) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then
    let l1G = (List.length l1) - (List.length l2) in
    (l1, (List.append (clone 0 l1G) l2))
  else
    if (List.length l1) < (List.length l2)
    then
      (let l2G = (List.length l2) - (List.length l1) in
       ((List.append (clone 0 l2G) l1), l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (n1,n2) = x in
      let (carry,rest) = a in
      let total = (n1 + n2) + carry in
      ((total / 10), ((total mod 10) :: rest)) in
    let base = (0, []) in
    let args = List.rev (List.combine (0 :: l1) (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(27,24)-(27,61)
(27,38)-(27,60)
*)

(* type error slice
(27,24)-(27,61)
(27,25)-(27,37)
(27,38)-(27,60)
*)

(* all spans
(2,14)-(2,66)
(2,16)-(2,66)
(2,20)-(2,66)
(2,23)-(2,29)
(2,23)-(2,24)
(2,28)-(2,29)
(2,35)-(2,37)
(2,43)-(2,66)
(2,47)-(2,48)
(2,43)-(2,46)
(2,44)-(2,45)
(2,49)-(2,66)
(2,50)-(2,55)
(2,56)-(2,57)
(2,58)-(2,65)
(2,59)-(2,60)
(2,63)-(2,64)
(4,12)-(14,17)
(4,15)-(14,17)
(5,2)-(14,17)
(5,5)-(5,40)
(5,5)-(5,21)
(5,6)-(5,17)
(5,18)-(5,20)
(5,24)-(5,40)
(5,25)-(5,36)
(5,37)-(5,39)
(7,4)-(8,40)
(7,14)-(7,49)
(7,14)-(7,30)
(7,15)-(7,26)
(7,27)-(7,29)
(7,33)-(7,49)
(7,34)-(7,45)
(7,46)-(7,48)
(8,4)-(8,40)
(8,5)-(8,7)
(8,9)-(8,39)
(8,10)-(8,21)
(8,22)-(8,35)
(8,23)-(8,28)
(8,29)-(8,30)
(8,31)-(8,34)
(8,36)-(8,38)
(10,4)-(14,17)
(10,7)-(10,42)
(10,7)-(10,23)
(10,8)-(10,19)
(10,20)-(10,22)
(10,26)-(10,42)
(10,27)-(10,38)
(10,39)-(10,41)
(12,6)-(13,44)
(12,17)-(12,52)
(12,17)-(12,33)
(12,18)-(12,29)
(12,30)-(12,32)
(12,36)-(12,52)
(12,37)-(12,48)
(12,49)-(12,51)
(13,7)-(13,43)
(13,8)-(13,38)
(13,9)-(13,20)
(13,21)-(13,34)
(13,22)-(13,27)
(13,28)-(13,29)
(13,30)-(13,33)
(13,35)-(13,37)
(13,40)-(13,42)
(14,9)-(14,17)
(14,10)-(14,12)
(14,14)-(14,16)
(16,19)-(17,69)
(17,2)-(17,69)
(17,8)-(17,9)
(17,23)-(17,25)
(17,36)-(17,69)
(17,39)-(17,44)
(17,39)-(17,40)
(17,43)-(17,44)
(17,50)-(17,62)
(17,50)-(17,60)
(17,61)-(17,62)
(17,68)-(17,69)
(19,11)-(29,34)
(19,14)-(29,34)
(20,2)-(29,34)
(20,11)-(28,51)
(21,4)-(28,51)
(21,10)-(25,46)
(21,12)-(25,46)
(22,6)-(25,46)
(22,20)-(22,21)
(23,6)-(25,46)
(23,25)-(23,26)
(24,6)-(25,46)
(24,18)-(24,35)
(24,18)-(24,27)
(24,19)-(24,21)
(24,24)-(24,26)
(24,30)-(24,35)
(25,6)-(25,46)
(25,7)-(25,19)
(25,8)-(25,13)
(25,16)-(25,18)
(25,21)-(25,45)
(25,22)-(25,36)
(25,23)-(25,28)
(25,33)-(25,35)
(25,40)-(25,44)
(26,4)-(28,51)
(26,15)-(26,22)
(26,16)-(26,17)
(26,19)-(26,21)
(27,4)-(28,51)
(27,15)-(27,61)
(27,15)-(27,23)
(27,24)-(27,61)
(27,25)-(27,37)
(27,38)-(27,60)
(27,39)-(27,48)
(27,40)-(27,41)
(27,45)-(27,47)
(27,50)-(27,59)
(27,51)-(27,52)
(27,56)-(27,58)
(28,4)-(28,51)
(28,18)-(28,44)
(28,18)-(28,32)
(28,33)-(28,34)
(28,35)-(28,39)
(28,40)-(28,44)
(28,48)-(28,51)
(29,2)-(29,34)
(29,2)-(29,12)
(29,13)-(29,34)
(29,14)-(29,17)
(29,18)-(29,33)
(29,19)-(29,26)
(29,27)-(29,29)
(29,30)-(29,32)
*)
