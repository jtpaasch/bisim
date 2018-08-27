let () =
  Cli.cli ();

  let a = Vertex.create "001" 1 None in
  let b = Vertex.create "002" 1 None in

  let c = Vertex.create "001" 2 (Some "40000ff") in
  let d = Vertex.create "002" 2 (Some "4000023") in

  let edge_1 = Edge.create a b in
  let edge_2 = Edge.create b c in
  let edge_3 = Edge.create c d in

  let x = [edge_1; edge_2; edge_3] in
  let y = [edge_1; edge_2; edge_3] in

  let res = Falsifier.falsify x y in
  match res with
  | None -> Printf.printf "CFG 1 == CFG 2.\n-- No counterexamples found in bisimulation.\n%!"
  | Some x -> Printf.printf "CFG 1 <> CFG 2.\n-- Counterexample found. This edge is not simulated: %s\n%!" (Edge.to_string x)
