# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit multilib-build

DESCRIPTION="Virtual for OpenCL implementations"
SLOT="0"
KEYWORDS="amd64 x86"
CARDS=( amdgpu i965 nvidia )
IUSE="${CARDS[@]/#/video_cards_}"

# amdgpu-pro-opencl and intel-ocl-sdk are amd64-only
RDEPEND="app-eselect/eselect-opencl
dev-libs/amdgpu-pro-opencl"
