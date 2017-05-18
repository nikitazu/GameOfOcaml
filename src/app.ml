let main () =
  let d = Core.Cell.dead in
  let a = Core.Cell.live in
  let m = ref
          [| [| d; d; d; d; d; |]
          ;  [| d; d; d; d; d; |]
          ;  [| d; a; a; a; d; |]
          ;  [| d; d; a; d; d; |]
          ;  [| d; d; d; d; d; |]
          |] in
  for i = 1 to 10 do
    Core.Cell.puts !m;
    Util.putsln "-----";
    m := Core.Cell.map_step !m;
  done

let () =
  main ()
