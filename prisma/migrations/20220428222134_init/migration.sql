-- CreateTable
CREATE TABLE "lines" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,

    CONSTRAINT "lines_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lines_stations" (
    "id" INTEGER NOT NULL,
    "station_id" INTEGER NOT NULL,
    "line_id" INTEGER NOT NULL,
    "next_station_id" INTEGER,

    CONSTRAINT "lines_stations_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "route_steps" (
    "id" INTEGER NOT NULL,
    "route_id" INTEGER NOT NULL,
    "step_id" INTEGER NOT NULL,
    "next_step_id" INTEGER,

    CONSTRAINT "route_steps_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "routes" (
    "id" INTEGER NOT NULL,
    "from_station_id" INTEGER NOT NULL,
    "to_station_id" INTEGER NOT NULL,

    CONSTRAINT "routes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "stations" (
    "id" INTEGER NOT NULL,
    "name" VARCHAR(255) NOT NULL,

    CONSTRAINT "stations_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "steps" (
    "id" INTEGER NOT NULL,
    "starting_object_type" VARCHAR(255) NOT NULL,
    "starting_object_id" INTEGER NOT NULL,
    "ending_object_type" VARCHAR(255) NOT NULL,
    "ending_object_id" INTEGER NOT NULL,

    CONSTRAINT "steps_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "lines_stations" ADD CONSTRAINT "fkey_lines" FOREIGN KEY ("line_id") REFERENCES "lines"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "lines_stations" ADD CONSTRAINT "fkey_next_station" FOREIGN KEY ("next_station_id") REFERENCES "stations"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "lines_stations" ADD CONSTRAINT "fkey_stations" FOREIGN KEY ("station_id") REFERENCES "stations"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "route_steps" ADD CONSTRAINT "fkey_route" FOREIGN KEY ("route_id") REFERENCES "routes"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "route_steps" ADD CONSTRAINT "fkey_next_step" FOREIGN KEY ("next_step_id") REFERENCES "steps"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "route_steps" ADD CONSTRAINT "fkey_step" FOREIGN KEY ("step_id") REFERENCES "steps"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "routes" ADD CONSTRAINT "fkey_station_to" FOREIGN KEY ("from_station_id") REFERENCES "stations"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "routes" ADD CONSTRAINT "fkey_station_from" FOREIGN KEY ("to_station_id") REFERENCES "stations"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
