workbox.core.skipWaiting()
workbox.core.clientsClaim()

self.__precacheManifest = [].concat(
  self.__precacheManifest || [],
  {
    ...(self.__precacheManifest || []).find(it => it.url === 'index.html'),
    url: '/?source=pwa'
  }

)
workbox.precaching.precacheAndRoute(self.__precacheManifest, {})

workbox.routing.registerNavigationRoute(
  workbox.precaching.getCacheKeyForURL('/'),
)
importScripts('https://unpkg.com/jsqr@1.2.0/dist/jsQR.js')

self.addEventListener('message', ({data: {type, payload}, ports: [client]}) => {
  if (type === 'read-qr-code') {
    client.postMessage(
      jsQR(payload.data, payload.width, payload.height)
    )
  }
})
