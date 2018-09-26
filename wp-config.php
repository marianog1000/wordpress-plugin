<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'plugings');

/** MySQL database username */
define('DB_USER', 'root');

/** MySQL database password */
define('DB_PASSWORD', '');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8mb4');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'J8S#xHHbll1L@[tf5/h}*:  ](?QGi$_St?M(D%g%|:GWA{[;VVd:AaBe[KBbyBD');
define('SECURE_AUTH_KEY',  't%ikE nZ_ ZjFWb5ao$3!r6goQQ`S-a!lrJ.UK8KwX,=nw4jlu5asQVsK=6[^xfH');
define('LOGGED_IN_KEY',    '9T>7s04bfUZZ<S9x`K<g!?fGuF:F{~H{@2F#M:Hd!fm{>HFfI+!&9N8E00ZFMC+~');
define('NONCE_KEY',        'IZ>WT9,!iY<3?NM>K7xwC#}YuBWp`1R3_a tL|0~>n8,d@=`/,U(aiS]T+oOb3]m');
define('AUTH_SALT',        'ZI {[pq(j<J2>wAao@uzsoD@P4%:4i`]1$Z8uWvAw:-pwxEx-]FxRNsJr-s(?*zk');
define('SECURE_AUTH_SALT', 'H=/;Kuf%&U.td+{GsTO2[nZ#b{~4mJO@P7oASlZr54Tk$J`DM*S30Pm@rstxG[xQ');
define('LOGGED_IN_SALT',   'wX*`=H6qm|[yQ&b]FrGcx-^7e5Di+sw^DYPtbD3.!V/Da?{BPc`U%|N{M>[,+ZFu');
define('NONCE_SALT',       '.Hh!(54u9KZA#|s/T`gW:qma5zJX9CRLP?rE`_)q/k;`PH_QJ|bK4Qi0JKnWt8>s');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'pl_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
