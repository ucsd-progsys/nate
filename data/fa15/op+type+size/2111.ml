
let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let getHeads y = match listReverse y with | [] -> [] | h::t -> [h];;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec matchHeads x =
  match explode x with
  | h::t ->
      if (getHeads (explode x)) = []
      then true
      else if [h] = (getHeads t) then true else false;;

let palindrome w =
  match explode w with | [] -> true | h::t -> matchHeads (explode w);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let getHeads y = match listReverse y with | [] -> [] | h::t -> [h];;

let loseTail z = match listReverse z with | [] -> [] | h::t -> t;;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec matchHeads x =
  match x with
  | h::t ->
      if (getHeads x) = []
      then true
      else if [h] = (getHeads t) then matchHeads (loseTail t) else false;;

let palindrome w =
  match explode w with | [] -> true | h::t -> matchHeads (explode w);;

*)

(* changed spans
(7,12)-(10,6)
(8,2)-(10,6)
(13,8)-(13,15)
(13,8)-(13,17)
(15,19)-(15,30)
(15,20)-(15,27)
(17,38)-(17,42)
(17,48)-(17,53)
(20,46)-(20,56)
(20,57)-(20,68)
(20,58)-(20,65)
(20,66)-(20,67)
*)

(* type error slice
(7,3)-(10,8)
(7,12)-(10,6)
(8,2)-(10,6)
(9,12)-(9,29)
(9,13)-(9,26)
(9,27)-(9,28)
(9,43)-(9,66)
(9,54)-(9,66)
(9,55)-(9,57)
(10,2)-(10,4)
(10,2)-(10,6)
(12,3)-(17,55)
(12,19)-(17,53)
(13,8)-(13,15)
(13,8)-(13,17)
(13,16)-(13,17)
(20,46)-(20,56)
(20,46)-(20,68)
(20,57)-(20,68)
(20,58)-(20,65)
*)

(* all spans
(2,20)-(3,57)
(3,2)-(3,57)
(3,8)-(3,9)
(3,23)-(3,25)
(3,36)-(3,57)
(3,52)-(3,53)
(3,36)-(3,51)
(3,37)-(3,48)
(3,49)-(3,50)
(3,54)-(3,57)
(3,55)-(3,56)
(5,13)-(5,66)
(5,17)-(5,66)
(5,23)-(5,36)
(5,23)-(5,34)
(5,35)-(5,36)
(5,50)-(5,52)
(5,63)-(5,66)
(5,64)-(5,65)
(7,12)-(10,6)
(8,2)-(10,6)
(8,13)-(9,66)
(9,4)-(9,66)
(9,7)-(9,29)
(9,7)-(9,8)
(9,12)-(9,29)
(9,13)-(9,26)
(9,27)-(9,28)
(9,35)-(9,37)
(9,43)-(9,66)
(9,43)-(9,50)
(9,44)-(9,49)
(9,44)-(9,45)
(9,47)-(9,48)
(9,54)-(9,66)
(9,55)-(9,57)
(9,58)-(9,65)
(9,59)-(9,60)
(9,63)-(9,64)
(10,2)-(10,6)
(10,2)-(10,4)
(10,5)-(10,6)
(12,19)-(17,53)
(13,2)-(17,53)
(13,8)-(13,17)
(13,8)-(13,15)
(13,16)-(13,17)
(15,6)-(17,53)
(15,9)-(15,36)
(15,9)-(15,31)
(15,10)-(15,18)
(15,19)-(15,30)
(15,20)-(15,27)
(15,28)-(15,29)
(15,34)-(15,36)
(16,11)-(16,15)
(17,11)-(17,53)
(17,14)-(17,32)
(17,14)-(17,17)
(17,15)-(17,16)
(17,20)-(17,32)
(17,21)-(17,29)
(17,30)-(17,31)
(17,38)-(17,42)
(17,48)-(17,53)
(19,15)-(20,68)
(20,2)-(20,68)
(20,8)-(20,17)
(20,8)-(20,15)
(20,16)-(20,17)
(20,31)-(20,35)
(20,46)-(20,68)
(20,46)-(20,56)
(20,57)-(20,68)
(20,58)-(20,65)
(20,66)-(20,67)
*)