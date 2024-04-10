-- # Part 1
-- Doctor
-- -
-- doctor_id PK int

-- Patient
-- -
-- patient_id PK int

-- Disease
-- -
-- disease_id PK int

-- Visit
-- -
-- visit_id PK int
-- patient_id int FK >- Patient.patient_id
-- doctor_id int FK >- Doctor.doctor_id

-- Diagnosis
-- -
-- diagnosis_id PK int
-- visit_id int FK >- Visit.visit_id
-- disease_id int FK >- Disease.disease_id

-- #Part 2
-- Region
-- -
-- region_id PK int

-- User
-- -
-- user_id PK int
-- preferred_region_id int FK >- Region.region_id

-- Post
-- -
-- post_id PK int
-- title text
-- text text
-- user_id int FK >- User.user_id
-- region_id int FK >- Region.region_id

-- Category
-- -
-- category_id PK int

-- PostCategory
-- -
-- post_id int FK >- Post.post_id
-- category_id int FK >- Category.category_id


-- #Part 3
-- Team
-- -
-- team_id PK int


-- Player
-- -
-- player_id PK int
-- team_id int FK >- Team.team_id

-- Game
-- -
-- game_id PK int
-- date date
-- home_team_id int FK >- Team.team_id
-- away_team_id int FK >- Team.team_id

-- Goal
-- -
-- goal_id PK int
-- player_id int FK >- Player.player_id
-- game_id int FK >- Game.game_id

-- Referee
-- -
-- referee_id PK int

-- GameReferee
-- -
-- game_id int FK >- Game.game_id
-- referee_id int FK >- Referee.referee_id

-- Season
-- -
-- season_id PK int
-- start_date date
-- end_date date


-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


-- Part 1
CREATE TABLE "Doctor" (
    "doctor_id" int   NOT NULL,
    CONSTRAINT "pk_Doctor" PRIMARY KEY (
        "doctor_id"
     )
);

CREATE TABLE "Patient" (
    "patient_id" int   NOT NULL,
    CONSTRAINT "pk_Patient" PRIMARY KEY (
        "patient_id"
     )
);

CREATE TABLE "Disease" (
    "disease_id" int   NOT NULL,
    CONSTRAINT "pk_Disease" PRIMARY KEY (
        "disease_id"
     )
);

CREATE TABLE "Visit" (
    "visit_id" int   NOT NULL,
    "patient_id" int   NOT NULL,
    "doctor_id" int   NOT NULL,
    CONSTRAINT "pk_Visit" PRIMARY KEY (
        "visit_id"
     )
);

CREATE TABLE "Diagnosis" (
    "diagnosis_id" int   NOT NULL,
    "visit_id" int   NOT NULL,
    "disease_id" int   NOT NULL,
    CONSTRAINT "pk_Diagnosis" PRIMARY KEY (
        "diagnosis_id"
     )
);

-- Part 2
CREATE TABLE "Region" (
    "region_id" int   NOT NULL,
    CONSTRAINT "pk_Region" PRIMARY KEY (
        "region_id"
     )
);

CREATE TABLE "User" (
    "user_id" int   NOT NULL,
    "preferred_region_id" int   NOT NULL,
    CONSTRAINT "pk_User" PRIMARY KEY (
        "user_id"
     )
);

CREATE TABLE "Post" (
    "post_id" int   NOT NULL,
    "title" text   NOT NULL,
    "text" text   NOT NULL,
    "user_id" int   NOT NULL,
    "region_id" int   NOT NULL,
    CONSTRAINT "pk_Post" PRIMARY KEY (
        "post_id"
     )
);

CREATE TABLE "Category" (
    "category_id" int   NOT NULL,
    CONSTRAINT "pk_Category" PRIMARY KEY (
        "category_id"
     )
);

CREATE TABLE "PostCategory" (
    "post_id" int   NOT NULL,
    "category_id" int   NOT NULL
);

-- Free plan table limit reached. SUBSCRIBE for more.



ALTER TABLE "Visit" ADD CONSTRAINT "fk_Visit_patient_id" FOREIGN KEY("patient_id")
REFERENCES "Patient" ("patient_id");

ALTER TABLE "Visit" ADD CONSTRAINT "fk_Visit_doctor_id" FOREIGN KEY("doctor_id")
REFERENCES "Doctor" ("doctor_id");

ALTER TABLE "Diagnosis" ADD CONSTRAINT "fk_Diagnosis_visit_id" FOREIGN KEY("visit_id")
REFERENCES "Visit" ("visit_id");

ALTER TABLE "Diagnosis" ADD CONSTRAINT "fk_Diagnosis_disease_id" FOREIGN KEY("disease_id")
REFERENCES "Disease" ("disease_id");

ALTER TABLE "User" ADD CONSTRAINT "fk_User_preferred_region_id" FOREIGN KEY("preferred_region_id")
REFERENCES "Region" ("region_id");

ALTER TABLE "Post" ADD CONSTRAINT "fk_Post_user_id" FOREIGN KEY("user_id")
REFERENCES "User" ("user_id");

ALTER TABLE "Post" ADD CONSTRAINT "fk_Post_region_id" FOREIGN KEY("region_id")
REFERENCES "Region" ("region_id");

ALTER TABLE "PostCategory" ADD CONSTRAINT "fk_PostCategory_post_id" FOREIGN KEY("post_id")
REFERENCES "Post" ("post_id");

ALTER TABLE "PostCategory" ADD CONSTRAINT "fk_PostCategory_category_id" FOREIGN KEY("category_id")
REFERENCES "Category" ("category_id");

-- Free plan table limit reached. SUBSCRIBE for more.



-- Free plan table limit reached. SUBSCRIBE for more.



