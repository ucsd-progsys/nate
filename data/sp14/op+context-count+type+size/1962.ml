
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
  | Thresh (a,b,c,d) -> eval (a, x, y)
  | Times (a,b) -> (eval (a, x, y)) * (eval (b, x, y))
  | Average (a,b) -> ((eval (a, x, y)) * (eval (b, x, y))) / 2
  | Cosine a -> cos (pi * pi)
  | Sine a -> sin (pi * (eval (a, x, y)))
  | VarY  -> x
  | VarX  -> y;;


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
  | Thresh (a,b,c,d) -> eval (a, x, y)
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Average (a,b) -> ((eval (a, x, y)) *. (eval (b, x, y))) /. 2.0
  | Cosine a -> cos (pi ** (eval (a, x, y)))
  | Sine a -> sin (pi ** (eval (a, x, y)))
  | VarY  -> x
  | VarX  -> y;;

*)

(* changed spans
(16,19)-(16,54)
(17,21)-(17,58)
(17,21)-(17,62)
(17,22)-(17,38)
(17,61)-(17,62)
(18,20)-(18,29)
(18,21)-(18,23)
(18,26)-(18,28)
(19,14)-(19,17)
(19,14)-(19,41)
(19,18)-(19,41)
(19,19)-(19,21)
(20,13)-(20,14)
*)

(* type error slice
(11,3)-(11,28)
(11,9)-(11,26)
(18,16)-(18,19)
(18,16)-(18,29)
(18,20)-(18,29)
(18,20)-(18,29)
(18,20)-(18,29)
(18,21)-(18,23)
(18,26)-(18,28)
(19,14)-(19,17)
(19,14)-(19,41)
(19,18)-(19,41)
(19,18)-(19,41)
(19,19)-(19,21)
*)