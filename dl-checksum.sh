#!/usr/bin/env sh
DIR=~/Downloads
MIRROR=https://github.com/bitnami-labs/sealed-secrets/releases/download

# https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.17.3/kubeseal-0.17.3-linux-amd64.tar.gz

dl()
{
    local ver=$1
    local os=$2
    local arch=$3
    local archive_type=${4:-tar.gz}
    local platform="${os}-${arch}"
    local file="kubeseal-${ver}-${platform}.${archive_type}"
    local lfile=$DIR/$file
    local url=$MIRROR/v$ver/$file
    if [ ! -e $lfile ];
    then
        curl -sSLf -o $lfile $url
    fi
    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform $(sha256sum $lfile | awk '{print $1}')
}

dl_ver() {
    local ver=$1
    printf "  '%s':\n" $ver
    dl $ver darwin amd64
    dl $ver darwin arm64
    dl $ver linux amd64
    dl $ver linux arm
    dl $ver linux arm64
    dl $ver windows amd64
}

dl_ver ${1:-0.19.4}
