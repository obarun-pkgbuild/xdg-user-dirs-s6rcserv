# Makefile for base-s6rcserv

VERSION = $$(git describe --tags| sed 's/-.*//g;s/^v//;')
PKGNAME = base-s6rcserv

BINDIR_EXECLINE = /usr/local/bin
BINDIR = /usr/bin

bundle = $$(find bundle-* -type f)
prepare = $$(find *-prepare -type f)
oneshot = $$(find *-oneshot -type f)
longrun = $$(find *-longrun -type f)
log = $$(find *-log -type f)

bundle_user = $$(find user/rc bundle-* -mindepth 2 -type f)
prepare_user = $$(find user/rc *-prepare -mindepth 2 -type f)
oneshot_user = $$(find user/rc *-oneshot -mindepth 2 -type f)
longrun_user = $$(find user/rc *-longrun -mindepth 2 -type f)
log_user = $$(find user/rc *-log -mindepth 2 -type f)

FILES = $$(find base-* user -maxdepth 3 -type f)

LOGD = $$(find -maxdepth 2 -type f -name logd)
LOGD_USER = $$(find user/rc -maxdepth 2 -type f -name logd)


install: 
	
	for i in $(FILES); do \
		sed -i 's,@BINDIR_EXECLINE@,$(BINDIR_EXECLINE),' $$i; \
		sed -i 's,@BINDIR@,$(BINDIR),' $$i; \
	done 
	if [[ -n $(LOGD) ]]; then \
		install -Dm 0644 $(LOGD) $(DESTDIR)/etc/s6-serv/log.d/base-rc; \
	fi
	if [[ -n $(LOGD_USER) ]]; then \
		install -Dm 0644 $(LOGD_USER) $(DESTDIR)/etc/s6-serv/log.d/user/base-rc; \
	fi
	
	if $$(find -name base -type d); then \
		for i in $(bundle) $(prepare) $(oneshot) $(longrun) $(log);do \
			install -Dm 0644 $$i $(DESTDIR)/etc/s6-serv/available/rc/$$i; \
		done \
	fi
	
	if [[ -d user ]]; then \
		for i in $(bundle_user) $(prepare_user) $(oneshot_user) $(longrun_user) $(log_user);do \
			install -Dm 0644 $$i $(DESTDIR)/etc/s6-serv/available/$$i; \
		done \
	fi
	
	if [[ -n $(LOGD) ]]; then \
		rm $(DESTDIR)/etc/s6-serv/available/rc/$(LOGD); \
	fi
	if [[ -n $(LOGD_USER) ]]; then \
		rm $(DESTDIR)/etc/s6-serv/available/$(LOGD_USER); \
	fi
	
	install -Dm644 LICENSE $(DESTDIR)/usr/share/licenses/$(PKGNAME)/LICENSE

version:
	@echo $(VERSION)
	
.PHONY: install version 
