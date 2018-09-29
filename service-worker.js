const revision = 'BUNDLE_HASH'
const precacheManifest = [
  {
    url: '/index.html',
    revision
  },
  {
    url: '/?source=pwa',
    revision
  },
  '/favicon.png'
]
importScripts('https://storage.googleapis.com/workbox-cdn/releases/4.0.0/workbox-sw.js')

workbox.core.skipWaiting()
workbox.core.clientsClaim()
workbox.precaching.precacheAndRoute(precacheManifest, {})
workbox.routing.registerNavigationRoute(
  workbox.precaching.getCacheKeyForURL('/'),
)
