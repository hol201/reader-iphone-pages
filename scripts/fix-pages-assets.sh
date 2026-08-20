#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
rm -rf expo
mkdir -p expo
cp -R _expo/static expo/
find . -type f -name '*.html' -print0 | xargs -0 sed -i 's#/_expo/#/expo/#g; s#href="_expo/#href="expo/#g; s#src="_expo/#src="expo/#g'
# Make the browser revalidate the entry HTML while preserving the current public path.
find . -type f -name '*.html' -print0 | xargs -0 sed -i 's#<head>#<head><meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate"><meta name="build-revision" content="pages-assets-v2">#'
