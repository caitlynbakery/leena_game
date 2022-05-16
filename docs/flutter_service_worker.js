'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "6d03a898083e49e229acfa8ae2fe2511",
"assets/assets/audio/sfx/food.mp3": "938be6ed42c09de39698add6a9181f92",
"assets/assets/audio/sfx/success.mp3": "4eb0e5d0ec6119778e1f4f1f03c87c35",
"assets/assets/audio/sfx/yay.mp3": "bec23fa4dfaecebf494318d399621f89",
"assets/assets/audio/sfx/yay2.wav": "e1ae4b44ff99f75247a67c56cc4041d1",
"assets/assets/audio/success.mp3": "4eb0e5d0ec6119778e1f4f1f03c87c35",
"assets/assets/flip.json": "4b1d70ab68b3c6fb2a1ec73589b3726e",
"assets/assets/flip.tps": "094a2b7e4af6290a6d5bd9f9540ce213",
"assets/assets/flip_11.xcf": "6c509d5368efdfdbdb7c234148b6b051",
"assets/assets/fonts/ARCADECLASSIC.TTF": "964111990ca3937960147b80e8d07e61",
"assets/assets/idle.json": "e081527b411afce5f66aeea42146cf64",
"assets/assets/images/background.png": "25d5be3073245a2c56c82ffec7d50822",
"assets/assets/images/dad.png": "aeb522a7b6d2a6bde733233ae78bea9d",
"assets/assets/images/flip.png": "90f536dd29bfe9a9a8089c61b9892726",
"assets/assets/images/gems/Coal.png": "2783c759044b650e52e310681b311972",
"assets/assets/images/gems/CopperIngot.png": "3c0e12cbdee888db4f902d01ffb340bd",
"assets/assets/images/gems/CopperNugget.png": "a903db0736d13a3a23f5b58f374fcf77",
"assets/assets/images/gems/Crystal.png": "b7225bb140db41a59e2af8330fa2da58",
"assets/assets/images/gems/CutEmerald.png": "3916b4b6d12269c6849ed913f615f298",
"assets/assets/images/gems/CutRuby.png": "62bcb5af11b48ab0866b28941c6a9f72",
"assets/assets/images/gems/CutSapphire.png": "1e5bc2b02bf31ebe82bb29a37f0e116b",
"assets/assets/images/gems/CutTopaz.png": "2f2c0225e382e2fc23e2d3d35a893b47",
"assets/assets/images/gems/Diamond.png": "bdb841fd8f6e2276a36d5364f816955c",
"assets/assets/images/gems/Emerald.png": "49018bf55b4b6bae593523f7663ffccc",
"assets/assets/images/gems/GoldenIngot.png": "6a306b56447e2ee393ff2c92e7418a46",
"assets/assets/images/gems/GoldNugget.png": "66e37002eaf8defbf1326f695fc6a86a",
"assets/assets/images/gems/Obsidian.png": "81d54c67baac9a4e33df50279bc8c83e",
"assets/assets/images/gems/Pearl.png": "defd603c4d24d449e23cec6ed7b4d83e",
"assets/assets/images/gems/Ruby.png": "ff2992c8b3ec3264dafb1e4d9725a719",
"assets/assets/images/gems/Sapphire.png": "bd3bc1b64747d8c369440ece319f3420",
"assets/assets/images/gems/SilverIngot.png": "d9149e743a250c59c43b8d20f57224d5",
"assets/assets/images/gems/SilverNugget.png": "1e95af434bc5e5db2e83fe922873d2a6",
"assets/assets/images/gems/Topaz.png": "0a5885d283ee206f42605e5f3a7c21c7",
"assets/assets/images/girl0.png": "2768e41230dc7fe233ba2655fc0a7b9b",
"assets/assets/images/ground_tiles/1.png": "9a92e2f407a2692353bf2e17fe977e15",
"assets/assets/images/ground_tiles/10.png": "3d5677503b5e23cd57335b27d7c21a6e",
"assets/assets/images/ground_tiles/11.png": "3d8b737a604b91a27666d50a75aa176a",
"assets/assets/images/ground_tiles/12.png": "288c2be27497f2d45bd1a2098aa90cb9",
"assets/assets/images/ground_tiles/13.png": "0388ff9e97b060fea41c86d9fc150a46",
"assets/assets/images/ground_tiles/14.png": "6183d250a29bec4193dc406a8e34572a",
"assets/assets/images/ground_tiles/15.png": "72d13cd371ac4dfa656e20c43959590e",
"assets/assets/images/ground_tiles/16.png": "41a37ded39a82e2265899814ca9df4e1",
"assets/assets/images/ground_tiles/17.png": "7a155a8d975ac5f21ceeece1a926566a",
"assets/assets/images/ground_tiles/18.png": "fa20981b8a8096c4fb3b45119b9903a4",
"assets/assets/images/ground_tiles/2.png": "c80633fb997ea898cb2222e99d36aa08",
"assets/assets/images/ground_tiles/3.png": "aa9f48bf865943db7c4686d4a024d410",
"assets/assets/images/ground_tiles/4.png": "9ed2e3d7e49b0a7819a34c98c41152e5",
"assets/assets/images/ground_tiles/5.png": "d569a1be42ed6028f69cadb8d2964a5a",
"assets/assets/images/ground_tiles/6.png": "d249694c0be33bc075a9a8e3bfd1af6c",
"assets/assets/images/ground_tiles/7.png": "eea3524497e6dda7dac5ed3b2811008c",
"assets/assets/images/ground_tiles/8.png": "b229377cbf0ccf429b3f3ba12b8ab613",
"assets/assets/images/ground_tiles/9.png": "2dc436e61e34fc7b242eadcb93bc2bab",
"assets/assets/images/idle.png": "6811acb11dda826129d57dea97ece0dd",
"assets/assets/images/leena.png": "4570ba1b3ab4e25922231fc187254b5e",
"assets/assets/images/obstacles.png": "fe701a33bd59e7e7acd15ef907e9a74a",
"assets/assets/images/push.png": "271bbc1150ab9d2697899b6c18b383a1",
"assets/assets/leena.json": "988ba3843ae26eb5c15452afd7c4867f",
"assets/assets/push.json": "afe98381963b263d06a480a31f2fb021",
"assets/assets/push.tps": "70a208be8a87aeda31a4055ae889b98c",
"assets/assets/ride.tps": "8febb78d1c04243f1819b9d03251a1d3",
"assets/assets/tiles/map.tmx": "6df8c39938354a1cdce330db9ddabd6d",
"assets/assets/tiles/map2.tmx": "ebf53d12c2e9394300f922f81f4c1364",
"assets/FontManifest.json": "43363627961752c1d7d8fd6901fab885",
"assets/fonts/MaterialIcons-Regular.otf": "7e7a6cccddf6d7b20012a548461d5d81",
"assets/NOTICES": "87e9155521ad0ad5b90e1fd1c0d9e320",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "494049981a3194fcc41bf4dc47004084",
"/": "494049981a3194fcc41bf4dc47004084",
"main.dart.js": "5e46183e5613360865ae7491cf9ecf30",
"manifest.json": "ab76b82735223751694e151e7371561b",
"version.json": "6ec0543335a17792af8d68aa679273ac"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
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
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
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
