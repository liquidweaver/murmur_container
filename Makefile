.PHONY : build run logs
build:
	sudo docker build -t liquidweaver/murmur .
run:
	sudo docker run --restart=always --name="murmur" -d -p 64738:64738 -p 64738:64738/udp -v /data/murmur:/data liquidweaver/murmur
	echo "Data is at /data/murmur. run \"make logs\" for SuperUser password."
logs:
	sudo docker logs murmur
