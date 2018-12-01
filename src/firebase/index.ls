import
  react: {create-context, Fragment}
  'web-app-tools': {h, use-state, use-effect, use-ref, use-context}

firebase-context = create-context {}

scripts =
  '/__/firebase/5.5.8/firebase-app.js'
  '/__/firebase/5.5.8/firebase-auth.js'
  '/__/firebase/5.5.8/firebase-firestore.js'
  '/__/firebase/init.js'

function load-script src
  element = document.create-element \script
  element.src = src
  new Promise (resolve) ->
    element.onload = resolve
    document.body.append element

function ensure-scripts scripts
  scripts.reduce (last, src) ->
    if document.query-selector "script[src=\"#src\"]" then last
    else last.then -> load-script src
  , Promise.resolve!

function firebase-login {render, children}
  clear = use-ref!
  [user, set-user] = use-state \initializing-firebase
  use-effect ->
    ensure-scripts scripts .then ->
      clear.current = firebase.auth!on-auth-state-changed ->
        set-user it
    -> clear.current!
  , []
  switch
  | user == \initializing-firebase => ''
  | !user
    render login: ->
      firebase.auth!sign-in-with-popup new firebase.auth.GoogleAuthProvider
  | _
    h firebase-context.Provider, value: {user, firebase},
      h Fragment,, children

function use-collection collection
  {firebase, user: {uid}} = use-context firebase-context
  firebase.firestore!collection \users .doc uid .collection collection

function use-realtime-updated collection
  ref = use-collection collection
  [data, set-data] = use-state []
  use-effect ->
    ref.order-by \date \desc
    .on-snapshot -> set-data it.docs.map -> it.data!
  , []
  data

export {firebase-login, use-collection, use-realtime-updated}
