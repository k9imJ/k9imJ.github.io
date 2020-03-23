'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "/assets/AssetManifest.json": "d6d4cf36ef79fc8a3140b06f06a9fdc8",
"/assets/assets/map_example.jpg": "b503f08548b9d7936d8d6ddd0116c297",
"/assets/assets/table_example.jpg": "de5697071babc77a73924a9e2b16e4b2",
"/assets/FontManifest.json": "01700ba55b08a6141f33e168c4a6c22f",
"/assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"/assets/LICENSE": "45ad355bc5e8c8e4bbb6985edb03be49",
"/assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"/icons/Icon-192.png": "9a6a719b7941178f90ff00b149c810f3",
"/icons/Icon-512.png": "9c46871ee020a5bf488900f149a77677",
"/icons/Legacy_Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"/icons/Legacy_Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"/index.html": "3a3042c041cc74567c2410cfed98d385",
"/main.dart.js": "e6373fd180e3024c5a1d2b6aff191454",
"/manifest.json": "3c405695721a72f7db4aaa88a52d093f"
};

self.addEventListener('activate', function (event) {
  event.waitUntil(
    caches.keys().then(function (cacheName) {
      return caches.delete(cacheName);
    }).then(function (_) {
      return caches.open(CACHE_NAME);
    }).then(function (cache) {
      return cache.addAll(Object.keys(RESOURCES));
    })
  );
});

self.addEventListener('fetch', function (event) {
  event.respondWith(
    caches.match(event.request)
      .then(function (response) {
        if (response) {
          return response;
        }
        return fetch(event.request);
      })
  );
});
