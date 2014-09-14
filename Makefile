.PHONY : build run logs
build:
	sudo docker build -t liquidweaver/murmur .
run:
	sudo docker run --name="murmur" -d -p 64738:64738 -v /data/murmur:/data liquidweaver/murmur
	echo "Data is at /data/murmur. run \"make logs\" for SuperUser password."
logs:
	sudo docker logs murmur
