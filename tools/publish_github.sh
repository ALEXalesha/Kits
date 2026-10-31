#!/usr/bin/env bash
# Публикация на GitHub (адрес - REPO в tools/publish.conf):
#   bash tools/publish_github.sh            # только код
#   DRY_RUN=1 bash tools/publish_github.sh  # собрать и проверить, ничего не отправлять
# Тонкая обёртка над общим скриптом AiGames/PythonAiGames/tools/publish_game.sh (чистит личное по всей истории).
# Если общий скрипт лежит не там, путь к нему - в переменной PUBLISH_GAME.
set -euo pipefail
GAME="$(cd "$(dirname "$0")/.." && pwd)"
COMMON="${PUBLISH_GAME:-$GAME/../AiGames/PythonAiGames/tools/publish_game.sh}"
[ -f "$COMMON" ] || { echo "нет общего скрипта $COMMON - задайте PUBLISH_GAME" >&2; exit 1; }
exec bash "$COMMON" "$GAME" "$@"
