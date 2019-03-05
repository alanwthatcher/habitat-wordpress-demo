source results/demo.env

hab svc unload alan/wordpress
hab svc load $pkg_wp_new --bind database:mysql.default