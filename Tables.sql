-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Relationships

CREATE TABLE "World_Cups" (
    "cup_id" INT   NOT NULL,
    "country_id" TEXT   NOT NULL,
    "attendees" INT   NOT NULL,
    "goals" INT   NOT NULL,
    CONSTRAINT "pk_World_Cups" PRIMARY KEY (
        "cup_id"
     )
);

CREATE TABLE "Participants" (
    "cup_id" INT   NOT NULL,
    "country_id" TEXT   NOT NULL,
    "place" TEXT   NOT NULL,
    CONSTRAINT "pk_Participants" PRIMARY KEY (
        "cup_id","country_id"
     )
);

CREATE TABLE "Country" (
    "country_id" TEXT   NOT NULL,
    "name" TEXT   NOT NULL,
    CONSTRAINT "pk_Country" PRIMARY KEY (
        "country_id"
     )
);

CREATE TABLE "Match" (
    "match_id" INT   NOT NULL,
    "round_id" INT   NOT NULL,
    "cup_id" INT   NOT NULL,
    "stage" TEXT   NOT NULL,
    "city" TEXT   NOT NULL,
    "stadium" TEXT   NOT NULL,
    "attendees" INT   NOT NULL,
    CONSTRAINT "pk_Match" PRIMARY KEY (
        "match_id"
     )
);

CREATE TABLE "Referee" (
    "match_id" INT   NOT NULL,
    "status" TEXT   NOT NULL,
    "name" TEXT   NOT NULL,
    CONSTRAINT "pk_Referee" PRIMARY KEY (
        "match_id","status"
     )
);

CREATE TABLE "Player" (
    "player_id" INT   NOT NULL,
    "name" TEXT   NOT NULL,
    CONSTRAINT "pk_Player" PRIMARY KEY (
        "player_id"
     )
);

CREATE TABLE "Roster" (
    "match_id" INT   NOT NULL,
    "country_id" TEXT   NOT NULL,
    "locality" TEXT   NOT NULL,
    "player_id" INT   NOT NULL,
    "shirt_no" INT   NOT NULL,
    "line-up" TEXT   NOT NULL,
    CONSTRAINT "pk_Roster" PRIMARY KEY (
        "match_id","country_id","player_id"
     )
);

CREATE TABLE "Coaches" (
    "country_id" TEXT   NOT NULL,
    "cup_id" INT   NOT NULL,
    "coach_id" INT   NOT NULL,
    "coach_name" TEXT   NOT NULL,
    CONSTRAINT "pk_Coaches" PRIMARY KEY (
        "coach_id"
     )
);

CREATE TABLE "Events" (
    "event_id" INT   NOT NULL,
    "event" TEXT   NOT NULL,
    "match_id" INT   NOT NULL,
    "country_id" TEXT   NOT NULL,
    "player_id" INT   NOT NULL,
	CONSTRAINT "pk_Events" PRIMARY KEY (
        "event_id"
	)
);

ALTER TABLE "World_Cups" ADD CONSTRAINT "fk_World_Cups_country_id" FOREIGN KEY("country_id")
REFERENCES "Country" ("country_id");

ALTER TABLE "Participants" ADD CONSTRAINT "fk_Participants_cup_id" FOREIGN KEY("cup_id")
REFERENCES "World_Cups" ("cup_id");

ALTER TABLE "Participants" ADD CONSTRAINT "fk_Participants_country_id" FOREIGN KEY("country_id")
REFERENCES "Country" ("country_id");

ALTER TABLE "Match" ADD CONSTRAINT "fk_Match_cup_id" FOREIGN KEY("cup_id")
REFERENCES "World_Cups" ("cup_id");

ALTER TABLE "Referee" ADD CONSTRAINT "fk_Referee_match_id" FOREIGN KEY("match_id")
REFERENCES "Match" ("match_id");

ALTER TABLE "Roster" ADD CONSTRAINT "fk_Roster_match_id" FOREIGN KEY("match_id")
REFERENCES "Match" ("match_id");

ALTER TABLE "Roster" ADD CONSTRAINT "fk_Roster_country_id" FOREIGN KEY("country_id")
REFERENCES "Country" ("country_id");

ALTER TABLE "Roster" ADD CONSTRAINT "fk_Roster_player_id" FOREIGN KEY("player_id")
REFERENCES "Player" ("player_id");

ALTER TABLE "Coaches" ADD CONSTRAINT "fk_Coaches_country_id" FOREIGN KEY("country_id")
REFERENCES "Country" ("country_id");

ALTER TABLE "Coaches" ADD CONSTRAINT "fk_Coaches_cup_id" FOREIGN KEY("cup_id")
REFERENCES "World_Cups" ("cup_id");

ALTER TABLE "Events" ADD CONSTRAINT "fk_Events_match_id" FOREIGN KEY("match_id")
REFERENCES "Match" ("match_id");

ALTER TABLE "Events" ADD CONSTRAINT "fk_Events_country_id" FOREIGN KEY("country_id")
REFERENCES "Country" ("country_id");

ALTER TABLE "Events" ADD CONSTRAINT "fk_Events_player_id" FOREIGN KEY("player_id")
REFERENCES "Player" ("player_id");

