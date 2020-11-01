#!/usr/bin/env sh
DIR=~/Downloads
MIRROR=https://github.com/bitnami-labs/sealed-secrets/releases/download

dl()
{
    local ver=$1
    local os=$2
    local arch=$3
    local suffix=${4:-}
    local platform="${os}-${arch}"
    local file=kubeseal-${platform}${suffix}
    local lfile=$DIR/kubeseal-${platform}-${ver}${suffix}
    local url=$MIRROR/$ver/$file
    if [ ! -e $lfile ];
    then
           wget -q -O $lfile $url
    fi
    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform $(sha256sum $lfile | awk '{print $1}')
}

dl_ver() {
    local ver=$1
    printf "  %s:\n" $ver
    dl $ver linux amd64
    dl $ver darwin amd64
}

dl_ver ${1:-v0.13.1}
