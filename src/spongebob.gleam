import argv
import gleam/erlang/process
import gleam/io
import mist
import spongebob/internal
import spongeweb
import wisp

pub fn main() {
  case argv.load().arguments {
    ["server"] -> start_wisp()
    ["string", words] -> run_command(words)
    _ -> print_help()
  }
}

fn start_wisp() {
  wisp.configure_logger()
  let secret_key_base = wisp.random_string(64)

  let assert Ok(_) =
    wisp.mist_handler(spongeweb.handle_request, secret_key_base)
    |> mist.new
    |> mist.port(8000)
    |> mist.start_http

  process.sleep_forever()
}

fn run_command(words) {
  io.println(internal.to_spongebob(words))
}

fn print_help() {
  io.println("Usage: spongebob string <phrase>")
}
