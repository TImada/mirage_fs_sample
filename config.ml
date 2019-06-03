open Mirage

let main =
  let packages = [ package "mirage-fs-lwt"; package "mirage-fs-mem" ] in
  foreign ~packages "Unikernel.Main" (time @-> job)

let () =
  register "fs" [
    main $ default_time
  ]
