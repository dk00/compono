const {webpackConfig} = require('web-app-tools')

module.exports = webpackConfig({
  name: 'Code Reducer',
  workbox: {
    navigateFallbackBlacklist: [
      /^\/__/
    ]
  }
})
