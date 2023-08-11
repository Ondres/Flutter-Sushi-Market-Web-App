'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.json": "73057b6b113f0ca25f17bf56ac6c12ae",
"assets/AssetManifest.smcbin": "ff853a39d064a4539c6cc52bee6290f2",
"assets/assets/1.jpg": "ecdc1028f0e80fd98b19a9f457663371",
"assets/assets/big_logo.png": "0bf12408fc3b2ce3b31f33da41418d58",
"assets/assets/cartIcon.png": "d9645d92099468f19da2bef24bc5eb05",
"assets/assets/cheff.png": "0132c9a435b7d1f5184b2d3528edfab7",
"assets/assets/ClassicSushi.png": "d88278471a3479c2b7260fd38031bc47",
"assets/assets/delivery.png": "4ec0ae96da037eab3d52946a5bae4274",
"assets/assets/deliveryInfo.png": "40060c5b165ca89cf7f7f67da89d2152",
"assets/assets/Facebook.png": "e4066305992d46e799caf8f59e071a91",
"assets/assets/Instagram.png": "31d412d2eebda8bb520ed54bb821c471",
"assets/assets/menuInfo.png": "d4e957ff8ad068f2f39c8e6c175cc896",
"assets/assets/paymentInfo.png": "1cc366625840817dd61404b2068ccc05",
"assets/assets/phoneIcon.png": "2d1474c480d32b03bbcaf7f1789beaf1",
"assets/assets/plusIcon.png": "c159aa9d3e19b445fc71d17917db0ddc",
"assets/assets/sale.png": "13613eba4a7948f449a682c60932911d",
"assets/assets/SignatureSushi.png": "9c3f25f5f0b9635582165e28df23d5ca",
"assets/assets/small_logo.png": "ff04ad790624ab013ff7386814512127",
"assets/assets/Sushi.png": "b83d5835a4c754f3cde6bbc031c68302",
"assets/assets/sushi1.png": "59402b44acca3743d9dbb2cfa8e38e6b",
"assets/assets/sushi2.png": "5998d6975089b3aaea6ecc12b61e7e3f",
"assets/assets/sushi3.png": "db5366c07307e4cb00890f0bb52d1650",
"assets/assets/SushiMaki.png": "05c398ec2d4c2e1e80c6bbfcaa6bab56",
"assets/assets/SushiPhiladelphia.png": "562c85961d45543089be3814c3b3e0bf",
"assets/assets/SushiSets.png": "38b9b010c25293be3abe3d9a5747b5b3",
"assets/assets/teamInfo.png": "4b05ce81b65d89d7046b128691d4224c",
"assets/FontManifest.json": "535f15d5ee3029ad18f23a9a1ce25fdb",
"assets/fonts/MaterialIcons-Regular.otf": "787e02f6d9c378ae1b25c0e5286d87c6",
"assets/NOTICES": "20ac54c1c8bc8dc0b1b8361ddf0802b6",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "57d849d738900cfd590e9adc7e208250",
"assets/packages/dropdown_button2/assets/fonts/Roboto-Regular.ttf": "8a36205bd9b83e03af0591a004bc97f4",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"canvaskit/canvaskit.js": "76f7d822f42397160c5dfc69cbc9b2de",
"canvaskit/canvaskit.wasm": "f48eaf57cada79163ec6dec7929486ea",
"canvaskit/chromium/canvaskit.js": "8c8392ce4a4364cbb240aa09b5652e05",
"canvaskit/chromium/canvaskit.wasm": "fc18c3010856029414b70cae1afc5cd9",
"canvaskit/skwasm.js": "1df4d741f441fa1a4d10530ced463ef8",
"canvaskit/skwasm.wasm": "6711032e17bf49924b2b001cef0d3ea3",
"canvaskit/skwasm.worker.js": "19659053a277272607529ef87acf9d8a",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "6b515e434cea20006b3ef1726d2c8894",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "ad711b92d832c3654a459c47706f2c29",
"/": "ad711b92d832c3654a459c47706f2c29",
"main.dart.js": "ff7e8c5f38b4415e6a5716ce93e60ae7",
"manifest.json": "0b065b4e66a6dc10e4f83a9b4a71e31b",
"version.json": "9a8879609a225245cd5279bb5d7fbdca"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
