
let rec digitsOfInt n =
  let rec loop x listX =
    if x = 0 then listX else loop (x / 10) ((x mod 10) :: listX) in
  match n with | 0 -> [0] | x' -> loop x' [];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  let rec itt x i =
    if x < 10
    then i
    else
      (let x' = sumList (digitsOfInt x) in
       if x' > 9 then 1 + (itt x' i) else 1) in
  match n with | 0 -> 0 | y' -> itt y';;


(* fix

let rec digitsOfInt n =
  let rec loop x listX =
    if x = 0 then listX else loop (x / 10) ((x mod 10) :: listX) in
  match n with | 0 -> [0] | x' -> loop x' [];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  let rec itt x i =
    if x < 10
    then i
    else
      (let x' = sumList (digitsOfInt x) in
       if x' > 9 then 1 + (itt x' i) else 1) in
  match n with | 0 -> 0 | y' -> itt y' 0;;

*)

(* changed spans
(16,32)-(16,38)
*)

(* type error slice
(15,26)-(15,36)
(15,27)-(15,30)
(16,2)-(16,38)
(16,22)-(16,23)
(16,32)-(16,35)
(16,32)-(16,38)
*)

(* all spans
(2,20)-(5,44)
(3,2)-(5,44)
(3,15)-(4,64)
(3,17)-(4,64)
(4,4)-(4,64)
(4,7)-(4,12)
(4,7)-(4,8)
(4,11)-(4,12)
(4,18)-(4,23)
(4,29)-(4,64)
(4,29)-(4,33)
(4,34)-(4,42)
(4,35)-(4,36)
(4,39)-(4,41)
(4,43)-(4,64)
(4,44)-(4,54)
(4,45)-(4,46)
(4,51)-(4,53)
(4,58)-(4,63)
(5,2)-(5,44)
(5,8)-(5,9)
(5,22)-(5,25)
(5,23)-(5,24)
(5,34)-(5,44)
(5,34)-(5,38)
(5,39)-(5,41)
(5,42)-(5,44)
(7,16)-(7,70)
(7,21)-(7,70)
(7,27)-(7,29)
(7,43)-(7,44)
(7,55)-(7,70)
(7,55)-(7,56)
(7,59)-(7,70)
(7,60)-(7,67)
(7,68)-(7,69)
(9,28)-(16,38)
(10,2)-(16,38)
(10,14)-(15,44)
(10,16)-(15,44)
(11,4)-(15,44)
(11,7)-(11,13)
(11,7)-(11,8)
(11,11)-(11,13)
(12,9)-(12,10)
(14,6)-(15,44)
(14,16)-(14,39)
(14,16)-(14,23)
(14,24)-(14,39)
(14,25)-(14,36)
(14,37)-(14,38)
(15,7)-(15,43)
(15,10)-(15,16)
(15,10)-(15,12)
(15,15)-(15,16)
(15,22)-(15,36)
(15,22)-(15,23)
(15,26)-(15,36)
(15,27)-(15,30)
(15,31)-(15,33)
(15,34)-(15,35)
(15,42)-(15,43)
(16,2)-(16,38)
(16,8)-(16,9)
(16,22)-(16,23)
(16,32)-(16,38)
(16,32)-(16,35)
(16,36)-(16,38)
*)
