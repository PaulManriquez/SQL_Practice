CREATE TABLE alumnos (
    id_alumno SERIAL PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    fecha_nacimiento DATE,
    direccion VARCHAR(100),
    telefono VARCHAR(20),
    email VARCHAR(20)
);

CREATE TABLE cursos (
    id_curso SERIAL PRIMARY KEY,
    nombre VARCHAR(50),
    nivel_habilidad VARCHAR(50),
    tipo_instrumento VARCHAR(50)
);

CREATE TABLE inscripciones (
    id_inscripcion SERIAL PRIMARY KEY,
    fecha_inscripcion VARCHAR(255),
    abono_inscripcion BOOLEAN,
    id_alumno INTEGER NOT NULL,
    id_curso INTEGER NOT NULL,
    FOREIGN KEY (id_alumno) REFERENCES alumnos(id_alumno) 
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_curso) REFERENCES cursos(id_curso) 
        ON UPDATE CASCADE ON DELETE CASCADE
);
