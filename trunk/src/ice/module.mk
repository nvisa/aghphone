local_dir := ice
local_src := $(wildcard $(local_dir)/*.cpp)
local_objs := $(subst .cpp,.o,$(local_src))
sources += $(local_src)
extra_clean += $(local_dir)/iface.cpp $(local_dir)/iface.h $(local_dir)/iface.o $(local_dir)/common.cpp $(local_dir)/common.h $(local_dir)/common.o

ice/iface.cpp: ice/iface.ice ice/icecommon.cpp
		$(ECHO_ICE)
		cd ice && $(SLICE) $(<F)

ice/icecommon.cpp: ice/icecommon.ice
		$(ECHO_ICE)
		cd ice && $(SLICE) $(<F)