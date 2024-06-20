
-- Poblar la tabla rooms con 100 registros
DO $$
BEGIN
    FOR i IN 1..100 LOOP
        INSERT INTO rooms (room_name, room_description, total_rows, total_columns)
        VALUES ( 'Room ' || i, 'Description for Room ' || i, 10, 10);
    END LOOP;
END $$;

SELECT * FROM rooms;

-- Poblar la tabla workspaces con 100 registros para las primeras 10 salas
DO $$
DECLARE
    room_counter INTEGER := 1;
    row_counter INTEGER := 1;
    column_counter INTEGER := 1;
BEGIN
    FOR i IN 1..100 LOOP
        IF column_counter > 10 THEN
            column_counter := 1;
            row_counter := row_counter + 1;
        END IF;
        IF row_counter > 10 THEN
            row_counter := 1;
            room_counter := room_counter + 1;
        END IF;
        INSERT INTO workspaces (room_id, "row", "column", workspace_status)
        VALUES (room_counter, row_counter, column_counter, 'available');
        column_counter := column_counter + 1;
    END LOOP;
END $$;

SELECT * FROM workspaces;

-- Poblar la tabla sessions con 100 registros para las primeras 10 salas
DO $$
DECLARE
    room_counter INTEGER := 1;
    session_date TIMESTAMP := '2024-07-01 09:00:00';
BEGIN
    FOR i IN 1..100 LOOP
        IF i % 10 = 0 THEN
            room_counter := room_counter + 1;
        END IF;
        session_date := session_date + INTERVAL '1 day';
        INSERT INTO sessions (room_id, start_time, duration, session_description)
        VALUES (room_counter, session_date, '2 hours', 'Description for Session ' || i);
    END LOOP;
END $$;

SELECT * FROM sessions;

-- Poblar la tabla users con 100 registros
DO $$
BEGIN
    FOR i IN 1..100 LOOP
        INSERT INTO users (user_name, user_email, user_phone)
        VALUES ('User ' || i, 'user' || i || '@example.com', '555-010' || i);
    END LOOP;
END $$;

SELECT * FROM users;

-- Poblar la tabla reservations con 100 registros
DO $$
DECLARE
    user_counter INTEGER := 1;
    workspace_counter INTEGER := 1;
    session_counter INTEGER := 1;
BEGIN
    FOR i IN 1..100 LOOP
        INSERT INTO reservations (user_id, workspace_id, session_id, reservation_status)
        VALUES (user_counter, workspace_counter, session_counter, 'reserved');
        user_counter := user_counter + 1;
        workspace_counter := workspace_counter + 1;
        session_counter := session_counter + 1;
        IF user_counter > 100 THEN
            user_counter := 1;
        END IF;
        IF workspace_counter > 100 THEN
            workspace_counter := 1;
        END IF;
        IF session_counter > 100 THEN
            session_counter := 1;
        END IF;
    END LOOP;
END $$;

SELECT * FROM reservations;