import gleeunit
import gleeunit/should
import spongeweb
import wisp/testing

pub fn main() {
  gleeunit.main()
}

pub fn hello_world_test() {
  let response =
    spongeweb.handle_request(testing.post("/", [], "Test sentence."))

  response.status
  |> should.equal(200)

  response
  |> testing.string_body
  |> should.equal("tEsT SeNtEnCe.")
}
