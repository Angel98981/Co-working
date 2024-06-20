CREATE TABLE rooms (
    room_id SERIAL PRIMARY KEY,
    room_name VARCHAR(100) NOT NULL,
    room_description TEXT,
    total_rows INTEGER NOT NULL,
    total_columns INTEGER NOT NULL
);


CREATE TABLE workspaces (
    workspace_id SERIAL PRIMARY KEY,
    room_id INTEGER NOT NULL,
    "row" INTEGER NOT NULL,
    "column" INTEGER NOT NULL,
    workspace_status VARCHAR(20) NOT NULL DEFAULT 'available',
    FOREIGN KEY (room_id) REFERENCES rooms(room_id)
);

CREATE TABLE "sessions" (
    session_id SERIAL PRIMARY KEY,
    start_time TIMESTAMP NOT NULL,
    duration INTERVAL NOT NULL,
    session_description TEXT NOT NULL
);
ALTER TABLE "sessions"
ADD COLUMN room_id INTEGER NOT NULL;

ALTER TABLE "sessions"
ADD CONSTRAINT fk_room
FOREIGN KEY (room_id)
REFERENCES rooms(room_id);

SELECT * from "sessions";
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    user_name VARCHAR(100) NOT NULL,
    user_email VARCHAR(100) NOT NULL,
    user_phone VARCHAR(20)
);

CREATE TABLE reservations (
    reservation_id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    workspace_id INTEGER NOT NULL,
    session_id INTEGER NOT NULL,
    reservation_status VARCHAR(20) NOT NULL DEFAULT 'active',
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (workspace_id) REFERENCES workspaces(workspace_id),
    FOREIGN KEY (session_id) REFERENCES "sessions"(session_id)
);

