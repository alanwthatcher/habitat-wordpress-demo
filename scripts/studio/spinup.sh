# Build package and store ident in demo.env
function prepare_pkg {
  build $1
  source results/last_build.env
  echo "pkg_${2}=${pkg_ident}" >> results/demo.env
}

rm -f results/demo.env

prepare_pkg wordpress-4.9.9 wp_old 
prepare_pkg wordpress-5.1 wp_new
prepare_pkg mysql-5.7.17 wp_mysql