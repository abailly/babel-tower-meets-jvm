use("ispec")

labels = {3 => "Foo", 5 => "Bar", 7 => "Qix"}

textForMultiples = method(number,
  [3, 5, 7] map(n, if(number % n == 0, labels[n], "")) join
)

textForDigits = method(number,
  number asText chars map(toRational) map(n, if(labels[n] nil?, "", labels[n])) join
)

fooBarQix = method(number,
  result = textForMultiples(number) + textForDigits(number)

  if(result empty?, number asText, result)
)

fooBarQixUpTo = method(number,
  (1..number) map(n, fooBarQix(n)) join("\n")
)

fooBarQixUpTo(100) println