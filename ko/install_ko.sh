VERSION=0.12.0
OS=Linux
ARCH=x86_64
ARCHIVE_KO="ko.tar.gz"

if [[ ! -f ./ko ]];then
    curl -sSfL "https://github.com/ko-build/ko/releases/download/v${VERSION}/ko_${VERSION}_${OS}_${ARCH}.tar.gz" > "$ARCHIVE_KO"
    tar --extract --file="$ARCHIVE_KO" ko
    chmod +x ./ko
    source <(./ko completion  "${SHELL##*/}" )

    rm "$ARCHIVE_KO"
    echo "installed ko"
    exit 0
else
    echo "ko is already installed"
    exit 1
fi
