-- +goose Up
INSERT INTO muscles (title, image) VALUES 
    ('Biceps', 'biceps.jpg'),
    ('Triceps', 'triceps.jpg'),
    ('Deltoid', 'deltoid.jpg'),
    ('Pectoral', 'pectorals.jpg'),
    ('Abdominals', 'abs.jpg'),
    ('Quadriceps', 'quads.jpg'),
    ('Hamstrings', 'hamstrings.jpg'),
    ('Gluteus Maximus', 'glutes.jpg'),
    ('Latissimus Dorsi', 'lats.jpg'),
    ('Trapezius', 'traps.jpg');

INSERT INTO muscles (title, image)
SELECT 'Muscle_' || i, 'muscle_' || i || '.jpg'
FROM generate_series(11, 100) AS i;

-- +goose Down
DELETE FROM muscles WHERE title LIKE 'Muscle_%';
DELETE FROM muscles WHERE title IN 
    ('Biceps', 'Triceps', 'Deltoid', 'Pectoral', 'Abdominals', 
     'Quadriceps', 'Hamstrings', 'Gluteus Maximus', 'Latissimus Dorsi', 'Trapezius');
