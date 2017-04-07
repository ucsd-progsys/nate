
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) =
  let pi = 3.14 in
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine ex -> sin (pi *. (eval (ex, x, y)))
  | Cosine ex -> cos (pi *. (eval (ex, x, y)))
  | Average (ex1,ex2) -> ((eval (ex1, x, y)) +. (eval (ex2, x, y))) /. 2
  | Times (ex1,ex2) -> (eval (ex1, x, y)) *. (eval (ex2, x, y))
  | Thresh (ex1,ex2,ex3,ex4) ->
      if ex1 < ex2 then eval (ex3, x, y) else eval (ex4, x, y);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) =
  let pi = 3.14 in
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine ex -> sin (pi *. (eval (ex, x, y)))
  | Cosine ex -> cos (pi *. (eval (ex, x, y)))
  | Average (ex1,ex2) -> ((eval (ex1, x, y)) +. (eval (ex2, x, y))) /. 2.0
  | Times (ex1,ex2) -> (eval (ex1, x, y)) *. (eval (ex2, x, y))
  | Thresh (ex1,ex2,ex3,ex4) ->
      if ex1 < ex2 then eval (ex3, x, y) else eval (ex4, x, y);;

*)

(* changed spans
(18,71)-(18,72)
*)

(* type error slice
(18,25)-(18,72)
(18,71)-(18,72)
*)

(* all spans
(11,14)-(21,62)
(12,2)-(21,62)
(12,11)-(12,15)
(13,2)-(21,62)
(13,8)-(13,9)
(14,13)-(14,14)
(15,13)-(15,14)
(16,15)-(16,44)
(16,15)-(16,18)
(16,19)-(16,44)
(16,20)-(16,22)
(16,26)-(16,43)
(16,27)-(16,31)
(16,32)-(16,42)
(16,33)-(16,35)
(16,37)-(16,38)
(16,40)-(16,41)
(17,17)-(17,46)
(17,17)-(17,20)
(17,21)-(17,46)
(17,22)-(17,24)
(17,28)-(17,45)
(17,29)-(17,33)
(17,34)-(17,44)
(17,35)-(17,37)
(17,39)-(17,40)
(17,42)-(17,43)
(18,25)-(18,72)
(18,25)-(18,67)
(18,26)-(18,44)
(18,27)-(18,31)
(18,32)-(18,43)
(18,33)-(18,36)
(18,38)-(18,39)
(18,41)-(18,42)
(18,48)-(18,66)
(18,49)-(18,53)
(18,54)-(18,65)
(18,55)-(18,58)
(18,60)-(18,61)
(18,63)-(18,64)
(18,71)-(18,72)
(19,23)-(19,63)
(19,23)-(19,41)
(19,24)-(19,28)
(19,29)-(19,40)
(19,30)-(19,33)
(19,35)-(19,36)
(19,38)-(19,39)
(19,45)-(19,63)
(19,46)-(19,50)
(19,51)-(19,62)
(19,52)-(19,55)
(19,57)-(19,58)
(19,60)-(19,61)
(21,6)-(21,62)
(21,9)-(21,18)
(21,9)-(21,12)
(21,15)-(21,18)
(21,24)-(21,40)
(21,24)-(21,28)
(21,29)-(21,40)
(21,30)-(21,33)
(21,35)-(21,36)
(21,38)-(21,39)
(21,46)-(21,62)
(21,46)-(21,50)
(21,51)-(21,62)
(21,52)-(21,55)
(21,57)-(21,58)
(21,60)-(21,61)
*)