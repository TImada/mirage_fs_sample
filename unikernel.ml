open Lwt.Infix

module Main (Time : Mirage_types_lwt.TIME) = struct

  let start _time =
    FS.M.connect "testfs" >>= fun fs ->
    FS.M.mkdir fs "/" >>= fun () ->
    FS.M.mkdir fs "/hogehoge" >>= fun () ->
    Time.sleep_ns (Duration.of_sec 3) >>= fun () ->
    FS.M.disconnect fs >>= fun() ->
    Lwt.return_unit

end
