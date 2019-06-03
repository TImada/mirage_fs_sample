open Lwt.Infix

module M = struct
  include Mirage_fs_mem

  let eh ret name =
    match ret with
    | Error e ->
      Logs.info (fun f -> f "%s failed! (%a.)" name pp_write_error e);
      Lwt.return_unit
    | Ok _ ->
      Lwt.return_unit

  let mkdir m path =
    mkdir m path >>= fun ret ->
    eh ret "mkdir"

  let create m path =
    create m path >>= fun ret ->
    eh ret "create"

  let destroy m path =
    destroy m path >>= fun ret ->
    eh ret "destroy"

  let write m path offset data =
    write m path offset data >>= fun ret ->
    eh ret "write"
 
end
