# This file is the heart of your application's habitat.
# See full docs at https://www.habitat.sh/docs/reference/plan-syntax/

pkg_name=wordpress
pkg_origin=azure-habitat-example
pkg_version="4.9.9"
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_license=('Apache-2.0')
pkg_source="https://wordpress.org/${pkg_name}-${pkg_version}.tar.gz"
pkg_shasum="bd3b9f4a5300427616c89d5e30b7aa3ca8ec539c38ec27ba772cdebcf7332da4"
pkg_description="installs wordpress"
pkg_upstream_url="https://wordpress.org/"

source_dir=$HAB_CACHE_SRC_PATH/${pkg_name}

pkg_svc_user=root
pkg_svc_group=$pkg_svc_user

pkg_deps=(core/php core/curl core/nginx core/mysql-client core/readline)

pkg_exports=()
pkg_exposes=()

pkg_binds=(
  [database]="host port username password database"
)


do_build(){
  return 0
}

do_install() {
  cp -r "$source_dir" "$pkg_prefix/wordpress/"
}