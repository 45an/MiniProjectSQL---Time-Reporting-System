CREATE TABLE "public"."mus_project" ( 
  "id" SERIAL,
  "project_name" VARCHAR(30) NOT NULL,
  CONSTRAINT "mus_project_pkey" PRIMARY KEY ("id")
);
CREATE TABLE "public"."mus_project_person" ( 
  "id" SERIAL,
  "project_id" INTEGER NOT NULL,
  "person_id" INTEGER NOT NULL,
  "hours" INTEGER NOT NULL,
  CONSTRAINT "mus_project_person_pkey" PRIMARY KEY ("id")
);
CREATE TABLE "public"."mus_person" ( 
  "id" SERIAL,
  "person_name" VARCHAR(50) NOT NULL,
  CONSTRAINT "mus_person_pkey" PRIMARY KEY ("id")
);
ALTER TABLE "public"."mus_project" DISABLE TRIGGER ALL;
ALTER TABLE "public"."mus_project_person" DISABLE TRIGGER ALL;
ALTER TABLE "public"."mus_person" DISABLE TRIGGER ALL;
INSERT INTO "public"."mus_project" ("project_name") VALUES ('BankApplication');
INSERT INTO "public"."mus_project" ("project_name") VALUES ('Database');
INSERT INTO "public"."mus_project" ("project_name") VALUES ('Dataarchitecture');
INSERT INTO "public"."mus_project" ("project_name") VALUES ('APITesting');
INSERT INTO "public"."mus_project" ("project_name") VALUES ('BugFix');
INSERT INTO "public"."mus_project" ("project_name") VALUES ('Fix Extern API');
INSERT INTO "public"."mus_project" ("project_name") VALUES ('Small SQL Project');
INSERT INTO "public"."mus_project" ("project_name") VALUES ('Learning React');
INSERT INTO "public"."mus_project" ("project_name") VALUES ('Fix isseus in DataBase');
INSERT INTO "public"."mus_project" ("project_name") VALUES ('Lerning JavaScript');
INSERT INTO "public"."mus_project" ("project_name") VALUES ('Bulding a Mobile Game');
INSERT INTO "public"."mus_project_person" ("project_id", "person_id", "hours") VALUES (3, 4, 7);
INSERT INTO "public"."mus_project_person" ("project_id", "person_id", "hours") VALUES (1, 3, 6);
INSERT INTO "public"."mus_project_person" ("project_id", "person_id", "hours") VALUES (2, 2, 8);
INSERT INTO "public"."mus_project_person" ("project_id", "person_id", "hours") VALUES (6, 7, 5);
INSERT INTO "public"."mus_project_person" ("project_id", "person_id", "hours") VALUES (7, 9, 7);
INSERT INTO "public"."mus_project_person" ("project_id", "person_id", "hours") VALUES (8, 10, 5);
INSERT INTO "public"."mus_project_person" ("project_id", "person_id", "hours") VALUES (9, 11, 2);
INSERT INTO "public"."mus_project_person" ("project_id", "person_id", "hours") VALUES (10, 13, 4);
INSERT INTO "public"."mus_project_person" ("project_id", "person_id", "hours") VALUES (11, 14, 6);
INSERT INTO "public"."mus_project_person" ("project_id", "person_id", "hours") VALUES (12, 15, 5);
INSERT INTO "public"."mus_person" ("person_name") VALUES ('Muse');
INSERT INTO "public"."mus_person" ("person_name") VALUES ('Mbappe');
INSERT INTO "public"."mus_person" ("person_name") VALUES ('Krille');
INSERT INTO "public"."mus_person" ("person_name") VALUES ('Messi');
INSERT INTO "public"."mus_person" ("person_name") VALUES ('Frank');
INSERT INTO "public"."mus_person" ("person_name") VALUES ('Fredrik');
INSERT INTO "public"."mus_person" ("person_name") VALUES ('KalleAnka');
INSERT INTO "public"."mus_person" ("person_name") VALUES ('Caius');
INSERT INTO "public"."mus_person" ("person_name") VALUES ('Mohib');
INSERT INTO "public"."mus_person" ("person_name") VALUES ('Zlatan');
INSERT INTO "public"."mus_person" ("person_name") VALUES ('Hassan');
INSERT INTO "public"."mus_person" ("person_name") VALUES ('Felix');
INSERT INTO "public"."mus_person" ("person_name") VALUES ('Anders');
ALTER TABLE "public"."mus_project" ENABLE TRIGGER ALL;
ALTER TABLE "public"."mus_project_person" ENABLE TRIGGER ALL;
ALTER TABLE "public"."mus_person" ENABLE TRIGGER ALL;
ALTER TABLE "public"."mus_project_person" ADD CONSTRAINT "FK_mus_project_person_project_id" FOREIGN KEY ("project_id") REFERENCES "public"."mus_project" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."mus_project_person" ADD CONSTRAINT "FK_mus_person_project_person_id" FOREIGN KEY ("person_id") REFERENCES "public"."mus_person" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
