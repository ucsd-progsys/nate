
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine expr -> sin (pi *. (eval (expr, x, y)))
  | Cosine expr -> cos (pi *. (eval (expr, x, y)))
  | Average (expr1,expr2) ->
      ((eval (expr1, x, y)) +. (eval (expr2, x, y))) /. 2
  | Times (expr1,expr2) -> (eval (expr1, x, y)) *. (eval (expr2, x, y));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine expr -> sin (pi *. (eval (expr, x, y)))
  | Cosine expr -> cos (pi *. (eval (expr, x, y)))
  | Average (expr1,expr2) ->
      ((eval (expr1, x, y)) +. (eval (expr2, x, y))) /. 2.0
  | Times (expr1,expr2) -> (eval (expr1, x, y)) *. (eval (expr2, x, y));;

*)

(* changed spans
(20,56)-(20,57)
*)

(* type error slice
(20,6)-(20,57)
(20,56)-(20,57)
*)

(* all spans
(11,9)-(11,26)
(11,9)-(11,12)
(11,16)-(11,26)
(11,17)-(11,21)
(11,22)-(11,25)
(13,14)-(21,71)
(14,2)-(21,71)
(14,8)-(14,9)
(15,13)-(15,14)
(16,13)-(16,14)
(17,17)-(17,48)
(17,17)-(17,20)
(17,21)-(17,48)
(17,22)-(17,24)
(17,28)-(17,47)
(17,29)-(17,33)
(17,34)-(17,46)
(17,35)-(17,39)
(17,41)-(17,42)
(17,44)-(17,45)
(18,19)-(18,50)
(18,19)-(18,22)
(18,23)-(18,50)
(18,24)-(18,26)
(18,30)-(18,49)
(18,31)-(18,35)
(18,36)-(18,48)
(18,37)-(18,41)
(18,43)-(18,44)
(18,46)-(18,47)
(20,6)-(20,57)
(20,6)-(20,52)
(20,7)-(20,27)
(20,8)-(20,12)
(20,13)-(20,26)
(20,14)-(20,19)
(20,21)-(20,22)
(20,24)-(20,25)
(20,31)-(20,51)
(20,32)-(20,36)
(20,37)-(20,50)
(20,38)-(20,43)
(20,45)-(20,46)
(20,48)-(20,49)
(20,56)-(20,57)
(21,27)-(21,71)
(21,27)-(21,47)
(21,28)-(21,32)
(21,33)-(21,46)
(21,34)-(21,39)
(21,41)-(21,42)
(21,44)-(21,45)
(21,51)-(21,71)
(21,52)-(21,56)
(21,57)-(21,70)
(21,58)-(21,63)
(21,65)-(21,66)
(21,68)-(21,69)
*)
