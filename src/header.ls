import
  'web-app-tools': {h}
  './firebase': {use-auth}
  './components': {app-bar}

function header
  {user, sign-out} = use-auth!
  {uid, photoURL} = user

  app-bar {uid, photoURL, sign-out}

export default: header
