
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
  | Sine e -> sin (pi * e)
  | Cosine e -> cos (pi * e)
  | Average (x,y) -> (x +. y) /. 2.0
  | Times (x,y) -> x *. y
  | Thresh (e,f,g,h) -> failwith "sad";;


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
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y);;

*)

(* changed spans
(14,2)-(19,38)
(15,14)-(15,26)
(15,18)-(15,26)
(15,24)-(15,25)
(16,16)-(16,28)
(16,20)-(16,28)
(16,26)-(16,27)
(17,21)-(17,29)
(17,21)-(17,36)
(17,33)-(17,36)
(18,19)-(18,20)
(18,24)-(18,25)
(19,24)-(19,32)
(19,24)-(19,38)
(19,33)-(19,38)
*)

(* type error slice
(11,3)-(11,28)
(11,9)-(11,26)
(14,2)-(19,38)
(14,2)-(19,38)
(14,2)-(19,38)
(14,2)-(19,38)
(14,2)-(19,38)
(14,2)-(19,38)
(15,14)-(15,17)
(15,14)-(15,26)
(15,18)-(15,26)
(15,18)-(15,26)
(15,18)-(15,26)
(15,19)-(15,21)
(15,24)-(15,25)
(16,16)-(16,19)
(16,16)-(16,28)
(16,20)-(16,28)
(16,20)-(16,28)
(16,20)-(16,28)
(16,21)-(16,23)
(16,26)-(16,27)
(17,21)-(17,29)
(17,21)-(17,29)
(17,22)-(17,23)
(17,27)-(17,28)
(18,19)-(18,20)
(18,19)-(18,25)
(18,19)-(18,25)
(18,24)-(18,25)
*)