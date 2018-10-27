import
  \web-app-scripts : {start-app}
  \./app : app

options =
  initialize: ({replace-app}) ->
    module.hot.accept \./app -> replace-app app

start-app app, options
