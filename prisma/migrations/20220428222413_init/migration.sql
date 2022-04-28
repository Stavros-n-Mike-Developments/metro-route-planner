-- AlterTable
CREATE SEQUENCE "lines_stations_id_seq";
ALTER TABLE "lines_stations" ALTER COLUMN "id" SET DEFAULT nextval('lines_stations_id_seq');
ALTER SEQUENCE "lines_stations_id_seq" OWNED BY "lines_stations"."id";

-- AlterTable
CREATE SEQUENCE "route_steps_id_seq";
ALTER TABLE "route_steps" ALTER COLUMN "id" SET DEFAULT nextval('route_steps_id_seq');
ALTER SEQUENCE "route_steps_id_seq" OWNED BY "route_steps"."id";

-- AlterTable
CREATE SEQUENCE "routes_id_seq";
ALTER TABLE "routes" ALTER COLUMN "id" SET DEFAULT nextval('routes_id_seq');
ALTER SEQUENCE "routes_id_seq" OWNED BY "routes"."id";

-- AlterTable
CREATE SEQUENCE "stations_id_seq";
ALTER TABLE "stations" ALTER COLUMN "id" SET DEFAULT nextval('stations_id_seq');
ALTER SEQUENCE "stations_id_seq" OWNED BY "stations"."id";

-- AlterTable
CREATE SEQUENCE "steps_id_seq";
ALTER TABLE "steps" ALTER COLUMN "id" SET DEFAULT nextval('steps_id_seq');
ALTER SEQUENCE "steps_id_seq" OWNED BY "steps"."id";
