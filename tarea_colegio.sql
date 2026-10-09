CREATE TABLE estudiantes (
    estudiante_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    edad INT CHECK (edad >= 15)
);

CREATE TABLE cursos (
    curso_id SERIAL PRIMARY KEY,
    nombre_curso VARCHAR(100) NOT NULL,
    estudiante_id INT REFERENCES estudiantes(estudiante_id) ON DELETE CASCADE
);

INSERT INTO estudiantes (nombre, email, edad) VALUES
('Jose luis', 'jose@email.com', 16),
('Edgar junior', 'edgar@email.com', 17),
('Brainerd schals', 'brainerd@email.com', 15);

INSERT INTO cursos (nombre_curso, estudiante_id) VALUES
('software', 1),
('Programacion web', 1),
('CCR', 2),
('Base de datos', 3);

SELECT * FROM estudiantes;

SELECT * FROM cursos WHERE estudiante_id = 1;

SELECT e.nombre AS estudiante, c.nombre_curso AS curso
FROM estudiantes e
JOIN cursos c ON c.estudiante_id = e.estudiante_id
ORDER BY e.nombre, c.nombre_curso;