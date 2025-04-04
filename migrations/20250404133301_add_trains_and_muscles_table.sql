-- +goose Up
-- +goose StatementBegin
CREATE TABLE IF NOT EXISTS muscles (
    id SERIAL PRIMARY KEY,
    title VARCHAR UNIQUE NOT NULL,
    image VARCHAR NOT NULL
);

CREATE TABLE IF NOT EXISTS trains (
    id SERIAL PRIMARY KEY,
    title VARCHAR UNIQUE NOT NULL,
    description VARCHAR NOT NULL,
    image VARCHAR,
    video_url VARCHAR,
    difficult INT,
    duration_time INT,
    lead_muscle_id INT NOT NULL
);
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP TABLE muscles;
DROP TABLE trains;
-- +goose StatementEnd
