# Longrich Aqtobe 04

Статический сайт-каталог (HTML + Supabase) с заявкой в WhatsApp.

## Структура
- `public/` — сайт (то, что публикуется): `index.html`, `config.js`, картинки
- `supabase/schema.sql` — схема БД, RLS-политики и 42 товара
- `render.yaml` — настройки деплоя на Render (static, папка `public`)

## Этапы запуска
1. GitHub — репозиторий и первый коммит (этот шаг)
2. Supabase — проект, запуск `schema.sql`, вход администратора
3. `public/config.js` — вставить Project URL и anon key
4. Render — деплой из GitHub
5. Домен, WhatsApp-номер, проверка заказов

> В `config.js` можно хранить только публичный `anon` ключ. Ключ `service_role` в репозиторий не добавлять никогда.

## Обновление v3 (казахский + полные карточки)
1. Supabase → SQL Editor → вставить `supabase/migration_v3.sql` → Run (один раз).
2. Залить папку `public/` (теперь там `catalog.js` и `img/` с фото) на GitHub → Render задеплоит сам.
3. Сайт открывается на казахском, кнопки ҚАЗ/РУС сверху. Админка: `ваш-сайт/#admin` → ✏️ у товара: тексты на двух языках, фото (загрузка/удаление).
