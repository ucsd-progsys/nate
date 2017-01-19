
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> Printf.sprintf "x"
  | VarY  -> Printf.sprintf "y"
  | Sine x -> Printf.sprintf ""
  | Cosine x -> Printf.sprintf ""
  | Average (x,y) -> Printf.sprintf ""
  | Times (x,y) -> Printf.sprintf ""
  | Thresh (x,y,z,w) ->
      Printf.sprintf "%s<%s?%s:" exprToString x exprToString y exprToStringz;;



type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> Printf.sprintf "x"
  | VarY  -> Printf.sprintf "y"
  | Sine x -> Printf.sprintf ""
  | Cosine x -> Printf.sprintf ""
  | Average (x,y) -> Printf.sprintf ""
  | Times (x,y) -> Printf.sprintf ""
  | Thresh (x,y,z,w) ->
      Printf.sprintf "%s<%s?%s:" (exprToString x) (exprToString y)
        (exprToString z);;


(* changed spans
(20,64)-(20,77)
*)

(* type error slice
*)