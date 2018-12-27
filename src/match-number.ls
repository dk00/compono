function match-number source, winning
  winning.map ({full, number}) ->
    len = ['x']concat number.split '' .find-index (, i) ->
      source[source.length - 1 - i] != number[number.length - 1 - i]
    console.log source, number, len
    if len >= 3 && (!full || len == 8) then len else 0
  .concat 0 .reduce (a, b) -> if a > b then a else b

export default: match-number
