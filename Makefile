all: cflinuxfs2.tar.gz


cflinuxfs2.cid: cflinuxfs2/Dockerfile
	docker build --no-cache -t cloudfoundry/cflinuxfs2 cflinuxfs2
	docker run --cidfile=cflinuxfs2.cid cloudfoundry/cflinuxfs2 dpkg -l | tee cflinuxfs2/cflinuxfs2_dpkg_l.out

tmp/cflinuxfs2.tar: cflinuxfs2.cid
	mkdir -p tmp
	docker export `cat cflinuxfs2.cid` > $@
	# Always remove the cid file in order to grab updated package versions.
	rm cflinuxfs2.cid

cflinuxfs2.tar.gz: tmp/cflinuxfs2.tar
	./bin/make_tarball.sh cflinuxfs2
