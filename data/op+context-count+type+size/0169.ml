
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Average (x',y') -> ((eval (VarX, x', y)) + (eval (VarY, x, y'))) / 2;;



type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) = match e with | Average (x',y') -> (x +. y) /. 2.0;;


(* changed spans
(13,5)-(15,4)
(15,25)-(15,60)
(15,62)-(15,68)
(15,70)-(15,73)
*)

(* type error slice
(12,3)-(15,73)
(15,26)-(15,43)
(15,49)-(15,66)
*)