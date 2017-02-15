
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let rec eval (e,x,y) =
  match e with
  | VarX _ -> x
  | VarY _ -> y
  | Sine x1 -> eval ((buildSine x1), x, y)
  | Cosine x2 -> eval ((buildCosine x2), x, y)
  | Average (x3,x4) -> eval ((buildAverage (x3, x4)), x, y)
  | Times (x5,x6) -> eval ((buildTimes (x5, x6)), x, y)
  | Thresh (x7,x8,x9,x0) -> eval (buildThresh (x7, x8, x9, x0));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let rec eval (e,x,y) =
  match e with
  | VarX _ -> x
  | VarY _ -> y
  | Sine x1 -> eval ((buildSine x1), x, y)
  | Cosine x2 -> eval ((buildCosine x2), x, y)
  | Average (x3,x4) -> eval ((buildAverage (x3, x4)), x, y)
  | Times (x5,x6) -> eval ((buildTimes (x5, x6)), x, y)
  | Thresh (x7,x8,x9,x0) -> eval ((buildThresh (x7, x8, x9, x0)), x, y);;

*)

(* changed spans
(29,33)-(29,63)
*)

(* type error slice
(17,3)-(17,69)
(17,17)-(17,67)
(17,38)-(17,67)
(28,21)-(28,25)
(28,21)-(28,55)
(28,26)-(28,55)
(29,28)-(29,32)
(29,28)-(29,63)
(29,33)-(29,63)
(29,34)-(29,45)
*)