source results/demo.env

hab config apply mysql.default $(date +%s) scripts/studio/mysql-wordpress-config.toml
hab svc load $pkg_wp_mysql

if [ "$1" == 'nodbstage' ]; then
  hab config apply wordpress.default $(date +%s) scripts/studio/wp-nodbrestore.toml
fi

hab svc load $pkg_wp_old --bind database:mysql.default