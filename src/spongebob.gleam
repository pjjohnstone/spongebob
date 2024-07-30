import argv
import gleam/erlang/process
import gleam/io
import mist
import spongebob/internal
import wisp
import wisp/wisp_mist

pub fn main() {
  case argv.load().arguments {
    [words] -> io.println(internal.to_spongebob(words))
    _ -> io.println("Usage: spongebob <phrase>")
  }
}

pub fn start_wisp() {
  wisp.configure_logger()
  let secret_key_base = wisp.random_string(64)

  let assert Ok(_) =
    wisp_mist.handler(router.handle_request, secret_key_base)
    |> mist.new
    |> mist.port(8000)
    |> mist.start_http

  process.sleep_forever()
}
