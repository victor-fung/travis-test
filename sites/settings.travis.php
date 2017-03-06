<?php
/**
 * @file
 * Travis CI override configuration feature.
 *
 */

/**
 * Database settings.
 */
$databases = [
  'default' => [
    'default' => [
      'database' => $_SERVER['DB_NAME'],
      'username' => $_SERVER['DB_USER'],
      'password' => $_SERVER['DB_PASSWORD'],
      'prefix' => '',
      'host' => '127.0.0.1',
      'port' => $_SERVER['DB_PORT'],
      'namespace' => 'Drupal\\Core\\Database\\Driver\\mysql',
      'driver' => 'mysql',
    ],
  ],
];
