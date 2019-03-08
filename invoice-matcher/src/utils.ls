function feedback
  navigator.vibrate 80

function local-date d
  result = new Date d
  result.set-minutes result.get-minutes! - result.get-timezone-offset!
  result

function local-today => local-date new Date .toJSON!slice 0 10

function prepare-image video
  canvas = document.create-element \canvas
  canvas.width = video.video-width
  canvas.height = video.video-height

  context = canvas.get-context \2d
  context.draw-image video, 0 0

  width: canvas.width
  height: canvas.height
  get-image-data: (...args) -> context.get-image-data ...args

function pipe-images video, handle-image
  get-image-data = prepare-image video
  handle-image get-image-data .then ->
    video.paused || pipe-images video, handle-image

export {feedback, local-today, pipe-images}
