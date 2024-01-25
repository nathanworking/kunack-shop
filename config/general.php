<?php
/**
 * 
 * 
 * Chaos General Craft Configuration 3.0.0
 *
 * 
 * @see \craft\config\GeneralConfig
 */

 
use craft\config\GeneralConfig;
use craft\helpers\App;


return [
    // Global settings
    '*' => [
        // Default Week Start Day (0 = Sunday, 1 = Monday...)
        'defaultWeekStartDay' => 1,

        // Whether generated URLs should omit "index.php"
        'omitScriptNameInUrls' => true,

        // Control panel trigger word
        'cpTrigger' => getenv('CP_TRIGGER'),

        // Max upload size allowed by craft
        'maxUploadFileSize' => '1006777216',

        // The secure key Craft will use for hashing and encrypting data
        'securityKey' => getenv('SECURITY_KEY'),

        // Aliases parsed in sites’ settings, volumes’ settings, and Local volumes’ settings
        'aliases' => [
            '@basePath' => getenv('BASE_PATH'),
            '@baseUrl' => getenv('BASE_URL'),
            '@web' => getenv('PRIMARY_SITE_URL'),
        ],

        // Don't need this with Blitz
        'enableTemplateCaching' => false,

        // telling craft where to go for this
        'resourceBasePath' => dirname(__DIR__) . '/web/cpresources',

        // The secure key Craft will use for hashing and encrypting data
        'securityKey' => getenv('SECURITY_KEY')
        
    ],

    // Dev (Local) environment settings
    'dev' => [
        'devMode' => true,
        'disallowRobots' => true,
        'allowAdminChanges' => true,
        'allowUpdates' => true
    ],

    // Staging environment settings
    'staging' => [
        'allowAdminChanges' => false,
        'allowUpdates' => false,
        'disallowRobots' => true,
    ],

    // Production environment settings
    'production' => [
        'allowAdminChanges' => false,
        'allowUpdates' => false,
    ],
];
