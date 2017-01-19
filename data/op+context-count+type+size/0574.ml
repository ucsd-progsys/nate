
let makeRand (seed1,seed2) =
  let seed = Array.of_list [seed1; seed2] in
  let s = Random.State.make seed in
  fun (x,y)  -> x + (Random.State.int s (y - x));;

let rand = makeRand (10, 39);;

let rec wwhile (f,b) =
  let rec wwhelper f b =
    let (b',c') = f b in if c' = false then b' else wwhelper f b' in
  wwhelper f b;;

let x = rand (1, 4);;

let fixpoint (f,b) = wwhile ((let k x = f x in (x, (x = b))), b);;



let rec wwhile (f,b) =
  let rec wwhelper f b =
    let (b',c') = f b in if c' = false then b' else wwhelper f b' in
  wwhelper f b;;

let fixpoint (f,b) =
  wwhile ((let g x = let xx = f x in (xx, (xx != b)) in g), b);;


(* changed spans
(2,5)-(9,4)
(14,5)-(16,4)
(16,35)-(16,36)
(16,49)-(16,50)
(16,53)-(16,56)
*)

(* type error slice
*)