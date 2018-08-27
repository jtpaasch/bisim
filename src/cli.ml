(** Implements {!Cli}. *)

let program_name = "bisim"

let arg_1_value = ref ""
let arg_1 = fun () -> !arg_1_value

let help_hint = fun () -> Printf.sprintf "See %s --help." program_name

let usage = fun () -> Printf.sprintf "USAGE: %s" program_name

let spec = []

let handle_args arg =
  match arg with
  | _ ->
    begin
      Printf.printf "Error. Unrecognized argument: '%s'. %s\n%!" arg (help_hint ());
      exit 1
    end

let check () = ()

let cli () =
  Arg.parse spec handle_args (usage ());
  check ()
