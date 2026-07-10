# Zip Naming
KNAME ?= Zorix-v1.0
CODENAME ?= haydn
CODENAME_1 ?= lisa
DATE ?= $(shell date "+%H%M")

ZIP := $(KNAME)-$(CODENAME)-$(DATE)
ZIP_1 := $(KNAME)-$(CODENAME_1)-$(DATE)

EXCLUDE := Makefile *.git* *.jar* *placeholder* *.md* LICENSE FUNDING.yml releasekey*

# Zipping
zip-haydn: $(ZIP)
$(ZIP):
	@echo "Creating ZIP: $(ZIP)-signed.zip"
	@zip -r9 "$@.zip" . -q -x $(EXCLUDE)
	@echo "Signing zip with aosp keys..."
	@java -jar *.jar* releasekey.x509.pem releasekey.pk8 "$@.zip" "$@-signed.zip"
	@echo "Done!"

zip-lisa: $(ZIP_1)
$(ZIP_1):
	@echo "Creating ZIP: $(ZIP_1)-signed.zip"
	@zip -r9 "$@.zip" . -q -x $(EXCLUDE)
	@echo "Signing zip with aosp keys..."
	@java -jar *.jar* releasekey.x509.pem releasekey.pk8 "$@.zip" "$@-signed.zip"
	@echo "Done!"

# Cleaning
clean:
	@rm -rf dtbo.img
	@rm -rf *dtb*
	@rm -rf Image
	@rm -rf *.zip*
	@echo "Cleaned Up."
