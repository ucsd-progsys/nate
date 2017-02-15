
let rec clone x n =
  let rec cloneHelper x n acc =
    if n < 0 then acc else cloneHelper x (n - 1) (x :: acc) in
  cloneHelper x n [];;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0
  then ((List.append ((clone 0 (abs diff)), l1)), l2)
  else if diff > 0 then (l1, (List.append ((clone 0 diff), l2)));;


(* fix

let rec clone x n =
  let rec cloneHelper x n acc =
    if n < 0 then acc else cloneHelper x (n - 1) (x :: acc) in
  cloneHelper x n [];;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0
  then ((List.append (clone 0 (abs diff)) l1), l2)
  else if diff > 0 then (l1, (List.append (clone 0 diff) l2)) else (l1, l2);;

*)

(* changed spans
(10,8)-(10,48)
(10,21)-(10,47)
(11,7)-(11,64)
(11,29)-(11,63)
(11,42)-(11,62)
*)

(* type error slice
(10,8)-(10,48)
(10,9)-(10,20)
(10,21)-(10,47)
(11,7)-(11,64)
(11,7)-(11,64)
(11,7)-(11,64)
(11,24)-(11,64)
(11,29)-(11,63)
(11,30)-(11,41)
(11,42)-(11,62)
*)