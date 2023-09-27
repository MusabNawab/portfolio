'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "dc739349e14b6790add08d59e93e4e2a",
"assets/AssetManifest.json": "43c494336743042c1050400584ae8779",
"assets/assets/images/c.png": "272b7dfc1f9b78cf3ddee5b7090749d2",
"assets/assets/images/dart.png": "b73081b39828581f204c481373c77e4e",
"assets/assets/images/firebase.png": "e6ba467265c6799f61c2dbd982565b16",
"assets/assets/images/flutter.png": "0ee7b2475a1b7d3fa4a1d811b97321c2",
"assets/assets/images/github.png": "e7d173cbe508c8166299d0024599239c",
"assets/assets/images/gmail.png": "72e3d99ec4d40a98c1308d1be08da577",
"assets/assets/images/java.png": "1e681e1798de6c26a6f256e5e8067b9a",
"assets/assets/images/linkedin.png": "7995f098d42d4eb43b6cbdd822aae74d",
"assets/assets/images/linux.png": "9261727273d6fa138a40f211ed1aa358",
"assets/assets/images/musab.jpg": "4593ecccfdb6e8e1de5b7a23f5f124d2",
"assets/assets/images/mysql.png": "30612f2d72adda4093ce215bd0102f64",
"assets/assets/images/py.png": "433922316359bba377c77f63eaae9df5",
"assets/assets/images/spring_boot.png": "bb00cf1ea0e13e037103918cdf672596",
"assets/assets/images/SS_cooknote1.png": "bcb92385456caad20aa78b24c28a5882",
"assets/assets/images/SS_cooknote2.png": "13f5536230df78eb4ed04a30b6912a9d",
"assets/assets/images/SS_cooknote3.png": "ddc34d975a1a09fb1ee807b44f763b3e",
"assets/assets/images/SS_cooknote4.png": "871984b667f44088e133d165edc0ae69",
"assets/assets/images/SS_expenseTracker1.png": "d91f3c1cb387d7c09a76728b7a1ec90d",
"assets/assets/images/SS_expenseTracker2.png": "5661bb9790d4a75fdfb84608fb26dd79",
"assets/assets/images/SS_expenseTracker3.png": "d595ae11100d20b8fd1a4f47c161085b",
"assets/assets/images/SS_sd1.jpg": "290464d136dd7b2d2ac8cdf51a889a5b",
"assets/assets/images/SS_sd1.png": "393f077f79ed0a09169e67dea3999253",
"assets/assets/images/SS_todo1.png": "317fe7eb5caf07ed8279f0772535f8d7",
"assets/assets/images/SS_todo2.png": "26574d09e786bfd4832d233496ad446c",
"assets/assets/videos/cn.mp4": "06f1cbf619782e811865a0e2a1d592ce",
"assets/assets/videos/et.mp4": "fbd316a1b5d0f6fc1c3c2c6676938048",
"assets/assets/videos/sd.mp4": "b36faa7bcd9fcec0e7713bab4ad5bc65",
"assets/assets/videos/td.mp4": "28e6123092cc2ba39f5df95376bfc4c6",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "f1d683fd18c38e8653a4226c61950006",
"assets/NOTICES": "6369d8bab437ea656800159ae395f14e",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"canvaskit/canvaskit.js": "5caccb235fad20e9b72ea6da5a0094e6",
"canvaskit/canvaskit.wasm": "d9f69e0f428f695dc3d66b3a83a4aa8e",
"canvaskit/chromium/canvaskit.js": "ffb2bb6484d5689d91f393b60664d530",
"canvaskit/chromium/canvaskit.wasm": "393ec8fb05d94036734f8104fa550a67",
"canvaskit/skwasm.js": "95f16c6690f955a45b2317496983dbe9",
"canvaskit/skwasm.wasm": "d1fde2560be92c0b07ad9cf9acb10d05",
"canvaskit/skwasm.worker.js": "51253d3321b11ddb8d73fa8aa87d3b15",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "6b515e434cea20006b3ef1726d2c8894",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "30395f30e187b4f9a482db4529cd0ae8",
"/": "30395f30e187b4f9a482db4529cd0ae8",
"main.dart.js": "969d1db84d122d5aeb66dbf4a68a7f23",
"manifest.json": "d40c47d1c161f94dbcb13094d37f1f55",
"version.json": "009c9e65172e010890f7f65fde438006"};
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
