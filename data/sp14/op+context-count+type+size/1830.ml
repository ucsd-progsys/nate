
let rec clone x n = if n <= 0 then [] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then
    let l1G = (List.length l1) - (List.length l2) in
    List.append (l1, (clone (0 l1G)))
  else
    if (List.length l1) < (List.length l2)
    then
      (let l2G = (List.length l2) - (List.length l2) in
       List.append ((clone (0 l2G)), l2))
    else (l1, l2);;


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

*)

(* changed spans
(8,4)-(8,15)
(8,4)-(8,37)
(8,21)-(8,36)
(8,22)-(8,27)
(8,28)-(8,35)
(10,4)-(14,17)
(12,49)-(12,51)
(13,7)-(13,18)
(13,7)-(13,40)
(13,20)-(13,35)
(13,21)-(13,26)
(13,27)-(13,34)
(13,37)-(13,39)
*)

(* type error slice
(8,4)-(8,15)
(8,4)-(8,37)
(8,16)-(8,37)
(8,28)-(8,35)
(8,29)-(8,30)
(13,7)-(13,18)
(13,7)-(13,40)
(13,19)-(13,40)
(13,27)-(13,34)
(13,28)-(13,29)
*)