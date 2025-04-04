-- +goose Up
BEGIN;

-- Генерация случайных записей в таблице
WITH random_data AS (
    SELECT 
        -- Случайный title из массива
        CASE 
            WHEN random() < 0.1 THEN 'Жим лёжа'
            WHEN random() < 0.2 THEN 'Приседания'
            WHEN random() < 0.3 THEN 'Тяга в наклоне'
            WHEN random() < 0.4 THEN 'Становая тяга'
            WHEN random() < 0.5 THEN 'Растяжка'
            WHEN random() < 0.6 THEN 'Подтягивания'
            WHEN random() < 0.7 THEN 'Отжимания'
            WHEN random() < 0.8 THEN 'Тренировка ног'
            WHEN random() < 0.9 THEN 'Тренировка спины'
            ELSE 'Тренировка грудных мышц'
        END AS title,
        -- Случайное описание
        CASE 
            WHEN random() < 0.1 THEN 'Упражнение для тренировки грудных мышц.'
            WHEN random() < 0.2 THEN 'Упражнение для тренировки ног.'
            WHEN random() < 0.3 THEN 'Упражнение для тренировки спины.'
            WHEN random() < 0.4 THEN 'Основное упражнение для тренировки всего тела.'
            WHEN random() < 0.5 THEN 'Завершающее упражнение для растяжки.'
            WHEN random() < 0.6 THEN 'Упражнение для тренировки силы верхней части тела.'
            WHEN random() < 0.7 THEN 'Упражнение для тренировки груди.'
            WHEN random() < 0.8 THEN 'Целевая тренировка для укрепления мышц ног.'
            WHEN random() < 0.9 THEN 'Тренировка для накачки спины.'
            ELSE 'Основное упражнение для тренировки грудных мышц.'
        END AS description,
        -- Случайный image_url
        CASE 
            WHEN random() < 0.1 THEN 'image_url_1'
            WHEN random() < 0.2 THEN 'image_url_2'
            WHEN random() < 0.3 THEN 'image_url_3'
            WHEN random() < 0.4 THEN 'image_url_4'
            WHEN random() < 0.5 THEN 'image_url_5'
            WHEN random() < 0.6 THEN 'image_url_6'
            WHEN random() < 0.7 THEN 'image_url_7'
            WHEN random() < 0.8 THEN 'image_url_8'
            WHEN random() < 0.9 THEN 'image_url_9'
            ELSE 'image_url_10'
        END AS image,
        -- Случайный video_url
        CASE 
            WHEN random() < 0.1 THEN 'video_url_1'
            WHEN random() < 0.2 THEN 'video_url_2'
            WHEN random() < 0.3 THEN 'video_url_3'
            WHEN random() < 0.4 THEN 'video_url_4'
            WHEN random() < 0.5 THEN 'video_url_5'
            WHEN random() < 0.6 THEN 'video_url_6'
            WHEN random() < 0.7 THEN 'video_url_7'
            WHEN random() < 0.8 THEN 'video_url_8'
            WHEN random() < 0.9 THEN 'video_url_9'
            ELSE 'video_url_10'
        END AS video_url,
        -- Случайный muscle_id от 1 до 5
        (FLOOR(random() * 5) + 1) AS muscle_id
    FROM generate_series(1, 100) -- генерируем 100 записей
)
-- Вставляем сгенерированные данные в таблицу
INSERT INTO trains (title, description, image, video_url, muscle_id)
SELECT title, description, image, video_url, muscle_id
FROM random_data;

COMMIT;
