
let rec clone x n =
  match n with | 0 -> [] | a -> if a < 0 then [] else (clone x (n - 1)) @ [x];;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2))
  else ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let carry = match a with | (f,[]) -> f | (f',g'::h) -> g' in
      let newc =
        match x with | (f,g) -> if ((f + g) + carry) > 9 then 1 else 0 in
      let digit = match x with | (f,g) -> ((f + g) + carry) mod 10 in
      match a with
      | (o,p::q) -> (0, (newc :: digit :: q))
      | (o,p) -> (0, (newc :: digit :: p)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l = if i = 1 then l else bigAdd (mulByDigit (i - 1) l) l;;

let bigMul l1 l2 =
  let f a x = match a with | (_,y) -> (0, (bigAdd a x)) in
  let base = (0, []) in
  let args =
    let rec constructargs acc a b =
      match b with
      | [] -> acc
      | h::t -> constructargs ((mulByDigit h b) :: acc) a t in
    constructargs [] l1 (List.rev l2) in
  let (_,res) = List.fold_left f base args in res;;


(* fix

let rec clone x n =
  match n with | 0 -> [] | a -> if a < 0 then [] else (clone x (n - 1)) @ [x];;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2))
  else ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let carry = match a with | (f,[]) -> f | (f',g'::h) -> g' in
      let newc =
        match x with | (f,g) -> if ((f + g) + carry) > 9 then 1 else 0 in
      let digit = match x with | (f,g) -> ((f + g) + carry) mod 10 in
      match a with
      | (o,p::q) -> (0, (newc :: digit :: q))
      | (o,p) -> (0, (newc :: digit :: p)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l = if i = 1 then l else bigAdd (mulByDigit (i - 1) l) l;;

let bigMul l1 l2 =
  let f a x = match a with | (_,y) -> (0, (bigAdd y x)) in
  let base = (0, []) in
  let args =
    let rec constructargs acc a b =
      match b with
      | [] -> acc
      | h::t -> constructargs ((mulByDigit h b) :: acc) a t in
    constructargs [] l1 (List.rev l2) in
  let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(31,50)-(31,51)
*)

(* type error slice
(5,3)-(8,79)
(5,12)-(8,77)
(8,50)-(8,66)
(8,51)-(8,62)
(8,63)-(8,65)
(13,3)-(26,36)
(13,11)-(26,34)
(26,18)-(26,33)
(26,19)-(26,26)
(26,27)-(26,29)
(31,2)-(39,49)
(31,8)-(31,55)
(31,10)-(31,55)
(31,14)-(31,55)
(31,20)-(31,21)
(31,38)-(31,55)
(31,42)-(31,54)
(31,43)-(31,49)
(31,50)-(31,51)
(39,16)-(39,30)
(39,16)-(39,42)
(39,31)-(39,32)
*)

(* all spans
(2,14)-(3,77)
(2,16)-(3,77)
(3,2)-(3,77)
(3,8)-(3,9)
(3,22)-(3,24)
(3,32)-(3,77)
(3,35)-(3,40)
(3,35)-(3,36)
(3,39)-(3,40)
(3,46)-(3,48)
(3,54)-(3,77)
(3,72)-(3,73)
(3,54)-(3,71)
(3,55)-(3,60)
(3,61)-(3,62)
(3,63)-(3,70)
(3,64)-(3,65)
(3,68)-(3,69)
(3,74)-(3,77)
(3,75)-(3,76)
(5,12)-(8,77)
(5,15)-(8,77)
(6,2)-(8,77)
(6,5)-(6,40)
(6,5)-(6,21)
(6,6)-(6,17)
(6,18)-(6,20)
(6,24)-(6,40)
(6,25)-(6,36)
(6,37)-(6,39)
(7,7)-(7,77)
(7,8)-(7,10)
(7,12)-(7,76)
(7,13)-(7,24)
(7,25)-(7,72)
(7,26)-(7,31)
(7,32)-(7,33)
(7,34)-(7,71)
(7,35)-(7,51)
(7,36)-(7,47)
(7,48)-(7,50)
(7,54)-(7,70)
(7,55)-(7,66)
(7,67)-(7,69)
(7,73)-(7,75)
(8,7)-(8,77)
(8,8)-(8,72)
(8,9)-(8,20)
(8,21)-(8,68)
(8,22)-(8,27)
(8,28)-(8,29)
(8,30)-(8,67)
(8,31)-(8,47)
(8,32)-(8,43)
(8,44)-(8,46)
(8,50)-(8,66)
(8,51)-(8,62)
(8,63)-(8,65)
(8,69)-(8,71)
(8,74)-(8,76)
(10,19)-(11,68)
(11,2)-(11,68)
(11,8)-(11,9)
(11,23)-(11,24)
(11,35)-(11,68)
(11,38)-(11,43)
(11,38)-(11,39)
(11,42)-(11,43)
(11,49)-(11,61)
(11,49)-(11,59)
(11,60)-(11,61)
(11,67)-(11,68)
(13,11)-(26,34)
(13,14)-(26,34)
(14,2)-(26,34)
(14,11)-(25,51)
(15,4)-(25,51)
(15,10)-(22,42)
(15,12)-(22,42)
(16,6)-(22,42)
(16,18)-(16,63)
(16,24)-(16,25)
(16,43)-(16,44)
(16,61)-(16,63)
(17,6)-(22,42)
(18,8)-(18,70)
(18,14)-(18,15)
(18,32)-(18,70)
(18,35)-(18,56)
(18,35)-(18,52)
(18,36)-(18,43)
(18,37)-(18,38)
(18,41)-(18,42)
(18,46)-(18,51)
(18,55)-(18,56)
(18,62)-(18,63)
(18,69)-(18,70)
(19,6)-(22,42)
(19,18)-(19,66)
(19,24)-(19,25)
(19,42)-(19,66)
(19,42)-(19,59)
(19,43)-(19,50)
(19,44)-(19,45)
(19,48)-(19,49)
(19,53)-(19,58)
(19,64)-(19,66)
(20,6)-(22,42)
(20,12)-(20,13)
(21,20)-(21,45)
(21,21)-(21,22)
(21,24)-(21,44)
(21,25)-(21,29)
(21,33)-(21,43)
(21,33)-(21,38)
(21,42)-(21,43)
(22,17)-(22,42)
(22,18)-(22,19)
(22,21)-(22,41)
(22,22)-(22,26)
(22,30)-(22,40)
(22,30)-(22,35)
(22,39)-(22,40)
(23,4)-(25,51)
(23,15)-(23,22)
(23,16)-(23,17)
(23,19)-(23,21)
(24,4)-(25,51)
(24,15)-(24,44)
(24,15)-(24,23)
(24,24)-(24,44)
(24,25)-(24,37)
(24,38)-(24,40)
(24,41)-(24,43)
(25,4)-(25,51)
(25,18)-(25,44)
(25,18)-(25,32)
(25,33)-(25,34)
(25,35)-(25,39)
(25,40)-(25,44)
(25,48)-(25,51)
(26,2)-(26,34)
(26,2)-(26,12)
(26,13)-(26,34)
(26,14)-(26,17)
(26,18)-(26,33)
(26,19)-(26,26)
(26,27)-(26,29)
(26,30)-(26,32)
(28,19)-(28,77)
(28,21)-(28,77)
(28,25)-(28,77)
(28,28)-(28,33)
(28,28)-(28,29)
(28,32)-(28,33)
(28,39)-(28,40)
(28,46)-(28,77)
(28,46)-(28,52)
(28,53)-(28,75)
(28,54)-(28,64)
(28,65)-(28,72)
(28,66)-(28,67)
(28,70)-(28,71)
(28,73)-(28,74)
(28,76)-(28,77)
(30,11)-(39,49)
(30,14)-(39,49)
(31,2)-(39,49)
(31,8)-(31,55)
(31,10)-(31,55)
(31,14)-(31,55)
(31,20)-(31,21)
(31,38)-(31,55)
(31,39)-(31,40)
(31,42)-(31,54)
(31,43)-(31,49)
(31,50)-(31,51)
(31,52)-(31,53)
(32,2)-(39,49)
(32,13)-(32,20)
(32,14)-(32,15)
(32,17)-(32,19)
(33,2)-(39,49)
(34,4)-(38,37)
(34,26)-(37,59)
(34,30)-(37,59)
(34,32)-(37,59)
(35,6)-(37,59)
(35,12)-(35,13)
(36,14)-(36,17)
(37,16)-(37,59)
(37,16)-(37,29)
(37,30)-(37,55)
(37,31)-(37,47)
(37,32)-(37,42)
(37,43)-(37,44)
(37,45)-(37,46)
(37,51)-(37,54)
(37,56)-(37,57)
(37,58)-(37,59)
(38,4)-(38,37)
(38,4)-(38,17)
(38,18)-(38,20)
(38,21)-(38,23)
(38,24)-(38,37)
(38,25)-(38,33)
(38,34)-(38,36)
(39,2)-(39,49)
(39,16)-(39,42)
(39,16)-(39,30)
(39,31)-(39,32)
(39,33)-(39,37)
(39,38)-(39,42)
(39,46)-(39,49)
*)
