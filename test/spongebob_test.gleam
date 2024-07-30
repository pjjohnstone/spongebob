import gleeunit
import gleeunit/should
import spongebob

pub fn main() {
  gleeunit.main()
}

pub fn to_spongebob_test() {
  spongebob.to_spongebob("Test sentence.")
  |> should.equal("tEsT SeNtEnCe.")
}
