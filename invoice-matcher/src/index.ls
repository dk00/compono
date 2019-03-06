import
  'web-app-tools': {start-app, h, stack-provider, update-document, hot}
  './app': app
  './utils': {local-today}
  './create-worker': create-worker

options =
  actions: [update-document id: \user-input values: date: local-today!]

wrapped = if module.hot
  hot app, (replace-app) ->
    module.hot.accept './app' ->
      replace-app app
else app

function powered
  h stack-provider, options, h wrapped

start-app powered
create-worker! if global.Worker
