#!/usr/bin/bash
#
# CDDL HEADER START
#
# The contents of this file are subject to the terms of the
# Common Development and Distribution License, Version 1.0 only
# (the "License").  You may not use this file except in compliance
# with the License.
#
# You can obtain a copy of the license at usr/src/OPENSOLARIS.LICENSE
# or http://www.opensolaris.org/os/licensing.
# See the License for the specific language governing permissions
# and limitations under the License.
#
# When distributing Covered Code, include this CDDL HEADER in each
# file and include the License file at usr/src/OPENSOLARIS.LICENSE.
# If applicable, add the following below this CDDL HEADER, with the
# fields enclosed by brackets "[]" replaced with your own identifying
# information: Portions Copyright [yyyy] [name of copyright owner]
#
# CDDL HEADER END
#
#
# Copyright 2011-2012 OmniTI Computer Consulting, Inc.  All rights reserved.
# Use is subject to license terms.
#
# Load support functions
. ../../lib/functions.sh

PROG=rubygems      # App name
VER=1.8.21            # App version
VERHUMAN=$VER   # Human-readable version
#PVER=          # Branch (set in config.sh, override here if needed)
PKG=omniti/developer/ruby/ruby-gems            # Package name (e.g. library/foo)
SUMMARY="Ruby Gems"      # One-liner, must be filled in
DESC="Ruby Gems ($VER) only really needed for ruby-18 since ruby-19 has gem build in"         # Longer description, must be filled in

BUILD_DEPENDS_IPS="runtime/ruby-18"
RUBY=/opt/omni/bin/ruby

build() {
    pushd $TMPDIR/$BUILDDIR > /dev/null
    logmsg "Building gems"
    $RUBY setup.rb -V --no-rdoc --prefix=$DESTDIR/$PREFIX --destdir=$DESTDIR/$PREFIX/lib/ruby/vendor_ruby/1.8/rubygems
    popd > /dev/null
}

init
download_source ruby $PROG $VER
patch_source
prep_build
build
#make_isa_stub
make_package
clean_up

# Vim hints
# vim:ts=4:sw=4:et: