
let rec clone x n =
  if n < 0
  then []
  else (match n with | 0 -> [] | _ -> (clone x (n - 1)) @ [x]);;

let padZero l1 l2 =
  let num1 = (List.length l2) - (List.length l1) in
  let num2 = (List.length l1) - (List.length l2) in
  (((clone 0 num1) @ l1), ((clone 0 num2) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let rec intlist x =
        if x < 10 then [x] else (intlist (x / 10)) @ [x mod 10] in
      match x with
      | (z,y) ->
          (match a with
           | [] -> let sum = z + y in intlist sum
           | h::t ->
               let sum = (h + z) + y in
               let result = (intlist sum) @ t in
               if sum < 10 then 0 :: result else result) in
    let base = [0] in
    let args = List.rev (List.combine l1 l2) in
    let res = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let rec intlist x = if x < 10 then [x] else (intlist (x / 10)) @ [x mod 10] in
  match l with
  | [] -> [0]
  | h::t ->
      let zeroList =
        match t with
        | [] -> []
        | h'::t' -> (match padZero t [0] with | (a,b) -> b) in
      let mult = intlist (h * i) in
      let res = mult @ zeroList in bigAdd res (mulByDigit i t);;

let bigMul l1 l2 =
  let f a x =
    match a with | (b,c) -> ((b @ [0]), (bigAdd ((mulByDigit x l2) @ b) c)) in
  let base = ([], 0) in
  let args = l1 in let res = List.fold_left f base args in res;;


(* fix

let rec clone x n =
  if n < 0
  then []
  else (match n with | 0 -> [] | _ -> (clone x (n - 1)) @ [x]);;

let padZero l1 l2 =
  let num1 = (List.length l2) - (List.length l1) in
  let num2 = (List.length l1) - (List.length l2) in
  (((clone 0 num1) @ l1), ((clone 0 num2) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let rec intlist x =
        if x < 10 then [x] else (intlist (x / 10)) @ [x mod 10] in
      match x with
      | (z,y) ->
          (match a with
           | [] -> let sum = z + y in intlist sum
           | h::t ->
               let sum = (h + z) + y in
               let result = (intlist sum) @ t in
               if sum < 10 then 0 :: result else result) in
    let base = [0] in
    let args = List.rev (List.combine l1 l2) in
    let res = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let rec intlist x = if x < 10 then [x] else (intlist (x / 10)) @ [x mod 10] in
  match l with
  | [] -> [0]
  | h::t ->
      let zeroList =
        match t with
        | [] -> []
        | h'::t' -> (match padZero t [0] with | (a,b) -> b) in
      let mult = intlist (h * i) in
      let res = mult @ zeroList in bigAdd res (mulByDigit i t);;

let bigMul l1 l2 =
  let f a x =
    match a with | (b,c) -> ((b @ [0]), (bigAdd ((mulByDigit x l2) @ b) c)) in
  let base = ([], [0]) in
  let args = l1 in let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(48,18)-(48,19)
(49,19)-(49,62)
*)

(* type error slice
(13,2)-(13,69)
(13,8)-(13,9)
(13,36)-(13,69)
(13,50)-(13,60)
(13,50)-(13,62)
(13,68)-(13,69)
(15,3)-(31,36)
(15,11)-(31,34)
(15,14)-(31,34)
(16,2)-(31,34)
(31,2)-(31,12)
(31,2)-(31,34)
(46,2)-(49,62)
(46,8)-(47,75)
(46,10)-(47,75)
(47,4)-(47,75)
(47,28)-(47,75)
(47,40)-(47,74)
(47,41)-(47,47)
(48,2)-(49,62)
(48,13)-(48,20)
(48,18)-(48,19)
(49,29)-(49,43)
(49,29)-(49,55)
(49,44)-(49,45)
(49,46)-(49,50)
*)

(* all spans
(2,14)-(5,62)
(2,16)-(5,62)
(3,2)-(5,62)
(3,5)-(3,10)
(3,5)-(3,6)
(3,9)-(3,10)
(4,7)-(4,9)
(5,7)-(5,62)
(5,14)-(5,15)
(5,28)-(5,30)
(5,38)-(5,61)
(5,56)-(5,57)
(5,38)-(5,55)
(5,39)-(5,44)
(5,45)-(5,46)
(5,47)-(5,54)
(5,48)-(5,49)
(5,52)-(5,53)
(5,58)-(5,61)
(5,59)-(5,60)
(7,12)-(10,48)
(7,15)-(10,48)
(8,2)-(10,48)
(8,13)-(8,48)
(8,13)-(8,29)
(8,14)-(8,25)
(8,26)-(8,28)
(8,32)-(8,48)
(8,33)-(8,44)
(8,45)-(8,47)
(9,2)-(10,48)
(9,13)-(9,48)
(9,13)-(9,29)
(9,14)-(9,25)
(9,26)-(9,28)
(9,32)-(9,48)
(9,33)-(9,44)
(9,45)-(9,47)
(10,2)-(10,48)
(10,3)-(10,24)
(10,19)-(10,20)
(10,4)-(10,18)
(10,5)-(10,10)
(10,11)-(10,12)
(10,13)-(10,17)
(10,21)-(10,23)
(10,26)-(10,47)
(10,42)-(10,43)
(10,27)-(10,41)
(10,28)-(10,33)
(10,34)-(10,35)
(10,36)-(10,40)
(10,44)-(10,46)
(12,19)-(13,69)
(13,2)-(13,69)
(13,8)-(13,9)
(13,23)-(13,25)
(13,36)-(13,69)
(13,39)-(13,44)
(13,39)-(13,40)
(13,43)-(13,44)
(13,50)-(13,62)
(13,50)-(13,60)
(13,61)-(13,62)
(13,68)-(13,69)
(15,11)-(31,34)
(15,14)-(31,34)
(16,2)-(31,34)
(16,11)-(30,47)
(17,4)-(30,47)
(17,10)-(27,56)
(17,12)-(27,56)
(18,6)-(27,56)
(18,22)-(19,63)
(19,8)-(19,63)
(19,11)-(19,17)
(19,11)-(19,12)
(19,15)-(19,17)
(19,23)-(19,26)
(19,24)-(19,25)
(19,32)-(19,63)
(19,51)-(19,52)
(19,32)-(19,50)
(19,33)-(19,40)
(19,41)-(19,49)
(19,42)-(19,43)
(19,46)-(19,48)
(19,53)-(19,63)
(19,54)-(19,62)
(19,54)-(19,55)
(19,60)-(19,62)
(20,6)-(27,56)
(20,12)-(20,13)
(22,10)-(27,56)
(22,17)-(22,18)
(23,19)-(23,49)
(23,29)-(23,34)
(23,29)-(23,30)
(23,33)-(23,34)
(23,38)-(23,49)
(23,38)-(23,45)
(23,46)-(23,49)
(25,15)-(27,55)
(25,25)-(25,36)
(25,25)-(25,32)
(25,26)-(25,27)
(25,30)-(25,31)
(25,35)-(25,36)
(26,15)-(27,55)
(26,28)-(26,45)
(26,42)-(26,43)
(26,28)-(26,41)
(26,29)-(26,36)
(26,37)-(26,40)
(26,44)-(26,45)
(27,15)-(27,55)
(27,18)-(27,26)
(27,18)-(27,21)
(27,24)-(27,26)
(27,32)-(27,43)
(27,32)-(27,33)
(27,37)-(27,43)
(27,49)-(27,55)
(28,4)-(30,47)
(28,15)-(28,18)
(28,16)-(28,17)
(29,4)-(30,47)
(29,15)-(29,44)
(29,15)-(29,23)
(29,24)-(29,44)
(29,25)-(29,37)
(29,38)-(29,40)
(29,41)-(29,43)
(30,4)-(30,47)
(30,14)-(30,40)
(30,14)-(30,28)
(30,29)-(30,30)
(30,31)-(30,35)
(30,36)-(30,40)
(30,44)-(30,47)
(31,2)-(31,34)
(31,2)-(31,12)
(31,13)-(31,34)
(31,14)-(31,17)
(31,18)-(31,33)
(31,19)-(31,26)
(31,27)-(31,29)
(31,30)-(31,32)
(33,19)-(43,62)
(33,21)-(43,62)
(34,2)-(43,62)
(34,18)-(34,77)
(34,22)-(34,77)
(34,25)-(34,31)
(34,25)-(34,26)
(34,29)-(34,31)
(34,37)-(34,40)
(34,38)-(34,39)
(34,46)-(34,77)
(34,65)-(34,66)
(34,46)-(34,64)
(34,47)-(34,54)
(34,55)-(34,63)
(34,56)-(34,57)
(34,60)-(34,62)
(34,67)-(34,77)
(34,68)-(34,76)
(34,68)-(34,69)
(34,74)-(34,76)
(35,2)-(43,62)
(35,8)-(35,9)
(36,10)-(36,13)
(36,11)-(36,12)
(38,6)-(43,62)
(39,8)-(41,59)
(39,14)-(39,15)
(40,16)-(40,18)
(41,20)-(41,59)
(41,27)-(41,40)
(41,27)-(41,34)
(41,35)-(41,36)
(41,37)-(41,40)
(41,38)-(41,39)
(41,57)-(41,58)
(42,6)-(43,62)
(42,17)-(42,32)
(42,17)-(42,24)
(42,25)-(42,32)
(42,26)-(42,27)
(42,30)-(42,31)
(43,6)-(43,62)
(43,16)-(43,31)
(43,21)-(43,22)
(43,16)-(43,20)
(43,23)-(43,31)
(43,35)-(43,62)
(43,35)-(43,41)
(43,42)-(43,45)
(43,46)-(43,62)
(43,47)-(43,57)
(43,58)-(43,59)
(43,60)-(43,61)
(45,11)-(49,62)
(45,14)-(49,62)
(46,2)-(49,62)
(46,8)-(47,75)
(46,10)-(47,75)
(47,4)-(47,75)
(47,10)-(47,11)
(47,28)-(47,75)
(47,29)-(47,38)
(47,32)-(47,33)
(47,30)-(47,31)
(47,34)-(47,37)
(47,35)-(47,36)
(47,40)-(47,74)
(47,41)-(47,47)
(47,48)-(47,71)
(47,67)-(47,68)
(47,49)-(47,66)
(47,50)-(47,60)
(47,61)-(47,62)
(47,63)-(47,65)
(47,69)-(47,70)
(47,72)-(47,73)
(48,2)-(49,62)
(48,13)-(48,20)
(48,14)-(48,16)
(48,18)-(48,19)
(49,2)-(49,62)
(49,13)-(49,15)
(49,19)-(49,62)
(49,29)-(49,55)
(49,29)-(49,43)
(49,44)-(49,45)
(49,46)-(49,50)
(49,51)-(49,55)
(49,59)-(49,62)
*)
