--1) 
--List all the students enrolled in  guitarra 
--Intermedio/Principiante/Avanzazdo 
select * from cursos

select Alumnos.nombre, Ins.id_curso
from Alumnos
inner join Inscripciones as Ins on Alumnos.id_alumno = Ins.id_alumno

select T1.nombre , T1.id_curso , Curs.Nombre, Curs.nivel_habilidad	
from (
select Alumnos.nombre, Ins.id_curso
from Alumnos
inner join Inscripciones as Ins on Alumnos.id_alumno = Ins.id_alumno
) as T1
inner join Cursos as Curs on Curs.id_curso = T1.id_curso
where 
	Curs.tipo_instrumento = 'Guitarra' AND 
	Curs.nivel_habilidad = 'Avanzado';

--2)
--Get all the enrollements before february 2024
select count(*) as Total from inscripciones

select count(*) as Total from inscripciones
where fecha_inscripcion > '2024-02'

--3) Count the number of students that have dropped out the enrollement
select count(*) as n_dropped_students from inscripciones 
where abono_inscripcion = true

--4) List all the courses available for advanced students 
select * from cursos
where nivel_habilidad = 'Avanzado'

--======================================================================
--2)

--1) List the names and surnames of the students 
--with the courses names where are enrolled
select * from cursos
select * from inscripciones

select alumnos.nombre,alumnos.apellido,inscripciones.id_curso
from alumnos 
inner join inscripciones on alumnos.id_alumno = inscripciones.id_alumno

select T1.nombre,T1.apellido, T1.id_curso,cursos.nombre	
from cursos
inner join (
	select alumnos.nombre,alumnos.apellido,inscripciones.id_curso
	from alumnos 
	inner join inscripciones on alumnos.id_alumno = inscripciones.id_alumno
) as T1 
on T1.id_curso = cursos.id_curso

--2) Get the name and surname of the students 
--	that are enrolled in more than 1 course
select min(T1.nombre) as nombres ,T1.id_alumno	,count(*) as n_times_enrrolled
from cursos
inner join (
	select alumnos.nombre,alumnos.apellido,inscripciones.id_curso,alumnos.id_alumno
	from alumnos 
	inner join inscripciones on alumnos.id_alumno = inscripciones.id_alumno
) as T1 
on T1.id_curso = cursos.id_curso
group by T1.id_alumno
having count(*) > 1

--3) Display the course name and the number of students enrolled in each course
select cursos.nombre, count(*) as n_students_enrolled
from cursos
inner join (
	select alumnos.nombre,alumnos.apellido,inscripciones.id_curso
	from alumnos 
	inner join inscripciones on alumnos.id_alumno = inscripciones.id_alumno
) as T1 
on T1.id_curso = cursos.id_curso
group by cursos.nombre

--============================================
--3)

--1) List all the students where abono inscripcion equals to False 

select abono_inscripcion,id_alumno 
from inscripciones
where abono_inscripcion = 'false'

select alumnos.id_alumno,alumnos.nombre,alumnos.apellido,T1.abono_inscripcion as Abono 
from alumnos
inner join (
	select abono_inscripcion,id_alumno 
	from inscripciones
	where abono_inscripcion = 'false'
) as T1
on T1.id_alumno = alumnos.id_alumno


--2)Get the courses where have enrolled at leats 1 student 
--  greater than 27 years old
select alumnos.id_alumno,alumnos.nombre,alumnos.apellido,alumnos.fecha_nacimiento,
	EXTRACT(YEAR FROM AGE(NOW(), alumnos.fecha_nacimiento)) AS edad
from alumnos
inner join (
	select abono_inscripcion,id_alumno 
	from inscripciones
) as T1
on T1.id_alumno = alumnos.id_alumno
where EXTRACT(YEAR FROM AGE(NOW(), alumnos.fecha_nacimiento)) > 25

--3) List the name and surname of the students with the names of the courses
-- enrolled from august 2024  to current 
select alumnos.id_alumno,alumnos.nombre,alumnos.apellido,
	T1.fecha_inscripcion 
from alumnos
inner join (
	select abono_inscripcion,id_alumno,fecha_inscripcion
	from inscripciones
) as T1
on T1.id_alumno = alumnos.id_alumno
where T1.fecha_inscripcion > '2024-07-31'




