#!/bin/bash
# エラーが発生したら即終了
set -e

# サーバーのPIDファイルを削除
rm -f /app/tmp/pids/server.pid

# @ = dockerfileのCMD
exec "$@"