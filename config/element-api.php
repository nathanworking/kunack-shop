<?php

use craft\shopify\elements\Product;

return [
    'endpoints' => [
        'product/<shopifyId:\d+>.json' => function (string $shopifyId) {
            return [
                'elementType' => Product::class,
                'criteria' => [
                    'shopifyId' => $shopifyId,
                ],
                'one' => true,
            ];
        },
    ],
];
