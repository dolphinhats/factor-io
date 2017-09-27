FILES=info.json
VERSIONNUMBER=0.0.1
VERSION=$(VERSIONNUMBER)-$(date "+%Y-%m-%d-%H.%M")

#name of the output file
ZIPNAME=factor-io-build-$(VERSION).zip

#zip command
ZIPCOMMAND=7z a $(ZIPNAME) $(FILES)

build: clean info.json data.lua
	echo "Nothing to do!"

#builds and creates the zip
zip: build
	$(ZIPCOMMAND)

info.json:
	echo -e "{\n\
\t\"name\": \"factor-io\",\n\
\t\"version\": \"$(VERSIONNUMBER)\",\n\
\t\"title\": \"Factor-io\",\n\
\t\"author\": \"dolphinhats\",\n\
\t\"contact\": \"\",\n\
\t\"homepage\": \"https://github.com/dolphinhats/factor-io\",\n\
\t\"factorio_version\": \"0.15\",\n\
\t\"dependencies\": [\"base >= 0.15\"],\n\
\t\"description\": \"Adds hooks to the API for Java\"\n\
}" > info.json

data.lua:
	echo -e "--data.lua\n\n\require(\"prototypes.item\")" > data.lua

clean:
	rm -f info.json data.lua
