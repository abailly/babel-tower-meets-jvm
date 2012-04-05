class FooBarQix {
  static Void main(Str[] args) {
    echo(FooBarQix().asTextUpTo(100))
  }

  Str asTextUpTo(Int topNumber) {
    return (1..topNumber).map |Int n -> Str| { toText(n) }.join("\n")
  }

  const Map TEXT := [3: "Foo", 5: "Bar", 7: "Qix"]

  Str toText(Int number) {
    Str result := addTextForDivisibles(number) + addTextForDigits(number)
    return result.size > 0 ? result : number.toStr
  }

  Str addTextForDivisibles(Int number) {
    return TEXT.keys.map |Int digit -> Str| { number % digit == 0? TEXT[digit] : "" }.join
  }

  private Str addTextForDigits(Int number) {
    return number.toStr.chars.map |Int c -> Str| { TEXT.get(c.fromDigit, "") }.join
  }
}
