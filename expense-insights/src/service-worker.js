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
