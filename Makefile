ARCHS = arm64 arm64e
INSTALL_TARGET_PROCESSES = SpringBoard


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = CleanUp

CleanUp_FILES = Tweak.x
CleanUp_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
