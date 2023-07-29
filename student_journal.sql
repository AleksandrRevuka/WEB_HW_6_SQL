-- Table of students
DROP TABLE IF EXISTS students;
CREATE TABLE students (
    student_id INTEGER PRIMARY KEY AUTOINCREMENT,
    student VARCHAR(55) UNIQUE NOT NULL,
    group_id INTEGER,
    FOREIGN KEY (group_id) REFERENCES groups (group_id)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);

-- Table of groups
DROP TABLE IF EXISTS groups;
CREATE TABLE groups (
    group_id INTEGER PRIMARY KEY AUTOINCREMENT,
    group_name VARCHAR(55) UNIQUE NOT NULL
);

-- Table of teachers
DROP TABLE IF EXISTS teachers;
CREATE TABLE teachers (
    teacher_id INTEGER PRIMARY KEY AUTOINCREMENT,
    teacher VARCHAR(55) UNIQUE NOT NULL,
    subject_id INTEGER,
    FOREIGN KEY (subject_id) REFERENCES subjects (subject_id) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE
);

-- Table of subjects
DROP TABLE IF EXISTS subjects;
CREATE TABLE subjects (
    subject_id INTEGER PRIMARY KEY AUTOINCREMENT,
    subject_name VARCHAR(55) UNIQUE NOT NULL
);

-- Table journal
DROP TABLE IF EXISTS journal;
CREATE TABLE journal (
    journal_id INTEGER PRIMARY KEY AUTOINCREMENT,
    student_id INTEGER,
    subject_id INTEGER,
    gread INTEGER,
    gread_date DATE,
    FOREIGN KEY (student_id) REFERENCES students (student_id)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
    FOREIGN KEY (subject_id) REFERENCES subjects (subject_id)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);
