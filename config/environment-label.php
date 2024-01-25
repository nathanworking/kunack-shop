<?php

return [
    // Global settings
    '*' => [
        'showLabel' => true,
        'prefixText' => null,
        'suffixText' => null,
        'targetSelector' => '#global-header:before',       
    ],

    // Dev environment settings
    'dev' => [
        'labelColor' => '#5c4ee0',
        'labelText' => "dev - local",
        'textColor' => '#ffffff',
    ],

    // Staging environment settings
    'staging' => [
        'labelColor' => '#ce733c',
        'labelText' => "Staging",
        'textColor' => '#ffffff',
    ],

    // Production environment settings
    'production' => [
        'labelColor' => '#299a43',
        'labelText' => "Production - all changes live",
        'textColor' => '#ffffff',
    ],
];
