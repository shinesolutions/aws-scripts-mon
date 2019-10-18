version ?= 1.2.2000-pre.0

ci: clean stage package

clean:
	rm -rf stage/

stage:
	mkdir -p stage

package: clean stage
	zip \
	  -r stage/shinesolutions-aws-scripts-mon-$(version).zip . \
    -x "*.DS_Store" \
    -x "*bin*" \
    -x "*stage*" \
    -x "*.idea*" \
    -x "*.git*" \
		-x "*.lock*" \
    -x "*.rtk.json*" \
    -x ".*.yml" \
		-x "Makefile"

release:
	rtk release

.PHONY: ci clean stage package release
