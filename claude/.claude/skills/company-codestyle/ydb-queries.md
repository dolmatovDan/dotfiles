# Правила написания запросов на YQL
- Написание запросов
```sql
Всегда ставим запятую после каждого элемента, в том числе у последнего поля
SELECT
    id,
    name,
    likes,
FROM posts AS p
LIMIT 10;

В конце всех запросов надо ставить ;
DECLARE $user_id AS String;
DECLARE $post_id AS String;
DECLARE $created_at AS Timestamp;

SELECT
    id,
    name,
    likes,
FROM posts AS p
LIMIT 10;

UPSERT INTO UserLikes(user_id, post_id, created_at) VALUES ($user_id, $post_id, $created_at);
```

- Подзапросы пишем в переменную, а не подзапросом
```sql
$is_liked = EXISTS (
    SELECT true
    FROM UserLikes
    WHERE user_id = $user_id
        AND post_id = $post_id
);
```

- Если у ключевого слова больше одного аргумента, то обязательно разделяем их переносами строк, иначе непринципиально
```sql
SELECT user_id
FROM Users;

SELECT
	user_id
FROM Users;

SELECT
	user_id,
	some_column,
FROM Users;
```

- Равенство пишем одним =
```sql
SELECT
    id,
    name,
    likes,
FROM posts AS p
WHERE
    likes = 10
LIMIT 10;
```

- В запросах всегда используем CAPITAL LETTER для ключевые слов
```sql
select -> SELECT
as -> AS
from -> FROM
join -> JOIN
```

- Для типов данных и встроенных функций используем Pascal case
```sql
COALESCE -> Coalesce
RANDOMNUMBER -> RandomNumber
currentUTCTimestamp -> CurrentUTCTimestamp
INT64 -> Int64
string -> String
```

Для названия таблиц и названия полей не используем апострофы, если они явно не нужны
