# Как собрать образ Superset.
1. Добавляем в файл /superset-build-image/superset/superset-frontend/package.json строчки:
```
"@название/плагина": "^версия"
```
2. В директории /superset-build-image/superset/superset-frontend для обновления файла package-lock.json запускаем команду:
```
npm install --package-lock-only
```
3. В файл /superset-build-image/superset/superset-frontend/src/visualizations/presets/MainPreset.js нужно внести строчки:
```
import { НазваниеПлагина } from '@название/плагина';
```
```
new НазваниеПлагина().configure({
  key: 'название-плагина',
}),
```
4. Запускаем сборку образа командой:
```
bash ./createImage.sh
```
