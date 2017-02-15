
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
  let rec evalhelper e x y =
    match e with
    | VarX  -> x
    | VarY  -> y
    | Sine p1 -> sin (pi *. (evalhelper p1 x y))
    | Cosine p1 -> cos (pi *. (evalhelper p1 x y))
    | Average (p1,p2) -> ((evalhelper p1 x y) * (evalhelper p2 x y)) / 2 in
  evalhelper e x y;;


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
  let rec evalhelper e x y =
    match e with
    | VarX  -> x
    | VarY  -> y
    | Sine p1 -> sin (pi *. (evalhelper p1 x y))
    | Cosine p1 -> cos (pi *. (evalhelper p1 x y))
    | Average (p1,p2) -> ((evalhelper p1 x y) *. (evalhelper p2 x y)) /. 2.0 in
  evalhelper e x y;;

*)

(* changed spans
(20,25)-(20,68)
(20,25)-(20,72)
(20,26)-(20,45)
(20,71)-(20,72)
*)

(* type error slice
(18,21)-(18,48)
(18,28)-(18,47)
(18,29)-(18,39)
(20,25)-(20,68)
(20,25)-(20,68)
(20,26)-(20,45)
(20,27)-(20,37)
(20,48)-(20,67)
(20,49)-(20,59)
*)