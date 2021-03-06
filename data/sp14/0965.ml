
let rec clone x n =
  let rec aux acc n =
    if n <= 0 then acc else aux (List.append [x] acc) (n - 1) in
  aux [] n;;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 < len2
  then ((List.append (clone 0 (len2 - len1)) l1), l2)
  else (l1, (List.append (clone 0 (len1 - len2)) l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h == 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (n1,n2) = x in
      let (cin,l) = a in
      let result = (n1 + n2) + cin in
      let cout = result / 10 in
      let r = result mod 10 in
      match l with | [] -> [] | h::t -> (cout, (List.append [r] l)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  let rec aux acc n =
    if n <= 0 then acc else aux (List.append [x] acc) (n - 1) in
  aux [] n;;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 < len2
  then ((List.append (clone 0 (len2 - len1)) l1), l2)
  else (l1, (List.append (clone 0 (len1 - len2)) l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h == 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (n1,n2) = x in
      let (cin,l) = a in
      let result = (n1 + n2) + cin in
      let cout = result / 10 in
      let r = result mod 10 in
      match l with
      | [] -> (cout, (List.append [r] []))
      | h::t -> (cout, (List.append [r] l)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(25,27)-(25,29)
*)

(* type error slice
(19,4)-(28,51)
(19,10)-(25,67)
(19,12)-(25,67)
(20,6)-(25,67)
(21,6)-(25,67)
(21,20)-(21,21)
(22,6)-(25,67)
(23,6)-(25,67)
(24,6)-(25,67)
(25,6)-(25,67)
(25,27)-(25,29)
(25,40)-(25,67)
(28,18)-(28,32)
(28,18)-(28,44)
(28,33)-(28,34)
*)

(* all spans
(2,14)-(5,10)
(2,16)-(5,10)
(3,2)-(5,10)
(3,14)-(4,61)
(3,18)-(4,61)
(4,4)-(4,61)
(4,7)-(4,13)
(4,7)-(4,8)
(4,12)-(4,13)
(4,19)-(4,22)
(4,28)-(4,61)
(4,28)-(4,31)
(4,32)-(4,53)
(4,33)-(4,44)
(4,45)-(4,48)
(4,46)-(4,47)
(4,49)-(4,52)
(4,54)-(4,61)
(4,55)-(4,56)
(4,59)-(4,60)
(5,2)-(5,10)
(5,2)-(5,5)
(5,6)-(5,8)
(5,9)-(5,10)
(7,12)-(12,53)
(7,15)-(12,53)
(8,2)-(12,53)
(8,13)-(8,27)
(8,13)-(8,24)
(8,25)-(8,27)
(9,2)-(12,53)
(9,13)-(9,27)
(9,13)-(9,24)
(9,25)-(9,27)
(10,2)-(12,53)
(10,5)-(10,16)
(10,5)-(10,9)
(10,12)-(10,16)
(11,7)-(11,53)
(11,8)-(11,48)
(11,9)-(11,20)
(11,21)-(11,44)
(11,22)-(11,27)
(11,28)-(11,29)
(11,30)-(11,43)
(11,31)-(11,35)
(11,38)-(11,42)
(11,45)-(11,47)
(11,50)-(11,52)
(12,7)-(12,53)
(12,8)-(12,10)
(12,12)-(12,52)
(12,13)-(12,24)
(12,25)-(12,48)
(12,26)-(12,31)
(12,32)-(12,33)
(12,34)-(12,47)
(12,35)-(12,39)
(12,42)-(12,46)
(12,49)-(12,51)
(14,19)-(15,70)
(15,2)-(15,70)
(15,8)-(15,9)
(15,23)-(15,25)
(15,36)-(15,70)
(15,39)-(15,45)
(15,39)-(15,40)
(15,44)-(15,45)
(15,51)-(15,63)
(15,51)-(15,61)
(15,62)-(15,63)
(15,69)-(15,70)
(17,11)-(29,34)
(17,14)-(29,34)
(18,2)-(29,34)
(18,11)-(28,51)
(19,4)-(28,51)
(19,10)-(25,67)
(19,12)-(25,67)
(20,6)-(25,67)
(20,20)-(20,21)
(21,6)-(25,67)
(21,20)-(21,21)
(22,6)-(25,67)
(22,19)-(22,34)
(22,19)-(22,28)
(22,20)-(22,22)
(22,25)-(22,27)
(22,31)-(22,34)
(23,6)-(25,67)
(23,17)-(23,28)
(23,17)-(23,23)
(23,26)-(23,28)
(24,6)-(25,67)
(24,14)-(24,27)
(24,14)-(24,20)
(24,25)-(24,27)
(25,6)-(25,67)
(25,12)-(25,13)
(25,27)-(25,29)
(25,40)-(25,67)
(25,41)-(25,45)
(25,47)-(25,66)
(25,48)-(25,59)
(25,60)-(25,63)
(25,61)-(25,62)
(25,64)-(25,65)
(26,4)-(28,51)
(26,15)-(26,22)
(26,16)-(26,17)
(26,19)-(26,21)
(27,4)-(28,51)
(27,15)-(27,44)
(27,15)-(27,23)
(27,24)-(27,44)
(27,25)-(27,37)
(27,38)-(27,40)
(27,41)-(27,43)
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
