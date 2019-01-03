function until-event worker, type
  new Promise (resolve) ->
    worker.add-event-listener \message ->
      if it.data.type == type then resolve it.data.payload

function create-worker
  ocrad-worker = '/ocrad-worker.js'
  worker = new Worker ocrad-worker
  load = until-event worker, \ready

  global.ocrad = (data, options) ->
    load.then ->
      worker.post-message [data, options]
      until-event worker, \result

export default: create-worker
