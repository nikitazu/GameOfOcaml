open Printf

let puts = fprintf stdout "%s\n"

let combo xs =
  xs
  |> List.map (fun x -> List.map (fun y -> (x, y)) xs)
  |> List.concat

let tuple_sum (x0, y0) (x, y) =
  (x0 + x, y0 + y)

let (<<) f g x = f(g(x))

module ArrExt = struct
  let get x xs =
    let l = Array.length xs in
    let x' = x mod l in
    (if x' > 0 then x' else x' + l)
    |> Array.get xs
end

module Matrix = struct
  type 'a matrix = 'a array array
  
  let get x y m =
    ArrExt.get x m |> ArrExt.get y
  
  let get' m (x,y) =
    get x y m

  let get_near x y m =
    combo [-1; 0; 1]
    |> List.filter (fun (x, y) -> x <> 0 || y <> 0)
    |> List.map (get' m << tuple_sum (x,y))
end
