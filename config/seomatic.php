<?php
/**
 * SEOmatic plugin for Craft CMS 3.x
 *
 *  * Chaos General Craft Configuration v3.0.0
 */

use nystudio107\seomatic\base\SeoElementInterface;



return [
    // Global settings
    '*' => [
        'pluginName' => 'SEO',
        'environment' => getenv('CRAFT_ENVIRONMENT'),
        'sidebarDisplayPreviewTypes' => [
            'google',
            'facebook'
        ],
        'renderEnabled' => true,
    ],

    // Dev (Local) environment settings
    'dev' => [
        
    ],

    // Staging environment settings
    'staging' => [
        
    ],

    // Production environment settings
    'production' => [
       
    ],
];

