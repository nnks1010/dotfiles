all: update

update:
	git pull origin master
	bash ./bin/hoge.sh
