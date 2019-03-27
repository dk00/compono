const {webpackConfig} = require('web-app-tools')

const getNumberLists = () => {
  const fetch = require('node-fetch')

  return fetch('https://bluezz.com.tw/invoice_history.php')
  .then(res => res.text())
  .then(result =>
    result
    .split(/(?=\d\d\d年)/g)
    .slice(1, 3)
    .map(list => ({
      date: list.match(/\d{3}年.+月/)[0],
      numbers: list.match(/\d{8}|(?<=\D)\d{3}(?=\D)/g)
    }))
  )
}

const getCongig = webpackConfig({
  name: '發票對獎',
  workbox: {}
})

module.exports = (...args) =>
  getNumberLists()
  .then(numberList => {
    const {writeFileSync} = require('fs')
    writeFileSync('./src/number-lists.json', JSON.stringify(numberList, null, 2))
  })
  .then(() => getCongig(...args))
