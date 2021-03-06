
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | SqDist of expr* expr;;

let rec exprToString e =
  let ex = exprToString in
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine x -> "sin(pi*" ^ ((ex x) ^ ")")
  | Cosine x -> "cos(pi*" ^ ((ex x) ^ ")")
  | Average (x,y) -> "((" ^ ((ex x) ^ ("+" ^ ((ex y) ^ ")/2)")))
  | Times (x,y) -> (ex x) ^ ("*" ^ (ex y))
  | Thresh (w,x,y,z) ->
      "(" ^
        ((ex w) ^
           ("<" ^ ((ex x) ^ ("?" ^ ((ex y) ^ (":" ^ ((ex z) ^ ")")))))))
  | SqDist (x,y) ->
      "(" ^ ((ex x) ^ (")" ^ ("^2+" ^ ("(" ^ ((ex y ")") ^ "^2")))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | SqDist of expr* expr;;

let rec exprToString e =
  let ex = exprToString in
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine x -> "sin(pi*" ^ ((ex x) ^ ")")
  | Cosine x -> "cos(pi*" ^ ((ex x) ^ ")")
  | Average (x,y) -> "((" ^ ((ex x) ^ ("+" ^ ((ex y) ^ ")/2)")))
  | Times (x,y) -> (ex x) ^ ("*" ^ (ex y))
  | Thresh (w,x,y,z) ->
      "(" ^
        ((ex w) ^
           ("<" ^ ((ex x) ^ ("?" ^ ((ex y) ^ (":" ^ ((ex z) ^ ")")))))))
  | SqDist (x,y) ->
      "(" ^ ((ex x) ^ (")" ^ ("^2+" ^ ("(" ^ ((ex y) ^ (")" ^ "^2"))))));;

*)

(* changed spans
(26,46)-(26,56)
(26,52)-(26,55)
*)

(* type error slice
(17,26)-(17,40)
(17,27)-(17,33)
(17,28)-(17,30)
(17,34)-(17,35)
(26,46)-(26,56)
(26,47)-(26,49)
*)

(* all spans
(12,21)-(26,68)
(13,2)-(26,68)
(13,11)-(13,23)
(14,2)-(26,68)
(14,8)-(14,9)
(15,13)-(15,16)
(16,13)-(16,16)
(17,14)-(17,40)
(17,24)-(17,25)
(17,14)-(17,23)
(17,26)-(17,40)
(17,34)-(17,35)
(17,27)-(17,33)
(17,28)-(17,30)
(17,31)-(17,32)
(17,36)-(17,39)
(18,16)-(18,42)
(18,26)-(18,27)
(18,16)-(18,25)
(18,28)-(18,42)
(18,36)-(18,37)
(18,29)-(18,35)
(18,30)-(18,32)
(18,33)-(18,34)
(18,38)-(18,41)
(19,21)-(19,64)
(19,26)-(19,27)
(19,21)-(19,25)
(19,28)-(19,64)
(19,36)-(19,37)
(19,29)-(19,35)
(19,30)-(19,32)
(19,33)-(19,34)
(19,38)-(19,63)
(19,43)-(19,44)
(19,39)-(19,42)
(19,45)-(19,62)
(19,53)-(19,54)
(19,46)-(19,52)
(19,47)-(19,49)
(19,50)-(19,51)
(19,55)-(19,61)
(20,19)-(20,42)
(20,26)-(20,27)
(20,19)-(20,25)
(20,20)-(20,22)
(20,23)-(20,24)
(20,28)-(20,42)
(20,33)-(20,34)
(20,29)-(20,32)
(20,35)-(20,41)
(20,36)-(20,38)
(20,39)-(20,40)
(22,6)-(24,72)
(22,10)-(22,11)
(22,6)-(22,9)
(23,8)-(24,72)
(23,16)-(23,17)
(23,9)-(23,15)
(23,10)-(23,12)
(23,13)-(23,14)
(24,11)-(24,71)
(24,16)-(24,17)
(24,12)-(24,15)
(24,18)-(24,70)
(24,26)-(24,27)
(24,19)-(24,25)
(24,20)-(24,22)
(24,23)-(24,24)
(24,28)-(24,69)
(24,33)-(24,34)
(24,29)-(24,32)
(24,35)-(24,68)
(24,43)-(24,44)
(24,36)-(24,42)
(24,37)-(24,39)
(24,40)-(24,41)
(24,45)-(24,67)
(24,50)-(24,51)
(24,46)-(24,49)
(24,52)-(24,66)
(24,60)-(24,61)
(24,53)-(24,59)
(24,54)-(24,56)
(24,57)-(24,58)
(24,62)-(24,65)
(26,6)-(26,68)
(26,10)-(26,11)
(26,6)-(26,9)
(26,12)-(26,68)
(26,20)-(26,21)
(26,13)-(26,19)
(26,14)-(26,16)
(26,17)-(26,18)
(26,22)-(26,67)
(26,27)-(26,28)
(26,23)-(26,26)
(26,29)-(26,66)
(26,36)-(26,37)
(26,30)-(26,35)
(26,38)-(26,65)
(26,43)-(26,44)
(26,39)-(26,42)
(26,45)-(26,64)
(26,57)-(26,58)
(26,46)-(26,56)
(26,47)-(26,49)
(26,50)-(26,51)
(26,52)-(26,55)
(26,59)-(26,63)
*)
