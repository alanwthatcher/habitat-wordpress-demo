source results/demo.env

hab config apply mysql.default $(date +%s) scripts/studio/mysql-wordpress-config.toml
hab svc load $pkg_wp_mysql
