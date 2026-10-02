-- Карточки товаров: описание, характеристики, фото. Запустить в SQL Editor целиком.
alter table public.products add column if not exists description text not null default '';
alter table public.products add column if not exists details text not null default '';
alter table public.products add column if not exists photos text[] not null default '{}';

insert into public.admins (email) values ('altairrutyashev@bk.ru') on conflict do nothing;

insert into storage.buckets (id, name, public) values ('product-photos','product-photos',true) on conflict (id) do nothing;
drop policy if exists "photos read" on storage.objects;
drop policy if exists "photos admin" on storage.objects;
create policy "photos read" on storage.objects for select using (bucket_id='product-photos');
create policy "photos admin" on storage.objects for all to authenticated
  using (bucket_id='product-photos' and public.is_admin()) with check (bucket_id='product-photos' and public.is_admin());

-- Начальные описания из каталога (остальные заполняются в админке через ✏️)
update public.products set description='Натуральная добавка на основе масла ягод облепихи с витаминами A, C, E и жирными кислотами Омега-3, 6, 7, 9. Для поддержки иммунитета и здоровья кожи.', details=E'Форма: мягкие капсулы, 500 мг × 120 шт\nСостав: масло ягод облепихи, Омега-3/6/7/9, витамины A, C, E, каротиноиды\nПрименение: по 1–2 капсулы 2 раза в день во время еды, запивая водой' where name ilike '%облепих%';
update public.products set description='Растворимый кофе с экстрактом кордицепса милитарис. Мягкий вкус, удобные саше для ежедневного использования.', details=E'Формат: 10 саше × 18 г\nСостав: экстракт Cordyceps Militaris, комплекс аминокислот, витамины E, B1, B2, B12\nПрименение: 1 саше на 150–200 мл горячей воды, 1–2 раза в день\nНе рекомендуется беременным и кормящим' where name ilike '%кофе%кордицепс%';
update public.products set description='Порошок из зародышей сои с кальцием и натуральными пребиотиками. Поддерживает пищеварение и микрофлору кишечника.', details=E'Формат: 10 стиков × 20 г\nСостав: экстракт зародышей сои, кальций, пребиотики, витамины\nБез ГМО' where name ilike '%пребиотик%';
update public.products set description='Пробиотический комплекс с живыми лактобактериями для поддержки баланса кишечной микрофлоры. Подходит взрослым и детям.', details=E'Формат: 20 пакетиков × 2 г\nПрименение: содержимое пакетика можно принимать напрямую или растворить в тёплой воде' where name ilike '%пробиотик%';
update public.products set description='Пищевая добавка с экстрактом кордицепса милитарис для поддержки иммунитета, тонуса и общего самочувствия.', details=E'Формат: 60 капсул\nСостав: экстракт Cordyceps Militaris, полисахариды, аминокислоты\nПрименение: по 1–2 капсулы 1–2 раза в день после еды' where name ilike '%кордицепс%' and name ilike '%капсул%';
update public.products set description='Хондроитин сульфат и глюкозамин с экстрактами имбиря и зелёного чая — для поддержки суставов и хрящевой ткани.', details=E'Форма: таблетки, 700 мг × 60 шт\nПрименение: 1–2 таблетки в день во время или после еды\nРекомендуемый курс: не менее 1 месяца' where name ilike '%глюкозамин%';
update public.products set description='Увлажняющий крем с лошадиным жиром для ухода за кожей лица, рук и тела. Лёгкая текстура, быстро впитывается.', details=E'Объём: 500 г\nПрименение: нанести на чистую сухую кожу массажными движениями\nТолько для наружного применения' where name ilike '%крем%лошад%';
update public.products set description='Крем со змеиным жиром для интенсивного питания и защиты кожи. Смягчает сухую и огрубевшую кожу.', details=E'Объём: 500 г\nПрименение: нанести на чистую сухую кожу массажными движениями\nТолько для наружного применения' where name ilike '%крем%змеин%';
update public.products set description='Эссенция с гиалуроновой кислотой для увлажнения и мягкости кожи лица и шеи.', details=E'Объём: 220 мл\nПрименение: несколько капель на очищенную кожу утром и вечером' where name ilike '%гиалурон%';
update public.products set description='Концентрированный травяной гель для душа с экстрактами зелёного чая, алоэ вера и солодки. Без мыла, не стягивает кожу.', details=E'Объём: 300 мл\nСостав: экстракт зелёного чая, алоэ вера, солодки, ментол, витамины' where name ilike '%травяной%гель%';
