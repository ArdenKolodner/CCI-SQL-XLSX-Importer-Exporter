BEGIN TRANSACTION;
CREATE TABLE "People" (
	id INTEGER NOT NULL,
	"Name" VARCHAR(255),
	"Nickname" VARCHAR(255),
  PRIMARY KEY (id)
);
INSERT INTO "People" VALUES('1','Nicholas','Nick');
INSERT INTO "People" VALUES('2','Lillian','Lily');
INSERT INTO "People" VALUES('3','Jane','Jenny');
INSERT INTO "People" VALUES('4','Wenceslas','');
CREATE TABLE "Rocks" (
	id INTEGER NOT NULL,
	"Type" VARCHAR(255),
	"Origin" VARCHAR(255),
  PRIMARY KEY (id)
);
INSERT INTO "Rocks" VALUES('1','Limestone','a mysterious cave');
INSERT INTO "Rocks" VALUES('2','Granite','a riverbed, long since dried up');
INSERT INTO "Rocks" VALUES('3','Obsidian','found under my pillow after a particulaly wild night');
INSERT INTO "Rocks" VALUES('4','Gneiss','saw it by the side of the road and thought it looked gneiss');
INSERT INTO "Rocks" VALUES('5','Chunk of Plastic','');
INSERT INTO "Rocks" VALUES('6','Sandstone','a pile of sand had an unfortunate run-in with Medusa');
COMMIT;
