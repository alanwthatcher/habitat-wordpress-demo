source results/demo.env

hab config apply mysql.default $(date +%s) scripts/studio/mysql-wordpress-config.toml
hab svc load $pkg_mysql5717

if [ "$1" == 'nodbstage' ]; then
  hab config apply wordpress.default $(date +%s) scripts/studio/wp-nodbrestore.toml
fi

hab svc load $pkg_wp_new --bind database:mysql.default