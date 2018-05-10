LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional

appcompat_dir := $(LOCAL_PATH)/../../../prebuilts/sdk/current/support/v7/appcompat/res
cardview_dir +=$(LOCAL_PATH)/../../../frameworks/support/v7/cardview/res

LOCAL_STATIC_JAVA_LIBRARIES := android-support-v4
LOCAL_STATIC_JAVA_LIBRARIES += android-support-v7-appcompat
LOCAL_STATIC_JAVA_LIBRARIES += android-support-v7-recyclerview
LOCAL_STATIC_JAVA_LIBRARIES += android-support-v7-cardview
LOCAL_STATIC_JAVA_LIBRARIES += android-support-v13

LOCAL_SRC_FILES := $(call all-java-files-under, src) \
        $(call all-java-files-under, lib/PagerSlidingTabStrip/src) \
        $(call all-java-files-under, lib/FloatingActionButton/src) \
        $(call all-java-files-under, lib/NineOldAndroids/src)

LOCAL_RESOURCE_DIR := $(LOCAL_PATH)/lib/PagerSlidingTabStrip/res \
        $(LOCAL_PATH)/lib/FloatingActionButton/res \
        $(appcompat_dir) $(cardview_dir) $(LOCAL_PATH)/res

LOCAL_AAPT_FLAGS := --auto-add-overlay \
        --extra-packages android.support.v7.appcompat \
        --extra-packages android.support.v7.cardview

LOCAL_PACKAGE_NAME := OtoRecorder
LOCAL_CERTIFICATE := platform
LOCAL_PRIVILEGED_MODULE := true
LOCAL_OVERRIDES_PACKAGES := Music

include $(BUILD_PACKAGE)
include $(call all-makefiles-under,$(LOCAL_PATH))
