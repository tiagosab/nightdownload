VERSION=0.0.1

tarball:
	tar -czf build/nightdownload-$(VERSION).tar.gz \
		--transform 's,^\./,nightdownload-$(VERSION)/,' \
		--exclude='*~' --exclude='build'\
		--exclude-backups .

install:
	cp crontab /etc/cron.d/nightdownload
	cp nightdownload.sh /usr/bin/nightdownload.sh
	-mkdir /etc/nightdownload.d
	cp scripts/* /etc/nightdownload.d/
