#!/usr/bin/env bash
set -euo pipefail
VERSION=${1:-patch}
npm version $VERSION -m "Bump to %s"
git push --follow-tags
