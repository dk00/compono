import
  'web-app-tools': {start-app, h, stack-provider, update-document, hot}
  './app': app
  './utils': {local-today}
  './create-worker': create-worker

import
  'web-app-tools': {use-state, use-effect}


options =
  actions: [update-document id: \user-input values: date: local-today!]

function enable-HMR app, init
  if module.hot && init then (props) ->
    [config, set-config] = use-state {app}
    use-effect (->
      init (app) ->
        console.log 'up'
        set-config {app, toggle: !config.toggle}
    ), []
    console.log config.app
    return h config.app, props
  else app

wrapped = if module.hot
  hot app, (replace-app) ->
    module.hot.accept './app' ->
      replace-app app
else app

function powered
  h stack-provider, options, h wrapped

start-app powered
create-worker! if global.Worker
