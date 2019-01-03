function feedback
  navigator.vibrate 80

function local-date d
  result = new Date d
  result.set-minutes result.get-minutes! - result.get-timezone-offset!
  result

function local-today => local-date new Date .toJSON!slice 0 10

export {feedback, local-today}
