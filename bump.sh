#!/bin/sh
# 사용법: ./bump.sh 2026.11.25-1   (새 버전 이름)
# index.html, sw.js, version.json의 버전을 한 번에 바꿉니다. 그 뒤 커밋·푸시하면 설치된 앱에 "업데이트" 버튼이 뜹니다.
set -e
V="$1"; [ -z "$V" ] && { echo "버전을 적어 주세요. 예: ./bump.sh 2026.11.25-1"; exit 1; }
sed -i.bak "s/^const APP_VERSION = '[^']*';/const APP_VERSION = '$V';/" index.html
sed -i.bak "s/^const VERSION = '[^']*';/const VERSION = 'promo-$V';/" sw.js
printf '{ "version": "%s" }\n' "$V" > version.json
rm -f index.html.bak sw.js.bak
echo "버전을 $V 로 바꿨어요."
