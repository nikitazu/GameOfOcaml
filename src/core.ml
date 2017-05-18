module Cell = struct
  type cell = Dead | Live
  
  let dead = Dead
  let live = Live
  
  let to_int c =
    match c with
    | Dead -> 0
    | Live -> 1
  
  let to_s c =
    to_int c
    |> string_of_int
  
  let step cell count =
    match (cell, count) with
    | (Dead, 3) -> Live
    | (Dead, _) -> Dead
    | (Live, 2) -> Live
    | (Live, 3) -> Live
    | (Live, _) -> Dead
  
  let add count cell = to_int cell + count

  let map_step cells =
    Util.Matrix.map
      (fun x y c ->
        Util.Matrix.get_near x y cells
        |> List.fold_left add 0
        |> step c)
      cells
  
  let puts cells =
    Util.Matrix.iter
      (fun row -> Util.putsln "")
      (fun cell -> cell |> to_s |> Util.puts)
      cells
end

let greeting name =
  "Hello, " ^ name ^ "!"

