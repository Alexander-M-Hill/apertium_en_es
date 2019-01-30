all : es-en.automorf.bin \
      es-en.autogen.bin \
      es-en.autobil.bin \
      es-en.t1x.bin \
      en-es.automorf.bin \
      en-es.autogen.bin \
      en-es.autobil.bin

es-en.automorf.bin : apertium-es.es.dix
	lt-comp lr apertium-es.es.dix es-en.automorf.bin

es-en.autogen.bin : apertium-en.en.dix
	lt-comp rl apertium-en.en.dix es-en.autogen.bin

en-es.automorf.bin : apertium-en.en.dix
	lt-comp lr apertium-en.en.dix en-es.automorf.bin

en-es.autogen.bin : apertium-es.es.dix
	lt-comp rl apertium-es.es.dix en-es.autogen.bin

es-en.autobil.bin : apertium-es-en.es-en.dix
	lt-comp lr apertium-es-en.es-en.dix es-en.autobil.bin

en-es.autobil.bin : apertium-es-en.es-en.dix
	lt-comp rl apertium-es-en.es-en.dix en-es.autobil.bin

es-en.t1x.bin : apertium-es-en.es-en.t1x
	apertium-preprocess-transfer apertium-es-en.es-en.t1x es-en.t1x.bin

.PHONY : clean
clean :
	-rm *.bin
