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
INSERT INTO "public"."mus_project" ("id", "project_name") VALUES (3, 'BankApplication');
INSERT INTO "public"."mus_project" ("id", "project_name") VALUES (2, 'Database');
INSERT INTO "public"."mus_project" ("id", "project_name") VALUES (4, 'Dataarchitecture');
INSERT INTO "public"."mus_project" ("id", "project_name") VALUES (1, 'APITesting');
INSERT INTO "public"."mus_project" ("id", "project_name") VALUES (6, 'BugFix');
INSERT INTO "public"."mus_project" ("id", "project_name") VALUES (7, 'Fix Extern API');
INSERT INTO "public"."mus_project" ("id", "project_name") VALUES (8, 'Small SQL Project');
INSERT INTO "public"."mus_project" ("id", "project_name") VALUES (9, 'Learning React');
INSERT INTO "public"."mus_project" ("id", "project_name") VALUES (10, 'Fix isseus in DataBase');
INSERT INTO "public"."mus_project" ("id", "project_name") VALUES (11, 'Lerning JavaScript');
INSERT INTO "public"."mus_project_person" ("id", "project_id", "person_id", "hours") VALUES (2, 3, 4, 7);
INSERT INTO "public"."mus_project_person" ("id", "project_id", "person_id", "hours") VALUES (1, 1, 3, 6);
INSERT INTO "public"."mus_project_person" ("id", "project_id", "person_id", "hours") VALUES (4, 2, 2, 8);
INSERT INTO "public"."mus_project_person" ("id", "project_id", "person_id", "hours") VALUES (6, 6, 7, 5);
INSERT INTO "public"."mus_project_person" ("id", "project_id", "person_id", "hours") VALUES (7, 7, 9, 7);
INSERT INTO "public"."mus_project_person" ("id", "project_id", "person_id", "hours") VALUES (10, 8, 10, 5);
INSERT INTO "public"."mus_project_person" ("id", "project_id", "person_id", "hours") VALUES (11, 9, 11, 2);
INSERT INTO "public"."mus_project_person" ("id", "project_id", "person_id", "hours") VALUES (12, 10, 13, 4);
INSERT INTO "public"."mus_project_person" ("id", "project_id", "person_id", "hours") VALUES (13, 11, 14, 6);
INSERT INTO "public"."mus_person" ("id", "person_name") VALUES (1, 'Muse');
INSERT INTO "public"."mus_person" ("id", "person_name") VALUES (2, 'Mbappe');
INSERT INTO "public"."mus_person" ("id", "person_name") VALUES (3, 'Krille');
INSERT INTO "public"."mus_person" ("id", "person_name") VALUES (4, 'Messi');
INSERT INTO "public"."mus_person" ("id", "person_name") VALUES (5, 'Frank');
INSERT INTO "public"."mus_person" ("id", "person_name") VALUES (6, 'Fredrik');
INSERT INTO "public"."mus_person" ("id", "person_name") VALUES (7, 'KalleAnka');
INSERT INTO "public"."mus_person" ("id", "person_name") VALUES (9, 'Caius');
INSERT INTO "public"."mus_person" ("id", "person_name") VALUES (10, 'Mohib');
INSERT INTO "public"."mus_person" ("id", "person_name") VALUES (11, 'Zlatan');
INSERT INTO "public"."mus_person" ("id", "person_name") VALUES (13, 'Hassan');
INSERT INTO "public"."mus_person" ("id", "person_name") VALUES (14, 'Felix');
ALTER TABLE "public"."mus_project" ENABLE TRIGGER ALL;
ALTER TABLE "public"."mus_project_person" ENABLE TRIGGER ALL;
ALTER TABLE "public"."mus_person" ENABLE TRIGGER ALL;
ALTER TABLE "public"."mus_project_person" ADD CONSTRAINT "FK_mus_project_person_project_id" FOREIGN KEY ("project_id") REFERENCES "public"."mus_project" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."mus_project_person" ADD CONSTRAINT "FK_mus_person_project_person_id" FOREIGN KEY ("person_id") REFERENCES "public"."mus_person" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;