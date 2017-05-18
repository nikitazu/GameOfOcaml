let nop _ =
  ()

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
  Curses.initscr () |> nop;
  Curses.noecho () |> nop;
  for i = 1 to 10 do
    Util.Matrix.iter
      (fun x y c -> Curses.mvaddstr x y (Core.Cell.to_s c) |> nop)
      !m;
    m := Core.Cell.map_step !m;
    Curses.getch () |> nop;
  done;
  Curses.endwin ()

let () =
  main ()

