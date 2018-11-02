tar:
	rm ./oh_my_vim.tar.gz -rf && \
	cd ../ && \
	tar --exclude=*.log* \
	--exclude=.git \
	--exclude=.cache \
	-czvf ./oh_my_vim.tar.gz \
	./.vim && \
	mv ./oh_my_vim.tar.gz ./.vim
install:
	sh ./install.sh