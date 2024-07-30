import gleam/int
import gleam/list
import gleam/string

pub fn to_spongebob(words: String) -> String {
  words
  |> string.to_graphemes
  |> list.index_map(fn(x, i) { maybe_change_case(i, x) })
  |> string.concat
}

fn maybe_change_case(index: Int, char: String) -> String {
  let mod = int.modulo(index, 2)
  case mod {
    Ok(0) -> string.lowercase(char)
    Ok(1) -> string.uppercase(char)
    _ -> string.lowercase(char)
  }
}
