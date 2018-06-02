import
  \web-app-tools : {start-app, replace-collection}
  './app': app

options =
  actions:
    * replace-collection id: \receipt model: \receipt models:
        * id: 2 number: \000002
        * id: 3 number: \000003
    ...
  init: if module.hot
    ({replace-app, replace-options}) ->
      module.hot.accept './app' -> replace-app app

start-app app, options
