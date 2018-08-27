
let is_relevant e =
  let dst = Edge.dst e in
  match Vertex.address dst with
  | None -> false
  | Some _ -> true

let is_match e1 e2 =
  let v1 = Edge.dst e1 in
  let v2 = Edge.dst e2 in
  let v1_addr = Vertex.address v1 in
  let v1_index = Vertex.index v1 in
  let v2_addr = Vertex.address v2 in
  let v2_index = Vertex.index v2 in
  v1_addr = v2_addr && v1_index = v2_index

let rec is_simulated e b =
  match b with
  | [] -> false
  | hd :: tl ->
    begin
      match is_match e hd with
      | false -> is_simulated e tl
      | true -> true
    end

let rec find_counterexample a b =
  match a with
  | [] -> None
  | hd :: tl ->
    begin
      match is_relevant hd with
      | false -> find_counterexample tl b
      | true ->
        begin
          match is_simulated hd b with
          | false -> Some hd
          | true -> find_counterexample tl b
        end
    end

let falsify a b =
  let res_1 = find_counterexample a b in
  let res_2 = find_counterexample b a in
  match res_1 with
  | Some x -> res_1
  | None -> res_2
