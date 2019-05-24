ARCH=$(shell sysinfo)

all:  module install

install:
	mkdir -p ../../modules/$(ARCH)
	cp $(ARCH)/modulefact.mdm ../../modules/$(ARCH)/modulefact.mdm

module:  $(ARCH)/modulefact.mdm

$(ARCH):
	mkdir -p $(ARCH)

$(ARCH)/modulefact.mdm:  $(ARCH)
	mmg -batch -novcrun -op $(ARCH) -I. modulefact.cpp

# the module depends on its cpp source file
$(ARCH)/modulefact.mdm: modulefact.cpp

archclean:
	rm -rf $(ARCH)

clean:
	rm -rf linux linux64 Darwin Darwini386 win32
