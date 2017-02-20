
let rec clone x n =
  let rec clonehelper tx tn =
    match tn = 0 with
    | true  -> []
    | false  -> tx :: (clonehelper tx (tn - 1)) in
  clonehelper x (abs n);;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (clone 0 ((List.length l1) - (List.length l2))) @ l2
  else
    if (List.length l1) < (List.length l2)
    then (clone 0 ((List.length l2) - (List.length l1))) @ l1;;


(* fix

let rec clone x n =
  let rec clonehelper tx tn =
    match tn = 0 with
    | true  -> []
    | false  -> tx :: (clonehelper tx (tn - 1)) in
  clonehelper x (abs n);;

let padZero l1 l2 =
  match (List.length l1) > (List.length l2) with
  | true  -> (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  | false  -> (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

*)

(* changed spans
(10,2)-(14,61)
(11,7)-(11,59)
(13,4)-(14,61)
(13,7)-(13,23)
(13,7)-(13,42)
(13,8)-(13,19)
(13,20)-(13,22)
(13,26)-(13,42)
(13,27)-(13,38)
(13,39)-(13,41)
(14,39)-(14,50)
(14,59)-(14,61)
*)

(* type error slice
(13,4)-(14,61)
(13,4)-(14,61)
(13,4)-(14,61)
(14,9)-(14,61)
(14,57)-(14,58)
*)

(* all spans
(2,14)-(7,23)
(2,16)-(7,23)
(3,2)-(7,23)
(3,22)-(6,47)
(3,25)-(6,47)
(4,4)-(6,47)
(4,10)-(4,16)
(4,10)-(4,12)
(4,15)-(4,16)
(5,15)-(5,17)
(6,16)-(6,47)
(6,16)-(6,18)
(6,22)-(6,47)
(6,23)-(6,34)
(6,35)-(6,37)
(6,38)-(6,46)
(6,39)-(6,41)
(6,44)-(6,45)
(7,2)-(7,23)
(7,2)-(7,13)
(7,14)-(7,15)
(7,16)-(7,23)
(7,17)-(7,20)
(7,21)-(7,22)
(9,12)-(14,61)
(9,15)-(14,61)
(10,2)-(14,61)
(10,5)-(10,40)
(10,5)-(10,21)
(10,6)-(10,17)
(10,18)-(10,20)
(10,24)-(10,40)
(10,25)-(10,36)
(10,37)-(10,39)
(11,7)-(11,59)
(11,55)-(11,56)
(11,7)-(11,54)
(11,8)-(11,13)
(11,14)-(11,15)
(11,16)-(11,53)
(11,17)-(11,33)
(11,18)-(11,29)
(11,30)-(11,32)
(11,36)-(11,52)
(11,37)-(11,48)
(11,49)-(11,51)
(11,57)-(11,59)
(13,4)-(14,61)
(13,7)-(13,42)
(13,7)-(13,23)
(13,8)-(13,19)
(13,20)-(13,22)
(13,26)-(13,42)
(13,27)-(13,38)
(13,39)-(13,41)
(14,9)-(14,61)
(14,57)-(14,58)
(14,9)-(14,56)
(14,10)-(14,15)
(14,16)-(14,17)
(14,18)-(14,55)
(14,19)-(14,35)
(14,20)-(14,31)
(14,32)-(14,34)
(14,38)-(14,54)
(14,39)-(14,50)
(14,51)-(14,53)
(14,59)-(14,61)
(13,4)-(14,61)
*)
