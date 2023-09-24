'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.json": "290e9983611398b9a10cf1c45759a7de",
"assets/AssetManifest.smcbin": "34d1a95f45ba3513033b560bcffe2436",
"assets/assets/%25D0%2586mperator.jpg": "c947f8875b18210d0bab3ecfbd92eb82",
"assets/assets/1.jpg": "ecdc1028f0e80fd98b19a9f457663371",
"assets/assets/332A6450.jpg": "9673b9ab36e0ce9a3aaa5262ba8c88a3",
"assets/assets/Alyaska.jpg": "12362883695050e9be859d6e7e36d33f",
"assets/assets/B%25D1%2596lij%2520drakon.jpg": "2a63bc4e4a8dda9b92628b019cf001e0",
"assets/assets/big_logo.png": "0bf12408fc3b2ce3b31f33da41418d58",
"assets/assets/Blu-f%25D1%2596n.jpg": "01df795c524c7dad4fe205d01842bfad",
"assets/assets/Bon%25D1%2596to.jpg": "bfd0c6141a5e70a01c69fd735988a812",
"assets/assets/cartIcon.png": "d9645d92099468f19da2bef24bc5eb05",
"assets/assets/cheff.png": "0132c9a435b7d1f5184b2d3528edfab7",
"assets/assets/CHervonij%2520drakon.jpg": "e4394dacd6dcaa057887301089dea070",
"assets/assets/CHorna%2520mamba.jpg": "784a4848cb4ee52df72d1836b23d02ed",
"assets/assets/CHorna%2520perlina.jpg": "764879c37732268688a74e7226697575",
"assets/assets/CHornij%2520drakon.jpg": "6888b478759f91299d6eb95a824d1024",
"assets/assets/ClassicSushi.png": "0017bd98b53f06b52382b189a1ac4d90",
"assets/assets/delivery.png": "4ec0ae96da037eab3d52946a5bae4274",
"assets/assets/deliveryInfo.png": "40060c5b165ca89cf7f7f67da89d2152",
"assets/assets/Eb%25D1%2596-rol.jpg": "120bc9aeab6545f4609d4a2e33eaad75",
"assets/assets/F%25D1%2596ladelf%25D1%2596ya%2520klasichna.jpg": "5a7dab5336a179bc5737a46a53edd539",
"assets/assets/F%25D1%2596ladelf%25D1%2596ya%2520lyuks.jpg": "5f4974cfbfe0f7ffb98f91523deab092",
"assets/assets/F%25D1%2596ladelf%25D1%2596ya%2520m%25D1%2596ks.jpg": "28ca3e29cb799a2d1b473816cc7f27cd",
"assets/assets/F%25D1%2596ladelf%25D1%2596ya%2520v%2520kunzhut%25D1%2596.jpg": "56791d1d63c1e106ef805d1622f3b005",
"assets/assets/F%25D1%2596ladelf%25D1%2596ya%2520z%2520krevetkoyu.jpg": "e131121b9e4c5a480e830fc30125ad56",
"assets/assets/F%25D1%2596ladelf%25D1%2596ya%2520z%2520vugrem.jpg": "d0d156b96c5d214c7780232690f133ce",
"assets/assets/Facebook.png": "e4066305992d46e799caf8f59e071a91",
"assets/assets/Futomak%25D1%2596%2520z%2520greb%25D1%2596ntsem.jpg": "5c86a82ea8e5b4e3e210df1166244aed",
"assets/assets/Futomak%25D1%2596%2520z%2520lososem.jpg": "b7b7adbe339d8e6375206f7ba62eb5e6",
"assets/assets/Futomak%25D1%2596%2520z%2520tuntsem.jpg": "cef232be27618960a9d86c1a558bcc25",
"assets/assets/Fyudzhi.jpg": "40b636ba1f48def5556093bba1ab4c8b",
"assets/assets/Gunkan%2520z%2520greb%25D1%2596ntsem.jpg": "c61619c9d26f687265c51ecba56be7d1",
"assets/assets/Gunkan%2520z%2520lososem.jpg": "f5781ea2763724eded08b38e62828ad4",
"assets/assets/Gunkan%2520z%2520tuntsem.jpg": "1f0e6dd84b3b8ce15330af63177f35f7",
"assets/assets/Gunkan%2520z%2520vugrem.jpg": "4fc9c7c61693e747072980865aca461a",
"assets/assets/Instagram.png": "31d412d2eebda8bb520ed54bb821c471",
"assets/assets/Kal%25D1%2596forn%25D1%2596ya%2520z%2520krevetkoyu%2520ta%2520krabom.jpg": "5aba017eef6d4af9ddcc91be6430d0b7",
"assets/assets/Kal%25D1%2596forn%25D1%2596ya%2520z%2520lososem.jpg": "b2f8b0e31c2243c1d085a9ddcf5e703f",
"assets/assets/Kal%25D1%2596forn%25D1%2596ya%2520z%2520tuntsem.jpg": "8b953e50a1109d3acd7a13e3fb2b24ff",
"assets/assets/Kal%25D1%2596forn%25D1%2596ya%2520z%2520vugrem.jpg": "f1f860ceaac887cb555f9013a00f98b2",
"assets/assets/Lanch%2520rol.jpg": "2bdd1b62ef419dd558eead6ebbf9f318",
"assets/assets/Lanch-rol.jpg": "f707b0481b6b620d1d12804f72e8829b",
"assets/assets/Mak%25D1%2596%2520z%2520avokado.jpg": "205820b457270170611f35963cececa9",
"assets/assets/Mak%25D1%2596%2520z%2520lososem.jpg": "57aecf4f7d660d766530fa5a503caa10",
"assets/assets/Mak%25D1%2596%2520z%2520og%25D1%2596rkom.jpg": "105ef6655cd78b8c6e9e9b5f7533a95e",
"assets/assets/Mak%25D1%2596%2520z%2520tuntsem.jpg": "d9801f8de7457dc5421403d74e4d3153",
"assets/assets/Mak%25D1%2596%2520z%2520vugrem.jpg": "4e7518e564c1449c11f1d94384bc843e",
"assets/assets/menuInfo.png": "d4e957ff8ad068f2f39c8e6c175cc896",
"assets/assets/Osaka.jpg": "4495297db7b3b55b51fa0aa680331b9f",
"assets/assets/paymentInfo.png": "1cc366625840817dd61404b2068ccc05",
"assets/assets/Pek%25D1%2596n.jpg": "a5036fd1f6279dca3e8b205b9e417128",
"assets/assets/phoneIcon.png": "2d1474c480d32b03bbcaf7f1789beaf1",
"assets/assets/plusIcon.png": "add0d8f4664cca2813fe2e315e12d6ce",
"assets/assets/Raj-taj.jpg": "41a35d735ecff884e4a11653f3f36a8e",
"assets/assets/sale.png": "13613eba4a7948f449a682c60932911d",
"assets/assets/SignatureSushi.png": "2ba377ddaf3426fed81ea7e80bbf094f",
"assets/assets/small_logo.png": "ff04ad790624ab013ff7386814512127",
"assets/assets/Sush%25D1%2596%2520z%2520lososem.jpg": "9473b9a5f0644d9dd59bdfc5cc9d46a4",
"assets/assets/Sush%25D1%2596%2520z%2520vugrem.jpg": "445c3552132f5d3980e242552a6ea3e9",
"assets/assets/Sushi.png": "72ab83cc04a11b0ca1d8c2fdf513f9db",
"assets/assets/sushi1.png": "59402b44acca3743d9dbb2cfa8e38e6b",
"assets/assets/sushi2.png": "5998d6975089b3aaea6ecc12b61e7e3f",
"assets/assets/sushi3.png": "db5366c07307e4cb00890f0bb52d1650",
"assets/assets/SushiMaki.png": "8061a335b4ae8fccc9bc1d889b8a3c7c",
"assets/assets/SushiPhiladelphia.png": "ae7b87ce5fe4d5e5c6717c511e129fce",
"assets/assets/SushiSets.png": "c9d2131dd2b2f0a158f01f0e4b443bcf",
"assets/assets/teamInfo.png": "4b05ce81b65d89d7046b128691d4224c",
"assets/assets/UMI_logo.png": "bf732bffc3bb0af5bc31b78b7a776455",
"assets/assets/Vegan.jpg": "3b53a0c8f3f668809c649b02467015b6",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "50bb7de8be40b91c29886fde221f6d1f",
"assets/NOTICES": "6b6c35b97a1e5520b7257d7a9037ed91",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "57d849d738900cfd590e9adc7e208250",
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
"index.html": "41782ca2a0b280ca780d7da98af7326c",
"/": "41782ca2a0b280ca780d7da98af7326c",
"main.dart.js": "71f9aaf5c9db41c75ffe9a1345dfadca",
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
