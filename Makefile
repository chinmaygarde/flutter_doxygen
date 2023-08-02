doxygen: checkout
	cd build/engine; doxygen

checkout: clean
	git clone --depth=1 https://github.com/flutter/engine build/engine
	git clone --depth=1 https://github.com/google/skia build/engine/third_party/skia
	git clone --depth=1 https://github.com/dart-lang/sdk build/engine/third_party/dart-lang/sdk
	rm build/engine/Doxyfile
	cp Doxyfile build/engine/

clean:
	rm -rf build/
