import \../src/utils : {splits}

function main t
  actual = splits width: 6 height: 8
  expected =
    * 0 0 3 8
    * 4 0 6 8
    * 0 0 6 4
    * 0 5 6 8
  t.same actual, expected, 'positions of sub images'

  t.end!

export default: main
