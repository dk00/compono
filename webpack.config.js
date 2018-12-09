const {webpackConfig} = require('web-app-tools')

module.exports = webpackConfig({
  webApp: {
    name: 'Code Reducer'
  },
  workbox: {
    navigateFallbackBlacklist: [
      /^\/__/
    ]
  }
})
