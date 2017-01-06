
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildY () = VarY;;

let rec build (rand,depth) =
  let randNum = rand (1, 2) in
  if randNum = 1 then buildSine (buildY ()) else buildCosine buildY;;



type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  let randNum = rand (1, 2) in
  if randNum = 1 then buildSine (buildX ()) else buildCosine (buildY ());;


(* changed spans
(19,34)-(19,40)
*)

(* type error slice
(19,50)-(19,68)
*)
