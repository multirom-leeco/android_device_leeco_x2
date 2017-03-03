#
# Copyright (C) 2017 The OmniRom Project
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
# Made By rishabhrao

ifeq ($(MR_REC_BUILD_NUMBER_FILE),)
MR_REC_BUILD_NUMBER_FILE := "$(dir $(lastword $(MAKEFILE_LIST)))MR_REC_BUILD_NUMBER-$(TARGET_DEVICE).TXT"
endif

cmd_put_out      := printf "%s-%02d" $$build_date $$build_num >$(MR_REC_BUILD_NUMBER_FILE);
cmd_get_out      := build_str=`cat $(MR_REC_BUILD_NUMBER_FILE)`; build_date=$${build_str:0:8}; build_num=$${build_str:9:2};
cmd_reset_ver    := echo -ne "\nMR_REC_VERSION.mk: New date, reset build number to 01\n\n" 1>&2; build_date=`date -u +%Y%m%d`; build_num=1;
cmd_incr_num     := build_num=$$(( 10\#$$build_num + 1 )); if [ $$build_num -gt 99 ]; then echo -ne "\nMR_REC_VERSION.mk: ERROR: Build number will exceed 99 resetting to 01\n\n" 1>&2; build_num=1; fi;
cmd_is_new_date  := `date -u +%Y%m%d` -gt $$build_date
cmd_get_TWRP_ver := `grep -azA1 ro.twrp.version $(ANDROID_PRODUCT_OUT)/recovery/root/sbin/recovery | grep -avz ro.twrp.version | head -c -1`

cmd_pre_run  := if [ ! -f $(MR_REC_BUILD_NUMBER_FILE) ]; then
cmd_pre_run  += 	echo "MR_REC_VERSION.mk: Create MultiROM Recovery build number file" 1>&2;
cmd_pre_run  += 	$(cmd_reset_ver)
cmd_pre_run  += 	$(cmd_put_out)
cmd_pre_run  += else
cmd_pre_run  += 	$(cmd_get_out)
cmd_pre_run  += 	if [ $(cmd_is_new_date) ]; then
cmd_pre_run  += 		$(cmd_reset_ver)
cmd_pre_run  += 		$(cmd_put_out)
cmd_pre_run  += 	fi;
cmd_pre_run  += fi;

cmd_post_run := $(cmd_get_out)
cmd_post_run += if [ $(cmd_is_new_date) ]; then
cmd_post_run += 	$(cmd_reset_ver)
cmd_post_run += else
cmd_post_run += 	$(cmd_incr_num)
cmd_post_run += fi;
cmd_post_run += $(cmd_put_out)

cmd_ren_rec_img := echo -ne "\n\nMR_REC_VERSION.mk: Rename output file " 1>&2;
cmd_ren_rec_img += mv -v
cmd_ren_rec_img +=  "$(ANDROID_PRODUCT_OUT)/recovery.img"
cmd_ren_rec_img +=  "$(ANDROID_PRODUCT_OUT)/mr-twrp-recovery-`cat $(MR_REC_BUILD_NUMBER_FILE)`-STABLE8.img"
cmd_ren_rec_img +=  1>&2;

$(shell $(cmd_pre_run))

$(shell echo "MR_REC_VERSION.mk: MultiROM Recovery build number=`cat $(MR_REC_BUILD_NUMBER_FILE)`" 1>&2)

recoveryimage:
	$(shell $(cmd_ren_rec_img))
	$(shell $(cmd_post_run))
	$(shell echo "MR_REC_VERSION.mk: Increase MultiROM Recovery build number to `cat $(MR_REC_BUILD_NUMBER_FILE)` for next build" 1>&2)

MR_REC_VERSION := $(shell cat $(MR_REC_BUILD_NUMBER_FILE))
