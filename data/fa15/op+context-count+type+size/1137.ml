
type expr =
  | VarX
  | VarY
  | Neg of expr
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Smallest of expr* expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Neg e1 -> e1 *. (-1.0)
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y);;


(* fix

type expr =
  | VarX
  | VarY
  | Neg of expr
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Smallest of expr* expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Neg e1 -> (eval (e1, x, y)) *. (-1.0)
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y);;

*)

(* changed spans
(19,14)-(19,16)
(19,20)-(19,26)
(27,17)-(27,19)
(27,21)-(27,22)
(27,24)-(27,25)
*)

(* type error slice
(16,2)-(27,26)
(19,14)-(19,16)
(19,14)-(19,26)
(19,14)-(19,26)
(19,20)-(19,26)
(19,20)-(19,26)
(19,22)-(19,25)
*)

(* all spans
(13,9)-(13,26)
(13,9)-(13,12)
(13,16)-(13,26)
(13,17)-(13,21)
(13,22)-(13,25)
(15,14)-(27,26)
(16,2)-(27,26)
(16,8)-(16,9)
(17,13)-(17,14)
(18,13)-(18,14)
(19,14)-(19,26)
(19,14)-(19,16)
(19,20)-(19,26)
(19,22)-(19,25)
(20,15)-(20,44)
(20,15)-(20,18)
(20,19)-(20,44)
(20,20)-(20,22)
(20,26)-(20,43)
(20,27)-(20,31)
(20,32)-(20,42)
(20,33)-(20,35)
(20,37)-(20,38)
(20,40)-(20,41)
(21,17)-(21,46)
(21,17)-(21,20)
(21,21)-(21,46)
(21,22)-(21,24)
(21,28)-(21,45)
(21,29)-(21,33)
(21,34)-(21,44)
(21,35)-(21,37)
(21,39)-(21,40)
(21,42)-(21,43)
(22,23)-(22,70)
(22,23)-(22,63)
(22,24)-(22,41)
(22,25)-(22,29)
(22,30)-(22,40)
(22,31)-(22,33)
(22,35)-(22,36)
(22,38)-(22,39)
(22,45)-(22,62)
(22,46)-(22,50)
(22,51)-(22,61)
(22,52)-(22,54)
(22,56)-(22,57)
(22,59)-(22,60)
(22,67)-(22,70)
(23,21)-(23,59)
(23,21)-(23,38)
(23,22)-(23,26)
(23,27)-(23,37)
(23,28)-(23,30)
(23,32)-(23,33)
(23,35)-(23,36)
(23,42)-(23,59)
(23,43)-(23,47)
(23,48)-(23,58)
(23,49)-(23,51)
(23,53)-(23,54)
(23,56)-(23,57)
(25,6)-(27,26)
(25,9)-(25,46)
(25,9)-(25,26)
(25,10)-(25,14)
(25,15)-(25,25)
(25,16)-(25,18)
(25,20)-(25,21)
(25,23)-(25,24)
(25,29)-(25,46)
(25,30)-(25,34)
(25,35)-(25,45)
(25,36)-(25,38)
(25,40)-(25,41)
(25,43)-(25,44)
(26,11)-(26,26)
(26,11)-(26,15)
(26,16)-(26,26)
(26,17)-(26,19)
(26,21)-(26,22)
(26,24)-(26,25)
(27,11)-(27,26)
(27,11)-(27,15)
(27,16)-(27,26)
(27,17)-(27,19)
(27,21)-(27,22)
(27,24)-(27,25)
*)
