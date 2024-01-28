#!/usr/bin/bash

function warn() {
    printf "\033[33m%s\033[0m\n" "$*"
}

function die() {
    printf "\033[31m%s\033[0m\n" "$*"
    exit 1
}

PACKAGE="package.tar.gz"

cd "desktopthemes" || die "Failed before install plasma theme"

kpackagetool5 -r "$PACKAGE" 2> /dev/null || warn "Failed to remove: Plasma Theme"

cd "../look-and-feel" || die "Failed before install"

kpackagetool5 -r "$PACKAGE" 2> /dev/null || warn "Failed to remove: Global Theme(Look and Feel)"

if [[ "${LANG%%.*}" == "zh_CN" ]] || [[ "$LANGUAGE" == "zh_CN" ]]; then
    warn "你可能需要从系统设置(systemsettings5程序)中手动删除以下主题依赖："
    warn "  - 外观 > 颜色 > Nord Dark"
    warn "  - 外观 > 窗口装饰元素 > Nordic"
    warn "  - 外观 > 图标 > Zafiro-Nord-Black-Blue"
    warn "  - 外观 > 光标 > Nordic-cursors"
else
    warn "You may have to removee dependences manually from KDE system setting(call systemsettings5):"
    warn "  - Appearance > Colors > Nord Dark"
    warn "  - Appearance > Window Decorations > Nordic"
    warn "  - Appearance > Icons > Zafiro-Nord-Black-Blue"
    warn "  - Appearance > Cursors > Nordic-cursors"
fi
