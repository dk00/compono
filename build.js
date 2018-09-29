const {inlineSource} = require('inline-source')
const {readFileSync, writeFile} = require('fs')
const {createHash} = require('crypto')

const sha256hash = data => {
  const hash = createHash('sha256')
  hash.update(data)
  return hash.digest('hex')
}

const reportError = err => err && console.error(err)

inlineSource('./index.html', {compress: true})
.then(html => {
  const swContent = readFileSync('./service-worker.js').toString()
  const sw = swContent.replace('BUNDLE_HASH', sha256hash(html))
  writeFile('./public/index.html', html, reportError)
  writeFile('./public/service-worker.js', sw,  reportError)
})
