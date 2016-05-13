test: bin/test.swf
	adl test/Main-app.xml bin

#external:
#	mkdir -p external
#	git clone --depth 1 git@github.com:Fovea/foveas3-types.git external/types
#	git clone --depth 1 git@github.com:j3k0/fxp-as3.git external/fxp

bin/test.swf:
	./build | ./toVimError | tee build-output.txt
	if grep -q Error build-output.txt; then false; else true; fi

asdoc:
	asdoc -doc-sources src/

clean:
	rm -fr bin external
