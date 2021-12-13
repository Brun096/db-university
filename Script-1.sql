-- Schema

create database `test_university`;
use `test_university`;


create table `departments` (
	`id` INT not null auto_increment,
	`name` VARCHAR(100) not null,
	`phone` VARCHAR(14) not null,
	`email` VARCHAR(255) not null,
	`address` VARCHAR(255),
	`website` VARCHAR(255)not null,
	primary key (`id`)
	
);

create table `teacher`(
`id` INT not null auto_increment,
`name` VARCHAR(100) not null,
`surname` VARCHAR(100) not null,
`phone` VARCHAR(14) not null,
`email` VARCHAR(255) not null,
`office_address` VARCHAR(255) not null,
primary key (`id`)
);

-- mod course N-N teacher
create table `course_teacher`(
	`course_id` INT not null,
	`teacher_id` INT not null,
	primary key(`course_id`,`teacher_id`),
	foreign key(`course_id`) references course(`id`),
	foreign key(`teacher_id`) references teacher(`id`)
);
-- mod departments 1-N degrees 

create table `degrees` (
	`id` INT not null auto_increment,
	`name` VARCHAR(100) not null,
	`level` SMALLINT not null,
	`email` VARCHAR(255) not null,
	`address` VARCHAR(255),
	`website` VARCHAR(255)not null,
	`departments_id` INT not null, 
	primary key (`id`),
	foreign key (`departments_id`) references departments(`id`)
);

-- mod degrees 1-N [student & course]

create table `student` (
	`id` INT not null auto_increment,
	`name` VARCHAR(100) not null,
	`surname` VARCHAR(100) not null,
	`date_birth` VARCHAR(100) not null,
	`email` VARCHAR(255) not null,
	`fisca_code` VARCHAR(16)not null,
	`degrees_id` INT not null, 
	primary key (`id`),
	foreign key (`degrees_id`) references degrees(`id`)
);

create table `course` (
	`id` INT not null auto_increment,
	`name` VARCHAR(100) not null,
	`description` TEXT not null,
	`website` VARCHAR(255),
	`cfu` tinyint not null,
	`degrees_id` INT not null, 
	primary key (`id`),
	foreign key (`degrees_id`) references degrees(`id`)
);

-- mod course 1-N exam & N-N teachers 

create table `exams` (
	`id` INT not null auto_increment,
	`data` DATE not null,
	`hours` TIME not null,
	`address` VARCHAR(255),
	`location` VARCHAR(255) not null,
	`course_id` INT not null, 
	primary key (`id`),
	foreign key (`course_id`) references course(`id`)
);

-- mood student 1-N [voto] N-1 exams

create table `voto`(
	`exams_id` INT not null,
	`student_id` INT not null,
	`voto` smallint not null,
	primary key(`exams_id`,`student_id`),
	foreign key(`exams_id`) references exams(`id`),
	foreign key(`student_id`) references student(`id`)
);




 