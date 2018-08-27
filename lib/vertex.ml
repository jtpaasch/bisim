type t = {
  id : string;
  index : int;
  address : string option;
}

let id t = t.id
let index t = t.index
let address t = t.address

let create id index address = { id; index; address }

let to_string t =
  let addr_str =
    match t.address with
    | None -> "No addr"
    | Some a -> a
    in
  Printf.sprintf "(%s|%d|%s)" t.id t.index addr_str
