
type t = { src : Vertex.t; dst : Vertex.t }

let src t = t.src
let dst t = t.dst

let create src dst = { src; dst }

let to_string t = Printf.sprintf "<< %s ---> %s >>" (Vertex.to_string t.src) (Vertex.to_string t.dst)
