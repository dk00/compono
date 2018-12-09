function h type, attributes
  element = document.create-element type
  Object.assign element, attributes
  element

function paint-video video
  {video-width: width, video-height: height} = video
  canvas = h \canvas {width, height}
  context = paint.get-context \2d
  context.draw-image video, 0 0
  canvas

function get-image video
  {width, height} = canvas = paint-video video
  canvas.get-context \2d .get-image-data 0 0 width, height

function splits {width, height}
  x = width .>>. 1
  y = height .>>. 1

  * * 0 0 x, height
    * x+1 0 width, height
    * 0 0, width, y
    * 0 y+1, width, height

function get-split-images video
  {width, height} = canvas = paint-video video
  context = canvas.get-context \2d

  splits canvas .map (points) -> context.get-image-data ...points

function handle-video-frame decode => (video) ->
  decode get-image video

export {splits, get-image, get-split-images, handle-video-frame}
