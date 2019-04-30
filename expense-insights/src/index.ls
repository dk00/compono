import
  'web-app-tools': {start-app, stack-provider, hot, h, replaceCollection}
  './utils': {get-install-prompt}
  './app': app

function setup-sentry
  s = document.create-element \script
  s.src = 'https://browser.sentry-cdn.com/5.4.0/bundle.min.js'
  s.add-event-listener \load ->
    Sentry.init dsn: process.env.SENTRY
  document.head.append s


if !global.process
  setup-sentry!
  get-install-prompt!
  console.log('setup')

options = actions: []

wrapped = if module.hot
  hot app, (replace-app) ->
    module.hot.accept './app' ->
      replace-app app
else app

function powered
  h stack-provider, options, h ->
    h wrapped

start-app powered
