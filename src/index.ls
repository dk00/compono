import
  \web-app-tools : {start-app, replace-collection}
  './app': app

options =
  actions: []
  init: if module.hot
    ({replace-app, replace-options}) ->
      module.hot.accept './app' -> replace-app app

if global.Worker
  ocrad-worker = '/ocrad-worker.js'
  global.ocrad = new Worker ocrad-worker

start-app app, options
