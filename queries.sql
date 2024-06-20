-- Ver la lista de espacios de trabajo disponibles en una sala para una sesión específica
-- Reemplaza `room_id` y `session_id` con los valores deseados
SELECT w.*
FROM workspaces w
JOIN rooms r ON w.room_id = r.room_id
WHERE r.room_id = 1
AND NOT EXISTS (
    SELECT 1
    FROM reservations res
    JOIN sessions s ON res.session_id = s.session_id
    WHERE res.workspace_id = w.workspace_id
    AND s.session_id = 1
);

-- Ver la lista de espacios de trabajo ocupados en una sala para una sesión específica
-- Reemplaza `room_id` y `session_id` con los valores deseados
SELECT w.*
FROM workspaces w
JOIN reservations res ON w.workspace_id = res.workspace_id
JOIN sessions s ON res.session_id = s.session_id
WHERE w.room_id = 1
AND s.session_id = 1;

-- Ver las sesiones ordenadas por las más ocupadas
SELECT s.*, COUNT(res.reservation_id) as reservation_count
FROM sessions s
LEFT JOIN reservations res ON s.session_id = res.session_id
GROUP BY s.session_id
ORDER BY reservation_count DESC;

-- Ver las sesiones ordenadas por las más disponibles
SELECT s.*, 
    (SELECT COUNT(w.workspace_id) 
     FROM workspaces w 
     WHERE w.room_id = s.room_id) - COUNT(res.reservation_id) as available_count
FROM sessions s
LEFT JOIN reservations res ON s.session_id = res.session_id
GROUP BY s.session_id
ORDER BY available_count DESC;

-- Ver la lista de espacios de trabajo asignados a un usuario
-- Reemplaza `user_id` con el valor deseado
SELECT w.*
FROM workspaces w
JOIN reservations res ON w.workspace_id = res.workspace_id
WHERE res.user_id = 1;

-- Ver la lista de espacios de trabajo asignados a una sesión
-- Reemplaza `session_id` con el valor deseado
SELECT w.*
FROM workspaces w
JOIN reservations res ON w.workspace_id = res.workspace_id
WHERE res.session_id = 1;
