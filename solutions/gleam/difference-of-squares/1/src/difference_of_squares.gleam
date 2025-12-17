fn recursive_sum(j: Int, accumulator: Int) -> Int {
  case j {
    _ if j <= 0 -> accumulator
    _ -> recursive_sum(j - 1, accumulator + j)
  }
}

fn recursive_sum_of_squares(j: Int, accumulator: Int) -> Int {
  case j {
    _ if j <= 0 -> accumulator
    _ -> recursive_sum_of_squares(j - 1, accumulator + j * j)
  }
}

pub fn square_of_sum(n: Int) -> Int {
  let s = recursive_sum(n, 0)
  s * s
}

pub fn sum_of_squares(n: Int) -> Int {
  recursive_sum_of_squares(n, 0)
}

pub fn difference(n: Int) -> Int {
  square_of_sum(n) - sum_of_squares(n)
}
