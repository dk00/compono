import
  'web-app-tools': {start-app, h, stack-provider, update-document, hot}
  './app': app
  './utils': {local-today}

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

function use-sentry
  s = document.create-element \script
  s.src = 'https://browser.sentry-cdn.com/4.6.4/bundle.min.js'
  s.add-event-listener \load ->
    Sentry.init dsn: 'https://ae873ac970c8413283ee643a68dffa91@sentry.io/1412140'
  document.head.append s

function polyfill
  window.request-idle-callback || window.request-idle-callback = ->
    set-timeout it, 33
  navigator.vibrate || navigator.vibrate = ->

polyfill!
request-idle-callback use-sentry
