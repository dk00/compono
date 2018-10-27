import
  \web-app-tools : {start-app, replace-collection}
  './app': app

options =
  actions: []
  init: if module.hot
    ({replace-app, replace-options}) ->
      module.hot.accept './app' -> replace-app app

start-app app, options
