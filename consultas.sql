CREATE TABLE alumno (
    rut       VARCHAR2(10) NOT NULL,
    nombre    VARCHAR2(15) NOT NULL,
    apellido  VARCHAR2(15) NOT NULL,
    clase_id  INTEGER NOT NULL
);

ALTER TABLE alumno ADD CONSTRAINT alumno_pk PRIMARY KEY ( rut );

CREATE TABLE autor (
    rut       VARCHAR2(12) NOT NULL,
    nombre    VARCHAR2(15) NOT NULL,
    apellido  VARCHAR2(15) NOT NULL
);

ALTER TABLE autor ADD CONSTRAINT autor_pk PRIMARY KEY ( rut );

CREATE TABLE clase (
    id           INTEGER NOT NULL,
    nombreclase  VARCHAR2(30) NOT NULL
);

ALTER TABLE clase ADD CONSTRAINT clase_pk PRIMARY KEY ( id );

CREATE TABLE curso (
    id           INTEGER NOT NULL,
    descripcion  VARCHAR2(150) NOT NULL,
    programa     VARCHAR2(100) NOT NULL,
    clase_id     INTEGER NOT NULL
);

ALTER TABLE curso ADD CONSTRAINT curso_pk PRIMARY KEY ( id );

CREATE TABLE evaalumno (
    id          INTEGER NOT NULL,
    alumno_rut  VARCHAR2(10) NOT NULL,
    prueba_id   INTEGER NOT NULL,
    nota        INTEGER NOT NULL
);

ALTER TABLE evaalumno ADD CONSTRAINT evaalumno_pk PRIMARY KEY ( id );

CREATE TABLE preguntaprueba (
    id         INTEGER NOT NULL,
    enunciado  VARCHAR2(200),
    puntaje    NUMBER NOT NULL,
    prueba_id  INTEGER NOT NULL
);

ALTER TABLE preguntaprueba ADD CONSTRAINT preguntaprueba_pk PRIMARY KEY ( id );

CREATE TABLE prueba (
    id             INTEGER NOT NULL,
    unidad         VARCHAR2(30) NOT NULL,
    cantpreguntas  INTEGER NOT NULL,
    curso_id       INTEGER NOT NULL,
    autor_rut      VARCHAR2(12) NOT NULL
);

ALTER TABLE prueba ADD CONSTRAINT prueba_pk PRIMARY KEY ( id );

CREATE TABLE respevaalumnos (
    id             INTEGER NOT NULL,
    evaalumno_id   INTEGER NOT NULL,
    respprueba_id  INTEGER NOT NULL
);

ALTER TABLE respevaalumnos ADD CONSTRAINT respevaalumnos_pk PRIMARY KEY ( id );

CREATE TABLE respprueba (
    id                 INTEGER NOT NULL,
    descripcion        VARCHAR2(200),
    valor              CHAR(1),
    porcentaje         NUMBER NOT NULL,
    preguntaprueba_id  INTEGER NOT NULL
);

ALTER TABLE respprueba
    ADD CHECK ( valor IN (
        'N',
        'S'
    ) );

ALTER TABLE respprueba ADD CONSTRAINT respprueba_pk PRIMARY KEY ( id );

ALTER TABLE alumno
    ADD CONSTRAINT alumno_clase_fk FOREIGN KEY ( clase_id )
        REFERENCES clase ( id );

ALTER TABLE curso
    ADD CONSTRAINT curso_clase_fk FOREIGN KEY ( clase_id )
        REFERENCES clase ( id );

ALTER TABLE evaalumno
    ADD CONSTRAINT evaalumno_alumno_fk FOREIGN KEY ( alumno_rut )
        REFERENCES alumno ( rut );

ALTER TABLE evaalumno
    ADD CONSTRAINT evaalumno_prueba_fk FOREIGN KEY ( prueba_id )
        REFERENCES prueba ( id );

ALTER TABLE preguntaprueba
    ADD CONSTRAINT preguntaprueba_prueba_fk FOREIGN KEY ( prueba_id )
        REFERENCES prueba ( id );

ALTER TABLE prueba
    ADD CONSTRAINT prueba_autor_fk FOREIGN KEY ( autor_rut )
        REFERENCES autor ( rut );

ALTER TABLE prueba
    ADD CONSTRAINT prueba_curso_fk FOREIGN KEY ( curso_id )
        REFERENCES curso ( id );

ALTER TABLE respevaalumnos
    ADD CONSTRAINT respevaalumnos_evaalumno_fk FOREIGN KEY ( evaalumno_id )
        REFERENCES evaalumno ( id );

ALTER TABLE respevaalumnos
    ADD CONSTRAINT respevaalumnos_respprueba_fk FOREIGN KEY ( respprueba_id )
        REFERENCES respprueba ( id );

ALTER TABLE respprueba
    ADD CONSTRAINT respprueba_preguntaprueba_fk FOREIGN KEY ( preguntaprueba_id )
        REFERENCES preguntaprueba ( id );

 
 
insert into clase values (0, 'Base de Datos');
insert into clase values (1, 'Python');
insert into clase values (2, 'Java');
insert into clase values (3, 'Aplicaciones Android');
insert into clase values (4, 'PHP');

insert into curso values (0, 'Curso para aprender sobre la persistencia de datos', 'Modulo 3', 0);
insert into curso values (1, 'Curso para la creación de páginas web responsivas', 'Modulo 2', 4);
insert into curso values (2, 'Curso desarrollador Full Stack JAVA', 'Modulo 3', 2);
insert into curso values (3, 'Curso para la creación de aplicaciones móviles', 'Modulo 3', 3);
insert into curso values (4, 'Curso básico programación Python', 'Modulo 2', 1);

select clase.id, clase.nombreClase, curso.descripcion from clase inner join curso on curso.clase_id=clase.id where clase.id=4;

--ON TABLA1.ID = TABLA2.FK

select clase.id, clase.nombreClase, curso.descripcion from clase inner join curso on curso.clase_id=clase.id where clase.id=4;


delete from alumno;

insert into alumno values ('11371250-3', 'Nombre_1', 'Apellido_1', 4);
insert into alumno values ('11371251-0', 'jNombre_10', 'dApellido_10', 4);
insert into alumno values ('11371252-k', 'kNombre_11', 'dApellido_11', 4);
insert into alumno values ('12371253-2', 'lNombre_12', 'dApellido_12', 4);
insert into alumno values ('13371254-2', 'lNombre_13', 'dApellido_13', 4);
insert into alumno values ('14371255-2', 'lNombre_14', 'dApellido_14', 4);
insert into alumno values ('16371256-2', 'lNombre_15', 'dApellido_15', 4);
insert into alumno values ('17371257-2', 'lNombre_16', 'dApellido_16', 4);
insert into alumno values ('18371258-2', 'lNombre_17', 'dApellido_17', 4);
insert into alumno values ('11371250-9', 'hNombre_9', 'fApellido_9', 4);

insert into alumno values ('11371250-2', 'aNombre_18', 'xApellido_2', 1);
insert into alumno values ('11312250-1', 'bNombre_19', 'cApellido_3', 2);
insert into alumno values ('11356250-4', 'cNombre_4', 'vApellido_4', 3);
insert into alumno values ('11335250-5', 'dNombre_5', 'bApellido_5', 4);
insert into alumno values ('11762650-6', 'dNombre_6', 'nApellido_6', 2);
insert into alumno values ('11124250-7', 'dNombre_3', 'mApellido_7', 2);
insert into alumno values ('18765250-6', 'gNombre_8', 'hApellido_8', 2);
insert into alumno values ('11375650-5', 'gNombre_8', 'fApellido_8', 2);
insert into alumno values ('11378880-2', 'gNombre_8', 'fApellido_8', 2);
insert into alumno values ('11386780-3', 'gNombre_8', 'hApellido_8', 2);
insert into alumno values ('11333330-2', 'gNombre_8', 'vApellido_8', 2);
insert into alumno values ('11377750-1', 'gNombre_8', 'nApellido_8', 2);
insert into alumno values ('11371340-1', 'gNombre_8', 'hApellido_8', 2);

delete from alumno where rut='11335250-5';

update alumno set apellido='Apellido_1' where rut='11371250-3';

select * from alumno;

insert into autor values ('15240230-1', 'AutorN_1', 'AutorApe_1');
insert into autor values ('15240230-2', 'qAutorN_2', 'yAutorApe_2');
insert into autor values ('15240230-3', 'wAutorN_3', 'uAutorApe_3');
insert into autor values ('15240230-4', 'eAutorN_4', 'iAutorApe_4');
insert into autor values ('15240230-5', 'rAutorN_5', 'oAutorApe_5');
insert into autor values ('15240230-6', 'tAutorN_6', 'pAutorApe_6');

select * from autor;

insert into prueba values (1, 'Unidad 1', 10, 4, '15240230-1');
insert into prueba values (2, 'Unidad 2', 4, 3, '15240230-2');

insert into prueba values (3, 'Unidad 4', 2, '15240230-2');
insert into prueba values (4, 'Unidad 5', 3, '15240230-2');
insert into prueba values (5, 'Unidad 3', 0, '15240230-3');
insert into prueba values (6, 'Unidad 7', 3, '15240230-3');
insert into prueba values (7, 'Unidad 5', 3, '15240230-3');
insert into prueba values (8, 'Unidad 10', 2, '15240230-1');
insert into prueba values (9, 'Unidad 8', 1, '15240230-4');
insert into prueba values (10, 'Unidad 2', 1, '15240230-5');
insert into prueba values (11, 'Unidad 1', 1, '15240230-5');


update prueba set curso_id=4;

select * from prueba;
select * from preguntaprueba;

--insert into preguntaprueba values (0, 'null', 0);

insert into preguntaprueba values (1, 'Pregunta Nº1: ', 10, 1);
insert into preguntaprueba values (2, 'Pregunta Nº2: ', 10, 1);
insert into preguntaprueba values (3, 'Pregunta Nº3: ', 10, 1);
insert into preguntaprueba values (4, 'Pregunta Nº4: ', 10, 1);
insert into preguntaprueba values (5, 'Pregunta Nº5: ', 10, 1);
insert into preguntaprueba values (6, 'Pregunta Nº6: ', 10, 1);
insert into preguntaprueba values (7, 'Pregunta Nº7: ', 10, 1);
insert into preguntaprueba values (8, 'Pregunta Nº8: ', 10, 1);
insert into preguntaprueba values (9, 'Pregunta Nº9: ', 10, 1);
insert into preguntaprueba values (10, 'Pregunta Nº10: ', 10, 1);

insert into preguntaprueba values (11, 'Pregunta Nº1: ', 25, 2);
insert into preguntaprueba values (12, 'Pregunta Nº2: ', 25, 2);
insert into preguntaprueba values (13, 'Pregunta Nº3: ', 25, 2);
insert into preguntaprueba values (14, 'Pregunta Nº4: ', 25, 2);

insert into preguntaprueba values (15, 'Pregunta Nº5: ', 2);
insert into preguntaprueba values (16, 'Pregunta Nº6: ', 2);
insert into preguntaprueba values (17, 'Pregunta Nº7: ', 2);
insert into preguntaprueba values (18, 'Pregunta Nº8: ', 2);
insert into preguntaprueba values (19, 'Pregunta Nº9: ', 2);
insert into preguntaprueba values (20, 'Pregunta Nº10: ', 2);

insert into preguntaprueba values (21, 'Pregunta Nº1: ', 3);
insert into preguntaprueba values (22, 'Pregunta Nº2: ', 3);
insert into preguntaprueba values (23, 'Pregunta Nº3: ', 3);
insert into preguntaprueba values (24, 'Pregunta Nº4: ', 3);
insert into preguntaprueba values (25, 'Pregunta Nº5: ', 3);

insert into preguntaprueba values (26, 'Pregunta Nº1: ', 4);
/*
insert into preguntaprueba values (4, 'Pregunta Nº5: ', 4);
insert into preguntaprueba values (5, 'Pregunta Nº6: ', 5);
insert into preguntaprueba values (6, 'Pregunta Nº7: ', 6);
insert into preguntaprueba values (7, 'Pregunta Nº8: ', 7);
insert into preguntaprueba values (8, 'Pregunta Nº9: ', 8);
insert into preguntaprueba values (9, 'Pregunta Nº10: ', 9);
insert into preguntaprueba values (10, 'Pregunta Nº10: ', 10);
*/
select * from preguntaprueba;
select * from respprueba;

insert into respprueba values (0, 'Alternativa A - Pregunta 1', 'S', 50, 1);
insert into respprueba values (1, 'Alternativa B - Pregunta 1', 'S', 50, 1); 
insert into respprueba values (2, 'Alternativa C - Pregunta 1', 'N', 0, 1);
insert into respprueba values (3, 'Alternativa D - Pregunta 1', 'N', 0, 1);

delete from respprueba where id=0;

insert into respprueba values (4, 'Alternativa A - Pregunta 2', 'N', 0, 2);
insert into respprueba values (5, 'Alternativa B - Pregunta 2', 'S', 100, 2); 
insert into respprueba values (6, 'Alternativa C - Pregunta 2', 'N', 0, 2);
insert into respprueba values (7, 'Alternativa D - Pregunta 2', 'N', 0, 2);

insert into respprueba values (8, 'Alternativa A - Pregunta 3', 'N', 0, 3);
insert into respprueba values (9, 'Alternativa B - Pregunta 3', 'N', 0, 3); 
insert into respprueba values (10, 'Alternativa C - Pregunta 3', 'S', 100, 3);
insert into respprueba values (11, 'Alternativa D - Pregunta 3', 'N', 0, 3);

insert into respprueba values (12, 'Alternativa A - Pregunta 4', 'S', 50, 4);
insert into respprueba values (13, 'Alternativa B - Pregunta 4', 'S', 50, 4); 
insert into respprueba values (14, 'Alternativa C - Pregunta 4', 'N', 0, 4);
insert into respprueba values (15, 'Alternativa D - Pregunta 4', 'N', 0, 4);

insert into respprueba values (16, 'Alternativa A - Pregunta 5', 'N', 0, 5);
insert into respprueba values (17, 'Alternativa B - Pregunta 5', 'N', 0, 5); 
insert into respprueba values (18, 'Alternativa C - Pregunta 5', 'N', 0, 5);
insert into respprueba values (19, 'Alternativa D - Pregunta 5', 'S', 100, 5);

insert into respprueba values (20, 'Alternativa A - Pregunta 6', 'S', 50, 6);
insert into respprueba values (21, 'Alternativa B - Pregunta 6', 'S', 50, 6); 
insert into respprueba values (22, 'Alternativa C - Pregunta 6', 'N', 0, 6);
insert into respprueba values (23, 'Alternativa D - Pregunta 6', 'N', 0, 6);

insert into respprueba values (24, 'Alternativa A - Pregunta 7', 'S', 100, 7);
insert into respprueba values (25, 'Alternativa B - Pregunta 7', 'N', 0, 7); 
insert into respprueba values (26, 'Alternativa C - Pregunta 7', 'N', 0, 7);
insert into respprueba values (27, 'Alternativa D - Pregunta 7', 'N', 0, 7);

insert into respprueba values (28, 'Alternativa A - Pregunta 8', 'N', 0, 8);
insert into respprueba values (29, 'Alternativa B - Pregunta 8', 'N', 0, 8); 
insert into respprueba values (30, 'Alternativa C - Pregunta 8', 'S', 100, 8);
insert into respprueba values (31, 'Alternativa D - Pregunta 8', 'N', 0, 8);

insert into respprueba values (32, 'Alternativa A - Pregunta 9', 'S', 50, 9);
insert into respprueba values (33, 'Alternativa B - Pregunta 9', 'S', 50, 9); 
insert into respprueba values (34, 'Alternativa C - Pregunta 9', 'N', 0, 9);
insert into respprueba values (35, 'Alternativa D - Pregunta 9', 'N', 0, 9);

insert into respprueba values (36, 'Alternativa A - Pregunta 10', 'S', 50, 10);
insert into respprueba values (37, 'Alternativa B - Pregunta 10', 'S', 50, 10); 
insert into respprueba values (38, 'Alternativa C - Pregunta 10', 'N', 0, 10);
insert into respprueba values (39, 'Alternativa D - Pregunta 10', 'N', 0, 10);

--nuevos datos

insert into respprueba values (45, 'Alternativa A - Pregunta 1', 'S', 50, 11);
insert into respprueba values (46, 'Alternativa B - Pregunta 1', 'S', 50, 11); 


insert into respprueba values (56, 'Alternativa A - Pregunta 2', 'S', 50, 13);
insert into respprueba values (57, 'Alternativa B - Pregunta 2', 'S', 50, 13);
insert into respprueba values (58, 'Alternativa C - Pregunta 2', 'S', 50, 13);
insert into respprueba values (59, 'Alternativa D - Pregunta 2', 'S', 50, 13);


insert into respprueba values (48, 'Alternativa A - Pregunta 3', 'S', 50, 10);
insert into respprueba values (49, 'Alternativa B - Pregunta 3', 'S', 50, 10); 
insert into respprueba values (50, 'Alternativa C - Pregunta 3', 'N', 0, 10);
insert into respprueba values (51, 'Alternativa D - Pregunta 3', 'N', 0, 10);

insert into respprueba values (52, 'Alternativa A - Pregunta 4', 'S', 50, 10);
insert into respprueba values (53, 'Alternativa B - Pregunta 4', 'S', 50, 10); 
insert into respprueba values (54, 'Alternativa C - Pregunta 4', 'N', 0, 10);
insert into respprueba values (55, 'Alternativa D - Pregunta 4', 'N', 0, 10);

delete from ressprueba;
select * from respprueba;

select * from alumno;
select * from prueba;
select * from preguntaprueba;
select * from evaalumno; 
select * from respprueba;
select * from respevaalumnos;
delete from respevaalumnos; 

insert into evaalumno values (1, '11371250-3', 1, 0);
insert into evaalumno values (2, '11371251-0', 1, 0);
insert into evaalumno values (3, '11371252-k', 1, 0);
insert into evaalumno values (4, '12371253-2', 1, 0);
insert into evaalumno values (5, '13371254-2', 1, 0);
insert into evaalumno values (6, '14371255-2', 1, 0);
insert into evaalumno values (7, '16371256-2', 1, 0);
insert into evaalumno values (8, '17371257-2', 1, 0);
insert into evaalumno values (9, '18371258-2', 1, 0);
insert into evaalumno values (10, '11371250-9', 1, 0);

insert into respevaalumnos values (1, 1, 2); 
insert into respevaalumnos values (2, 1, 3); 
insert into respevaalumnos values (3, 1, 5); 
insert into respevaalumnos values (4, 1, 8); 
insert into respevaalumnos values (5, 1, 12); 
insert into respevaalumnos values (6, 1, 13); 
insert into respevaalumnos values (7, 1, 18); 
insert into respevaalumnos values (8, 1, 21);    
insert into respevaalumnos values (9, 1, 24); 
insert into respevaalumnos values (10, 1, 30); 
insert into respevaalumnos values (11, 1, 32); 
insert into respevaalumnos values (12, 1, 37); 
insert into respevaalumnos values (13, 1, 39); 
insert into respevaalumnos values (14, 1, 38);         
        
                
--1.- Conocer el número de evaluaciones por curso. 
SELECT COUNT(PRUEBA.ID) CANTIDAD_PRUEBAS, CURSO.DESCRIPCION, CURSO.PROGRAMA, CLASE.NOMBRECLASE FROM CURSO 
LEFT JOIN PRUEBA ON PRUEBA.CURSO_ID=CURSO.ID INNER JOIN CLASE ON CLASE.ID=CURSO.CLASE_ID GROUP BY CURSO.DESCRIPCION, CURSO.PROGRAMA, CLASE.NOMBRECLASE; 

--2.- Conocer los cursos sin evaluaciones. 
SELECT COUNT(PRUEBA.ID) CANTIDAD_PRUEBAS, CLASE.NOMBRECLASE FROM CURSO INNER JOIN PRUEBA ON PRUEBA.CURSO_ID=CURSO.ID RIGHT JOIN CLASE ON CLASE.ID=CURSO.CLASE_ID 
WHERE PRUEBA.ID IS NULL GROUP BY CLASE.NOMBRECLASE; 

--3.- Determinar las evaluaciones con deficiencia. Una evaluación es deficien   te:  
--a. Si no tiene preguntas. 

SELECT PRUEBA.ID, PRUEBA.CANTPREGUNTAS AS CANTIDAD_PREGUNTAS, PRUEBA.CURSO_ID AS CURSO_AL_QUE_PERTENECE FROM PRUEBA WHERE CANTPREGUNTAS=0;

--b. Si hay preguntas con 2 ó menos alternativas  
SELECT PREGUNTAPRUEBA.PRUEBA_ID FROM PREGUNTAPRUEBA WHERE PREGUNTAPRUEBA.ID IN (SELECT RESPPRUEBA.PREGUNTAPRUEBA_ID FROM RESPPRUEBA GROUP BY RESPPRUEBA.PREGUNTAPRUEBA_ID HAVING COUNT (*)<3);
--select * from preguntaprueba;
--select * from respprueba;

--c. Si todas las alternativas son correctas o si todas las alternativas son incorrectas. */
--ignorar
--SELECT RESPPRUEBA.PREGUNTAPRUEBA_ID, count (*) FROM RESPPRUEBA GROUP BY RESPPRUEBA.PREGUNTAPRUEBA_ID HAVING COUNT (*)<3;
--ignorar

select preguntaprueba.prueba_id from preguntaprueba where preguntaprueba.id in (select count(*) from respprueba where respprueba.id in (select respprueba.preguntaprueba_id 
from respprueba where respprueba.valor='S' or respprueba.valor='N' GROUP BY respprueba.valor, respprueba.preguntaprueba_id having count (*)<4));

--4.- Determinar cuántos alumnos hay en cada curso. 
SELECT COUNT (ALUMNO.RUT) AS CANTIDAD_ALUMNOS, CURSO.DESCRIPCION, CLASE.NOMBRECLASE FROM CURSO 
LEFT JOIN CLASE ON CLASE.ID = CURSO.CLASE_ID INNER JOIN ALUMNO ON CLASE.ID = ALUMNO.CLASE_ID GROUP BY CURSO.DESCRIPCION, CLASE.NOMBRECLASE;

--5.-  Obtener el puntaje no normalizado de cada evaluación. El puntaje no normalizado ha sido definido 
--(requerimiento) como: P = buenas – malas/4. Si un alumno no contesta en una pregunta exactamente
--lo mismo que se ha definido como correcto, la pregunta cuenta como mala a menos que el alumno haya omitido

--6.- Obtener el puntaje normalizado, o sea, de 1,0 a 7,0. 7. 

--.7.- Nombre de estudiantes de un curso determinado que aprueban una evaluación determinada (donde la nota de aprobación mínima es un 4,0). 

--8.- Nota promedio de los estudiantes de un curso determinado, para una evaluación de terminada. 
