<?php
/**
 * @copyright Copyright (c) PutYourLightsOn
 */

/**
 * Blitz config.php
 *
 * This file exists only as a template for the Blitz settings.
 * It does nothing on its own.
 *
 * Don't edit this file, instead copy it to 'craft/config' as 'blitz.php'
 * and make your changes there to override default settings.
 *
 * Once copied to 'craft/config', this file will be multi-environment aware as
 * well, so you can have different settings groups for each environment, just as
 * you do for 'general.php'
 */

return [
    // Global settings
    '*' => [

        // Whether the "cached on" and "served by" timestamp comments should be appended to the cached output.
        // - `false`: Do not append any comments
        // - `true`: Append all comments
        // - `2`: Append "cached on" comment only
        // - `3`: Append "served by" comment only
        'outputComments' => true,

        // Custom site-specific config settings
        'cachingEnabled' => true,

        // With this setting enabled, Blitz will statically include templates using Server-Side Includes (SSI), which must be enabled on the web server.
        'ssiEnabled' => false,

        // With this setting enabled, Blitz will statically include templates using Edge-Side Includes (ESI), which must be enabled on the web server or CDN.
        'esiEnabled' => false,

        // Whether URLs with query strings should be cached and how.
        // - `0`: Do not cache URLs with query strings
        // - `1`: Cache URLs with query strings as unique pages
        // - `2`: Cache URLs with query strings as the same page
        'queryStringCaching' => 1,

        // Determines when and how the cache should be refreshed.
        // - `0`: Expire the cache, regenerate manually
        // - `1`: Clear the cache, regenerate manually or organically
        // - `2`: Expire the cache and regenerate in a queue job
        // - `3`: Clear the cache and regenerate in a queue job
        'refreshMode' => 3,

        // The storage settings.
        'cacheStorageSettings' => [
           'folderPath' => '@webroot/cache/blitz',
           'createGzipFiles' => true,
           'countCachedFiles' => true,
        ],

        // Whether pages containing query string parameters should be generated.
        'generatePagesWithQueryStringParams' => true,

        // Whether asset images should be purged when changed.
        'purgeAssetImagesWhenChanged' => true,

        // Whether the cache should automatically be refreshed after a global set is updated.
        'refreshCacheAutomaticallyForGlobals' => true,

        // Whether the cache should be refreshed when an element is moved within a structure.
        'refreshCacheWhenElementMovedInStructure' => true,

        // Whether the cache should be refreshed when an element is saved but unchanged.
        'refreshCacheWhenElementSavedUnchanged' => false,

        // Whether the cache should be refreshed when an element is saved but not live.
        'refreshCacheWhenElementSavedNotLive' => false,

        // The amount of time after which the cache should expire (if not 0). See [[ConfigHelper::durationInSeconds()]] for a list of supported value types.
        'cacheDuration' => 600000,

        // The value to send in the cache control header.
        // 'cacheControlHeader' => 'public, s-maxage=31536000, max-age=0',

        // Whether an `X-Powered-By: Blitz` header should be sent.
        'sendPoweredByHeader' => true,

    ],

    // Dev environment settings
    'dev' => [
        'cachingEnabled' => false,
    ],

];

  