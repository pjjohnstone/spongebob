import gleeunit
import gleeunit/should
import spongebob/internal

pub fn main() {
  gleeunit.main()
}

pub fn to_spongebob_test() {
  internal.to_spongebob("Test sentence.")
  |> should.equal("tEsT SeNtEnCe.")
}
