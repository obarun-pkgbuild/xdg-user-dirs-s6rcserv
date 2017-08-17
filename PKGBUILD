# Maintainer: Eric Vidal <eric@obarun.org>

pkgname=xdg-user-dirs-s6rcserv
pkgver=0.1
pkgrel=1
pkgdesc="xdg-user-dirs service for s6"
arch=(x86_64)
license=('beerware')
depends=('xdg-user-dirs' 's6' 's6-rc' 's6-boot')
conflicts=()
source=('xdg-user-dirs.daemon.dependencies.s6'	
		'xdg-user-dirs.daemon.type.s6'
		'xdg-user-dirs.daemon.up.s6'		
		'LICENSE')
md5sums=('68b329da9893e34099c7d8ad5cb9c940'
         '85bceea1fb94d4166f24496dc40a35e6'
         '95daf8ca4cd18ccf230e77de914ded6b'
         '191a37ae657aa17e37e75d0242865dba')
validpgpkeys=('6DD4217456569BA711566AC7F06E8FDE7B45DAAC') # Eric Vidal

package() {
	
	# daemon
	install -Dm 0644 "$srcdir/xdg-user-dirs.daemon.dependencies.s6" "$pkgdir/etc/s6-serv/available/rc/xdg-user-dirs-daemon/dependencies"
	install -Dm 0644 "$srcdir/xdg-user-dirs.daemon.type.s6" "$pkgdir/etc/s6-serv/available/rc/xdg-user-dirs-daemon/type"
	install -Dm 0644 "$srcdir/xdg-user-dirs.daemon.up.s6" "$pkgdir/etc/s6-serv/available/rc/xdg-user-dirs-daemon/up"
	
	install -Dm 0644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/xdg-user-dirs-s6rcserv/LICENSE"
}
