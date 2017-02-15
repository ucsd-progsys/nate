
let rec myAppend l n = match l with | [] -> [n] | h::t -> h :: (myAppend t n);;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listCompare l k =
  if ((List.hd l) = []) && ((List.hd k) = [])
  then true
  else
    if (List.hd l) = (List.hd k)
    then listCompare (List.tl l) (List.tl k)
    else false;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> myAppend (listReverse t) h;;

let palindrome w = listCompare (explode w) (listReverse (explode w));;


(* fix

let rec myAppend l n = match l with | [] -> [n] | h::t -> h :: (myAppend t n);;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> myAppend (listReverse t) h;;

let palindrome w = (explode w) = (listReverse (explode w));;

*)

(* changed spans
(9,22)-(15,14)
(10,2)-(15,14)
(10,5)-(10,23)
(10,5)-(10,45)
(10,6)-(10,17)
(10,7)-(10,14)
(10,27)-(10,45)
(10,28)-(10,39)
(10,29)-(10,36)
(10,37)-(10,38)
(10,42)-(10,44)
(11,7)-(11,11)
(13,4)-(15,14)
(13,7)-(13,32)
(13,8)-(13,15)
(13,16)-(13,17)
(13,21)-(13,32)
(14,9)-(14,44)
(15,9)-(15,14)
(17,20)-(18,62)
(20,15)-(20,68)
*)

(* type error slice
(4,3)-(7,8)
(4,12)-(7,6)
(5,2)-(7,6)
(6,43)-(6,50)
(6,43)-(6,66)
(6,43)-(6,66)
(6,44)-(6,49)
(6,54)-(6,66)
(6,55)-(6,57)
(7,2)-(7,4)
(7,2)-(7,6)
(10,27)-(10,45)
(10,27)-(10,45)
(10,28)-(10,39)
(10,29)-(10,36)
(10,37)-(10,38)
(10,42)-(10,44)
(13,7)-(13,18)
(13,7)-(13,32)
(13,7)-(13,32)
(13,8)-(13,15)
(13,16)-(13,17)
(13,21)-(13,32)
(13,22)-(13,29)
(13,30)-(13,31)
(14,9)-(14,20)
(14,9)-(14,44)
(14,21)-(14,32)
(14,22)-(14,29)
(14,30)-(14,31)
(20,19)-(20,30)
(20,19)-(20,68)
(20,31)-(20,42)
(20,32)-(20,39)
*)