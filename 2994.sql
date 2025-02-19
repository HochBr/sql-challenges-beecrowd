--- URI Online Judge SQL
--- Copyright URI Online Judge
--- www.urionlinejudge.com.br
--- Problem 2994

CREATE TABLE doctors (
id integer PRIMARY KEY,
name varchar(50)
);

 

CREATE TABLE work_shifts (
id integer PRIMARY KEY,
name varchar(50),
bonus numeric
);


CREATE TABLE attendances (
id integer PRIMARY KEY,
id_doctor integer,
hours integer,
id_work_shift integer,
FOREIGN KEY (id_doctor) REFERENCES  doctors(id),
FOREIGN KEY (id_work_shift) REFERENCES  work_shifts(id)
);

insert into doctors (id,name) values
(1,'Arlino'),
(2,'Tiago'),
(3,'Amanda'),
(4,'Wellington');

insert into work_shifts (id,name,bonus) values
(1,'nocturnal',15),
(2,'afternoon',2),
(3,'day',1);

insert into  attendances (id, id_doctor, hours, id_work_shift) values
(1,1,5,1),
(2,3,2,1),
(3,3,3,2),
(4,2,2,3),
(5,1,5,3),
(6,4,1,3),
(7,4,2,1),
(8,3,2,2),
(9,2,4,2);

/*  Execute this query to drop the tables */
-- DROP TABLE attendances;
-- DROP TABLE work_shifts;
-- DROP TABLE doctors;


WITH cte_medicos AS (
	SELECT d.name,
	ROUND(SUM(a.hours *150 + w.bonus *0.01*a.hours *150),1) AS salary
	FROM doctors d JOIN attendances a ON d.id = a.id_doctor
	JOIN work_shifts w ON a.id_work_shift = w.id
	GROUP BY d.name
)
SELECT * FROM  cte_medicos
ORDER BY salary DESC;








