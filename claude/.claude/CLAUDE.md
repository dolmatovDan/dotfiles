# CLAUDE.md

Этот файл предоставляет рекомендации для Claude Code (claude.ai/code) при работе с кодом в этом репозитории.

## Создание новых CLAUDE.md
- **Любыче CLAUDE.md составляй на русском языке**
- **В новой папке при создании CLAUDE.md для начала создавай папку .claude и туда уже добавляй CLAUDE.md**

## Поиск по кодовой базе
Никогда не далай `grep` из `~/arcadia/`, это очень долго. Основные директории (и все их поддиректории), из которых тебе надо будет делать `grep` вот:
```
~/arcadia/neuroexpert/
~/arcadia/neuro/go/
~/arcadia/yy/backend/libs/go/
```

Если ты видишь какой-нибудь `import` в коде и хочешь найти этот пакет, то это можно легко сделать следующим образом. Допустим есть такой импорт:
```go
import "a.yandex-team.ru/library/go/yandex/solomon/reporters/puller/httppuller"
```
Тогда сам пакет лежит в директории: `~/arcadia/library/go/yandex/solomon/reporters/puller/httppuller/`, то есть просто `a.yandex-team.ru` надо заменить на `~/arcadia/`
