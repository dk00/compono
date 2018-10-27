import \../src/capture : capture

function main t
  set-stream = void
  load-media = void
  global.navigator =
    media-devices: get-user-media: ({video}) ->
      load-media := new Promise (resolve) ->
        set-stream := resolve

  snapshot = void
  self =
    props:
      placeholder: -> \placeholder
      on-frame: -> snapshot := it
    set-state: -> self.state = it
  capture::constructor.call self, self.props

  actual = capture::render.call self
  expected = \placeholder
  t.is actual, expected, 'render the placeholder while opening the camera'

  active = true
  set-stream get-tracks: -> [stop: -> active := false]

  load-media.then ->
    video = capture::render.call self
    actual = video.attributes.src-object
    t.true actual, 'render video when camera video stream is ready'

    video.attributes.on-timeupdate target: \video

    actual = snapshot
    expected = \video
    t.is actual, expected, 'trigger event handlers on video frames'

    capture::component-will-unmount.call self
    Promise.resolve!

  .then ->
    actual = active

    t.false actual, 'stop camera before unmounting'

    t.end!

export default: main
