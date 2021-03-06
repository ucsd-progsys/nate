
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if n < 10
  then []
  else
    (let myList = digits n in
     let num = sumList myList in num + (additivePersistence num));;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if n < 10
  then 0
  else
    (let myList = digits n in
     let num = sumList myList in
     let sum = num + (additivePersistence num) in
     1 + (additivePersistence num));;

*)

(* changed spans
(11,7)-(11,9)
(14,33)-(14,64)
*)

(* type error slice
(10,2)-(14,65)
(11,7)-(11,9)
(13,4)-(14,65)
(14,5)-(14,64)
(14,33)-(14,64)
*)

(* all spans
(2,20)-(3,60)
(3,2)-(3,60)
(3,5)-(3,11)
(3,5)-(3,6)
(3,10)-(3,11)
(3,17)-(3,19)
(3,25)-(3,60)
(3,48)-(3,49)
(3,25)-(3,47)
(3,26)-(3,37)
(3,38)-(3,46)
(3,39)-(3,40)
(3,43)-(3,45)
(3,50)-(3,60)
(3,51)-(3,59)
(3,51)-(3,52)
(3,57)-(3,59)
(5,11)-(5,34)
(5,15)-(5,34)
(5,15)-(5,26)
(5,27)-(5,34)
(5,28)-(5,31)
(5,32)-(5,33)
(7,16)-(7,70)
(7,21)-(7,70)
(7,27)-(7,29)
(7,43)-(7,44)
(7,55)-(7,70)
(7,55)-(7,56)
(7,59)-(7,70)
(7,60)-(7,67)
(7,68)-(7,69)
(9,28)-(14,65)
(10,2)-(14,65)
(10,5)-(10,11)
(10,5)-(10,6)
(10,9)-(10,11)
(11,7)-(11,9)
(13,4)-(14,65)
(13,18)-(13,26)
(13,18)-(13,24)
(13,25)-(13,26)
(14,5)-(14,64)
(14,15)-(14,29)
(14,15)-(14,22)
(14,23)-(14,29)
(14,33)-(14,64)
(14,33)-(14,36)
(14,39)-(14,64)
(14,40)-(14,59)
(14,60)-(14,63)
*)
