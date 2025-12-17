import gleam/string

// Each log line is a string formatted as follows: "[<LEVEL>]: <MESSAGE>".
//
// There are three different log levels:
//
//     INFO
//     WARNING
//     ERROR

pub fn message(log_line: String) -> String {
  case log_line {
    "[INFO]: " <> msg -> msg
    "[WARNING]: " <> msg -> msg
    "[ERROR]: " <> msg -> msg
    _ -> panic
  }
  |> string.trim()
}

pub fn log_level(log_line: String) -> String {
  case log_line {
    "[INFO]: " <> _ -> "info"
    "[WARNING]: " <> _ -> "warning"
    "[ERROR]: " <> _ -> "error"
    _ -> panic
  }
}

pub fn reformat(log_line: String) -> String {
  message(log_line) <> " (" <> log_level(log_line) <> ")"
}
