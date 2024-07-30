import gleam/http.{Post}
import gleam/string_builder
import spongebob/internal
import wisp.{type Request, type Response}

/// The HTTP request handler- your application!
///
pub fn handle_request(req: Request) -> Response {
  // Apply the middleware stack for this request/response.
  use _req <- middleware(req)
  use <- wisp.require_method(req, Post)
  use body <- wisp.require_string_body(req)

  // Later we'll use templates, but for now a string will do.
  let response_body = string_builder.from_string(internal.to_spongebob(body))

  // Return a 200 OK response with the body and a HTML content type.
  wisp.html_response(response_body, 200)
}

pub fn middleware(
  req: wisp.Request,
  handle_request: fn(wisp.Request) -> wisp.Response,
) -> wisp.Response {
  // Permit browsers to simulate methods other than GET and POST using the
  // `_method` query parameter.
  let req = wisp.method_override(req)

  // Log information about the request and response.
  use <- wisp.log_request(req)

  // Return a default 500 response if the request handler crashes.
  use <- wisp.rescue_crashes

  // Rewrite HEAD requests to GET requests and return an empty body.
  use req <- wisp.handle_head(req)

  // Handle the request!
  handle_request(req)
}
