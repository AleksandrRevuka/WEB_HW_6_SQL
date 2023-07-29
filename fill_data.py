from string import ascii_uppercase

import faker
from random import randint
import sqlite3

NUMBER_STUDENTS = 456
NUMBER_GROUP = 15
NUMBER_SUBJECT = 8
NUMBER_TEACHER = 13
NUMBER_GREADS = 20
SUBJECTS = [
    "Mathematics",
    "Biology",
    "History",
    "Chemistry",
    "Physics",
    "Literature",
    "Computer Science",
    "Psychology",
]

GREADS = [1, 2, 3, 4, 5]
PROBABILITIES = [1, 5, 15, 45, 34]


def get_random_gread():
    rand_num = randint(1, 100)
    cumulative_prob = 0
    for i, prob in enumerate(PROBABILITIES):
        cumulative_prob += prob
        if rand_num <= cumulative_prob:
            return GREADS[i]


def insert_data_to_db(students, 
                      groups, 
                      subjects, 
                      teachers, 
                      journal) -> None:
    
    with sqlite3.connect("student_journal.db") as con:
        cur = con.cursor()

        sql_to_groups = """INSERT INTO groups(group_name)
                               VALUES (?)"""
        cur.executemany(sql_to_groups, groups)

        sql_to_students = """INSERT INTO students(student, group_id)
                               VALUES (?, ?)"""
        cur.executemany(sql_to_students, students)

        sql_to_subjects = """INSERT INTO subjects(subject_name)
                               VALUES (?)"""
        cur.executemany(sql_to_subjects, subjects)

        sql_to_teachers = """INSERT INTO teachers(teacher, subject_id)
                               VALUES (?, ?)"""
        cur.executemany(sql_to_teachers, teachers)

        sql_to_greads = """INSERT INTO journal(student_id, subject_id, gread, gread_date)
                               VALUES (?, ?, ?, ?)"""
        cur.executemany(sql_to_greads, journal)

        con.commit()


def generate_fake_data(number_students, 
                       number_groups, 
                       number_subjects, 
                       number_teachers, 
                       number_greads):
    fake_students = []
    fake_group = []
    fake_teacher = []
    fake_journal = []
    fake_subjects = []

    fake_data = faker.Faker()

    generated_names = set()

    for _ in range(number_students):
        student_name = fake_data.name()
        while student_name in generated_names:
            student_name = fake_data.name()
        generated_names.add(student_name)
        fake_students.append(
            (
                student_name,
                randint(1, number_groups),
            )
        )

    for _ in range(number_groups):
        fake_group.append((fake_data.bothify(text="??-##", letters=ascii_uppercase),))

    for _ in range(number_teachers):
        fake_teacher.append(
            (
                fake_data.name(),
                randint(1, number_subjects),
            )
        )

    for student in range(1, number_students + 1):
        for subject in range(1, number_subjects + 1):
            for _ in range(randint(10, number_greads + 1)):
                fake_journal.append(
                    (
                        student,
                        subject,
                        get_random_gread(),
                        fake_data.date_this_year(),
                    )
                )

    for subject in SUBJECTS:
        fake_subjects.append((subject,))

    return fake_students, fake_group, fake_subjects, fake_teacher, fake_journal


if __name__ == "__main__":
    students, groups, subjects, teachers, journal = generate_fake_data(
        NUMBER_STUDENTS, NUMBER_GROUP, NUMBER_SUBJECT, NUMBER_TEACHER, NUMBER_GREADS
    )

    insert_data_to_db(students, groups, subjects, teachers, journal)
