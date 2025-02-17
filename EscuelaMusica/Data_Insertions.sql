-- Insert into alumnos
INSERT INTO alumnos (nombre, apellido, fecha_nacimiento, direccion, telefono, email)
VALUES 
    ('Juan', 'Perez', '2000-05-10', 'Calle 123', '555-1234', 'juan@email.com'),
    ('Maria', 'Lopez', '1998-07-22', 'Av. Reforma', '555-5678', 'maria@email.com'),
    ('Carlos', 'Ramirez', '1999-03-15', 'Calle 456', '555-9876', 'carlos@email.com'),
    ('Ana', 'Gomez', '2001-11-30', 'Calle 789', '555-4321', 'ana@email.com'),
    ('Luis', 'Martinez', '2002-06-18', 'Av. Juarez', '555-8765', 'luis@email.com'),
    ('Sofia', 'Hernandez', '2003-02-25', 'Calle 567', '555-6543', 'sofia@email.com'),
    ('Diego', 'Torres', '1997-12-10', 'Av. Insurgentes', '555-3210', 'diego@email.com'),
    ('Elena', 'Diaz', '2004-09-05', 'Calle 890', '555-2109', 'elena@email.com'),
    ('Ricardo', 'Santos', '2000-08-20', 'Av. Central', '555-1357', 'ricardo@email.com'),
    ('Gabriela', 'Fernandez', '1996-04-17', 'Calle 246', '555-5793', 'gabriela@email.com');

-- Insert into cursos
INSERT INTO cursos (nombre, nivel_habilidad, tipo_instrumento)
VALUES 
    ('Guitarra Básico', 'Principiante', 'Guitarra'),
    ('Piano Intermedio', 'Intermedio', 'Piano'),
    ('Violín Avanzado', 'Avanzado', 'Violín'),
    ('Batería Básico', 'Principiante', 'Batería'),
    ('Saxofón Intermedio', 'Intermedio', 'Saxofón'),
    ('Flauta Avanzado', 'Avanzado', 'Flauta'),
    ('Canto Básico', 'Principiante', 'Voz'),
    ('Bajo Intermedio', 'Intermedio', 'Bajo'),
    ('Teclado Avanzado', 'Avanzado', 'Teclado'),
    ('Guitarra Eléctrica', 'Avanzado', 'Guitarra');

-- Insert into inscripciones
INSERT INTO inscripciones (fecha_inscripcion, abono_inscripcion, id_alumno, id_curso)
VALUES 
    ('2024-01-15', TRUE, 1, 2),
    ('2024-02-10', FALSE, 2, 3),
    ('2024-03-05', TRUE, 3, 1),
    ('2024-04-20', TRUE, 4, 5),
    ('2024-05-25', FALSE, 5, 6),
    ('2024-06-15', TRUE, 6, 4),
    ('2024-07-01', FALSE, 7, 7),
    ('2024-08-10', TRUE, 8, 8),
    ('2024-09-30', FALSE, 9, 9),
    ('2024-10-05', TRUE, 10, 10);

INSERT INTO inscripciones (fecha_inscripcion, abono_inscripcion, id_alumno, id_curso)
VALUES 
    ('2024-01-15', TRUE, 1, 1),
	('2024-01-15', TRUE, 1,3),
	('2024-01-15', TRUE,7,1),
	('2024-01-15', TRUE,7,4),
	('2024-01-15', TRUE,7,5)
    ;






