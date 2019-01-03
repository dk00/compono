import
  'web-app-tools': {start-app, update-model}
  './app': app
  './utils': {local-today}
  './create-worker': create-worker

options =
  actions: [update-model id: \user-input values: date: local-today!]
  init: if module.hot
    ({replace-app, replace-options}) ->
      module.hot.accept './app' -> replace-app app

start-app app, options
create-worker! if global.Worker
