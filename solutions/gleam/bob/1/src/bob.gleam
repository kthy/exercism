import gleam/string

fn is_question(remark: String) -> Bool {
  string.ends_with(remark, "?")
}

fn is_silence(remark: String) -> Bool {
  string.trim(remark) |> string.is_empty
}

fn is_yelling(remark: String) -> Bool {
  !string.is_empty(remark)
  && string.uppercase(remark) == remark
  && string.lowercase(remark) != remark
}

fn remove_non_letters(remark: String) -> String {
  remove_non_letters_recursive(remark, "")
}

fn remove_non_letters_recursive(remark: String, accretion: String) -> String {
  case remark |> string.pop_grapheme {
    Error(_) -> accretion
    Ok(#(first, rest)) ->
      case first {
        "a"
        | "b"
        | "c"
        | "d"
        | "e"
        | "f"
        | "g"
        | "h"
        | "i"
        | "j"
        | "k"
        | "l"
        | "m"
        | "n"
        | "o"
        | "p"
        | "q"
        | "r"
        | "s"
        | "t"
        | "u"
        | "v"
        | "w"
        | "x"
        | "y"
        | "z"
        | "A"
        | "B"
        | "C"
        | "D"
        | "E"
        | "F"
        | "G"
        | "H"
        | "I"
        | "J"
        | "K"
        | "L"
        | "M"
        | "N"
        | "O"
        | "P"
        | "Q"
        | "R"
        | "S"
        | "T"
        | "U"
        | "V"
        | "W"
        | "X"
        | "Y"
        | "Z"
        | "."
        | "-"
        | "'"
        | "!"
        | "?" -> remove_non_letters_recursive(rest, accretion <> first)
        _ -> remove_non_letters_recursive(rest, accretion)
      }
  }
}

pub fn hey(remark: String) -> String {
  let clean_remark = remove_non_letters(remark)
  let question = is_question(clean_remark)
  let silence = is_silence(remark)
  let yelling = is_yelling(clean_remark)
  case silence {
    True -> "Fine. Be that way!"
    False ->
      case yelling, question {
        True, True -> "Calm down, I know what I'm doing!"
        True, False -> "Whoa, chill out!"
        False, True -> "Sure."
        False, False -> "Whatever."
      }
  }
}
