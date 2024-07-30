import argv
import gleam/erlang/process
import gleam/io
import mist
import spongebob/internal
import spongeweb
import wisp

pub fn main() {
  start_wisp()
  // case argv.load().arguments {
  //   [words] -> io.println(internal.to_spongebob(words))
  //   _ -> io.println("Usage: spongebob <phrase>")
  // }
}

pub fn start_wisp() {
  wisp.configure_logger()
  let secret_key_base = wisp.random_string(64)

  let assert Ok(_) =
    wisp.mist_handler(spongeweb.handle_request, secret_key_base)
    |> mist.new
    |> mist.port(8000)
    |> mist.start_http

  process.sleep_forever()
}
