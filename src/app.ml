let main () =
  let d = Core.Cell.dead in
  let a = Core.Cell.live in
  let m = [| [| d; d; d; d; d; |]
          ;  [| d; d; d; d; d; |]
          ;  [| d; a; a; a; d; |]
          ;  [| d; d; a; d; d; |]
          ;  [| d; d; d; d; d; |]
          |] in
  let cs = Util.Matrix.get_near 3 3 m in
  let s = List.map Core.Cell.to_s cs in
  let ss = String.concat "," s in
  Core.greeting ss
  |> Util.puts

let () =
  main ()
