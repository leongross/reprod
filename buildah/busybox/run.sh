#!/bin/sh

ctr=$(buildah from busybox@sha256:400ee2ed939df769d4681023810d2e4fb9479b8401d97003c710d0e20f7c49c6)

mnt=$(buildah mount "$ctr")
cp script.sh "$mnt"
touch --date=@0 "$mnt/script.sh"
buildah umount "$ctr"

buildah config --entrypoint '["/script.sh"]' --cmd '' "$ctr"

#buildah commit --omit-timestamp "$ctr"
#buildah commit --omit-timestamp --omit-history "$ctr"
buildah commit --timestamp 0 --omit-history "$ctr"
buildah rm "$ctr"
