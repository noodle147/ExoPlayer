#
# Copyright (C) 2016 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

WORKING_DIR := $(call my-dir)
include $(CLEAR_VARS)
LIBVPX_ROOT := $(WORKING_DIR)/libvpx

# build libvpx.so
LOCAL_PATH := $(WORKING_DIR)
include $(LOCAL_PATH)/libvpx.mk

# build libvpxV2JNI.so
include $(CLEAR_VARS)
LOCAL_PATH := $(WORKING_DIR)
LOCAL_MODULE := libvpxV2JNI
LOCAL_ARM_MODE := arm
LOCAL_CPP_EXTENSION := .cc
LOCAL_SRC_FILES := vpx_jni.cc


# #libyuv
LOCAL_C_INCLUDES +=$(LOCAL_PATH)/libvpx/third_party/libyuv/include
LOCAL_SRC_FILES +=  $(LOCAL_PATH)/libvpx/third_party/libyuv/source/cpu_id.cc \
                $(LOCAL_PATH)/libvpx/third_party/libyuv/source/planar_functions.cc \
                $(LOCAL_PATH)/libvpx/third_party/libyuv/source/row_any.cc \
                $(LOCAL_PATH)/libvpx/third_party/libyuv/source/row_common.cc \
                $(LOCAL_PATH)/libvpx/third_party/libyuv/source/row_gcc.cc \
                $(LOCAL_PATH)/libvpx/third_party/libyuv/source/row_msa.cc \
                $(LOCAL_PATH)/libvpx/third_party/libyuv/source/row_neon.cc \
                $(LOCAL_PATH)/libvpx/third_party/libyuv/source/row_neon64.cc \
                $(LOCAL_PATH)/libvpx/third_party/libyuv/source/row_win.cc \
                $(LOCAL_PATH)/libvpx/third_party/libyuv/source/scale.cc \
                $(LOCAL_PATH)/libvpx/third_party/libyuv/source/scale_any.cc \
                $(LOCAL_PATH)/libvpx/third_party/libyuv/source/scale_common.cc \
                $(LOCAL_PATH)/libvpx/third_party/libyuv/source/scale_gcc.cc \
                $(LOCAL_PATH)/libvpx/third_party/libyuv/source/scale_msa.cc \
                $(LOCAL_PATH)/libvpx/third_party/libyuv/source/scale_neon.cc \
                $(LOCAL_PATH)/libvpx/third_party/libyuv/source/scale_neon64.cc \
                $(LOCAL_PATH)/libvpx/third_party/libyuv/source/scale_win.cc \
                $(LOCAL_PATH)/libvpx/third_party/libyuv/source/convert_from_argb.cc \
                $(LOCAL_PATH)/libvpx/third_party/libyuv/source/convert.cc \
                $(LOCAL_PATH)/libvpx/third_party/libyuv/source/convert_from.cc \
                $(LOCAL_PATH)/libvpx/third_party/libyuv/source/convert_argb.cc \
                 $(LOCAL_PATH)/libvpx/third_party/libyuv/source/video_common.cc \


LOCAL_LDLIBS := -llog -lz -lm -landroid
LOCAL_SHARED_LIBRARIES := libvpx
LOCAL_STATIC_LIBRARIES := cpufeatures
include $(BUILD_SHARED_LIBRARY)

$(call import-module,android/cpufeatures)
