-- Reservar un espacio de trabajo en una sesión específica
-- Reemplaza `user_id`, `workspace_id`, y `session_id` con los valores deseados
INSERT INTO reservations (user_id, workspace_id, session_id, reservation_status)
VALUES (1, 1, 1, 'reserved');

-- Cancelar una reserva específica
-- Reemplaza `user_id`, `workspace_id`, y `session_id` con los valores de la reserva a cancelar
DELETE FROM reservations
WHERE user_id = 1 AND workspace_id = 1 AND session_id = 1;
