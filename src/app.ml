module App = struct
  let main () =
    Printf.fprintf stdout "%s\n" Core.Core.greeting
end

let () =
  App.main ()
