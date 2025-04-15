#!/usr/bin/env sh
set -e
DIR=~/Downloads
MIRROR=https://julialang-s3.julialang.org/bin

# https://julialang-s3.julialang.org/bin/linux/x64/1.4/julia-1.4.1-linux-x86_64.tar.gz
# https://julialang-s3.julialang.org/bin/linux/x86/1.4/julia-1.4.1-linux-i686.tar.gz
# https://julialang-s3.julialang.org/bin/linux/aarch64/1.4/julia-1.4.1-linux-aarch64.tar.gz
# https://julialang-s3.julialang.org/bin/freebsd/x64/1.4/julia-1.4.1-freebsd-x86_64.tar.gz

dl () {
    local major_ver=$1
    local minor_ver=$2
    local patch_ver=$3
    local os=$4
    local larch=$5
    local rarch=$6
    local platform="${os}-${rarch}"
    local file="julia-${major_ver}.${minor_ver}.${patch_ver}-${platform}.tar.gz"
    local url="${MIRROR}/${os}/${larch}/${major_ver}.${minor_ver}/${file}"
    local lfile=$DIR/$file
    if [ ! -e $lfile ];
    then
        curl -sSLf -o $lfile $url
    fi

    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform $(sha256sum $lfile | awk '{print $1}')
}

dl_ver () {
    local major_ver=$1
    local minor_ver=$2
    local patch_ver=$3

    printf "  '%s.%s.%s':\n" $major_ver $minor_ver $patch_ver
#    dl $major_ver $minor_ver $patch_ver musl x64 x86_64
    dl $major_ver $minor_ver $patch_ver linux x64 x86_64
    dl $major_ver $minor_ver $patch_ver linux x86 i686
    dl $major_ver $minor_ver $patch_ver linux aarch64 aarch64
    dl $major_ver $minor_ver $patch_ver freebsd x64 x86_64
}

dl_ver 1 11 4
