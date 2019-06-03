module M : sig
  type write_error = [ Mirage_fs.write_error | `Directory_not_empty ]
  type error = Mirage_fs.error

  include Mirage_fs_lwt.S
    with type write_error := write_error
  and type error := error

  val connect : string -> t Lwt.t
  val mkdir : t -> string -> unit Lwt.t
  val create : t -> string -> unit Lwt.t
  val destroy : t -> string -> unit Lwt.t
  val write : t -> string -> int -> page_aligned_buffer -> unit Lwt.t

end
