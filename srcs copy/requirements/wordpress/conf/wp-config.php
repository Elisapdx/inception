<?php
define('DB_NAME', getenv("MYSQL_DATABASE"));
define('DB_USER', getenv("MYSQL_USER"));
define('DB_PASSWORD', getenv("MYSQL_PASSWORD"));
define('DB_HOST', getenv("MYSQL_HOSTNAME") . ":3306");

define('AUTH_KEY',         'Cx@Ajoe(8q^A| Q1OY:ts|..@E7_-,zkZg}U39?5wcpt5G5|;8yS*|feP+DDdoT?');
define('SECURE_AUTH_KEY',  'ay|%A5`SV`.UlC1$H9b(q--~/7x,Yh|xyigS_mh-JK>U&V8eN{D5Ha|WB+f?oZHw');
define('LOGGED_IN_KEY',    't+R1H;!f^Hl/uoe!p7Ce,]A!zV=M;G?5,d^{ZrkP>~fz8k{W4t[s=>{v|?j<vvGy');
define('NONCE_KEY',        'NFuJ7*_#?71 q&ugQ_b0U<z)/Ul$VQ=enJ*Be|a}RfwEkO#-vUp_~L_bA6,|NWB6');
define('AUTH_SALT',        '^d._~SoRB>TZL2jU+iWu<!{YL3^1t>wbr#|s-t.Jq)4e-q:{-!jqI4E$-ta?9-cd');
define('SECURE_AUTH_SALT', '*@8Ynn1.:*9jQvme4ExSuT[X&KnIy7VTapnC  ,DU)6Fn];m-0JX-UvsG?:0YEJV');
define('LOGGED_IN_SALT',   '[_nM}aET!i(-8^ ez-HrA1MVaue&R43V|,=8Fk;zDTc.:eQc/j(q=%sRtrwYnrJ<');
define('NONCE_SALT',       '8 Dv002bm%-GLlTN.3S?Ju!iT8`WBt/(.Ub1#>*6gtXdvJ`S|=4c_/{}d<xGq);F');		#generateur de cle trouver sur https://kinsta.com/fr/base-de-connaissances/cles-securite-wordpress/

define("WP_DEBUG", true);	#affiche les logs de debug

if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}
require_once ABSPATH . 'wp-settings.php';
?>