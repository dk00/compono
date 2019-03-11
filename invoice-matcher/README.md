# 發票號碼對獎

https://tw-invoice-matcher.netlify.com/

## 使用說明

**3碼連續**

請先選擇對獎期別. 輸入發票號碼後三碼後會自動比對中獎號碼, 顯示是否中獎. 輸入三碼後, 可以直接繼續輸入下一張發票的號碼, 輸入框會自動清除.

**掃描**

電子發票專用, 用手機相機掃描發票上的 QR code 取得發票號碼, 日期自動對獎.

## 設計

這是一個 [Progressive Web App](https://developers.google.com/web/fundamentals/codelabs/your-first-pwapp/?hl=zh-tw).

中獎發票號碼來自: `https://bluezz.com.tw/invoice_history.php`, 只提供最新兩期的號碼, 因為更早的號碼已經超過領獎期間了. 中獎號碼在 build 時取得並轉存成 json 檔, 跟著程式一起發布.

掃描模式用 [`getUserMedia`](https://developer.mozilla.org/en-US/docs/Web/API/MediaDevices/getUserMedia) 取得手機或平板的相機影像, 再用 [jsQR](https://github.com/cozmo/jsQR) 將 QR code 轉換成字串.

電子發票上都有兩個 QR code, 完整的影像有 6 個定位點, 導致 QR code reader 無法正常判讀. 目前的做法是只從左半邊讀 QR code.

發票資料的解析用的是 [taiwan-invoice](http://npm.im/taiwan-invoice).

## 開發

- 安裝 [node](https://nodejs.org/en/download/)
- 安裝 [yarn](https://yarnpkg.com/lang/en/docs/install/)
- 還原 packages: `yarn`
- 啟動開發模式: `yarn start`

基礎工具包是 [`web-app-tools`](https://github.com/dk00/web-app-tools).
