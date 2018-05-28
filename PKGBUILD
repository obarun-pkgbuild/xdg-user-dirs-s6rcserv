# Maintainer: Eric Vidal <eric@obarun.org>

pkgbase=xdg-user-dirs
_depends=xdg-user-dirs
pkgname="${pkgbase}"-s6rcserv
pkgver=0.2
pkgrel=1
pkgdesc="${pkgbase} service for s6-rc"
arch=(x86_64)
license=('ISC')
depends=("${_depends}" 's6' 's6-rc' 's6-boot' 's6opts')
makedepends=('util-linux' 'findutils')
conflicts=()
source=("$pkgname::git+https://github.com/obarun-pkgbuild/${pkgname}#branch=master")
md5sums=('SKIP')
validpgpkeys=('6DD4217456569BA711566AC7F06E8FDE7B45DAAC') # Eric Vidal

prepare(){
	cd "${pkgname}"
	
	sed -i "s:base:${pkgbase}:g" Makefile
	name_cap=( "${pkgbase[*]^}" )
	exist=$(find -maxdepth 1 -name 'base-*' -type d)
	if [[ -n "${exist}" ]]; then
		if [[ -d bundle-base ]]; then
			find -type d -name 'bundle-base' | rename base "${name_cap}" bundle-base 
			sed -i "s:base:${pkgbase}:g" bundle-*/contents
		fi
		find -type d -name 'base-*' | rename base "${pkgbase}" * 
		for i in *-log/logd *-log/run; do
			sed -i "s:base:${pkgbase}:g" $i 
		done
	fi
	# user dir
	if [[ -d user ]]; then
		if [[ -d user/rc/bundle-base ]]; then
			find user/rc/ -type d -name 'bundle-base' | rename base "${name_cap}" user/rc/bundle-base 
			sed -i "s:base:${pkgbase}:g" user/rc/bundle-*/contents
		fi
		find user/rc/ -type d -name 'base-*' | rename base "${pkgbase}" user/rc/* 
		for i in user/rc/*-log/logd user/rc/*-log/run; do
			sed -i "s:base:${pkgbase}:g" $i 
		done
	fi
}
package(){
	cd "${pkgname}"
	
	make DESTDIR="$pkgdir" install
	
}
