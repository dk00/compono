function get-image video
  {video-width: width, video-height: height} = video
  paint = document.create-element \canvas
  Object.assign paint, {width, height}
  context = paint.get-context \2d
  context.draw-image video, 0 0
  context.get-image-data 0 0 width, height

function handle-video-frame decode => (video) ->
  decode get-image video

export {get-image, handle-video-frame}
