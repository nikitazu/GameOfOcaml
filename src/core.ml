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
end

let greeting name =
  "Hello, " ^ name ^ "!"

