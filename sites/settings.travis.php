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
       'database' => 'project_db',
       'username' => 'user',
       'password' => 'password',
       'prefix' => '',
       'host' => 'tc_d8_db_container',
       'port' => '3306',
       'namespace' => 'Drupal\\Core\\Database\\Driver\\mysql',
       'driver' => 'mysql',
     ],
   ],
 ];

$settings['hash_salt'] = '4kngernjkgriugeregrubgebejjn';
