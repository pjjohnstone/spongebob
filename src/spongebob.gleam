import argv
import gleam/io
import spongebob/internal

pub fn main() {
  case argv.load().arguments {
    [words] -> io.println(internal.to_spongebob(words))
    _ -> io.println("Usage: spongebob <phrase>")
  }
}
