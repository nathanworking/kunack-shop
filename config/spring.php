<?php
/**
 * SEOmatic plugin for Craft CMS 3.x
 *
 *  * Chaos General Craft Configuration v3.0.0
 */

use nystudio107\seomatic\base\SeoElementInterface;



return [
    // Dev (Local) environment settings
    'dev' => [
        'enablePlayground' => true,
    ],

    // Staging environment settings
    'staging' => [
        'enablePlayground' => false,
    ],

    // Production environment settings
    'production' => [
        'enablePlayground' => false,
    ],
];

