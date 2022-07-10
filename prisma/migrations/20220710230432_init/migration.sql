/*
  Warnings:

  - You are about to drop the column `line_id` on the `lines_stations` table. All the data in the column will be lost.
  - You are about to drop the column `next_station_id` on the `lines_stations` table. All the data in the column will be lost.
  - You are about to drop the column `station_id` on the `lines_stations` table. All the data in the column will be lost.
  - You are about to drop the column `from_station_id` on the `routes` table. All the data in the column will be lost.
  - You are about to drop the column `to_station_id` on the `routes` table. All the data in the column will be lost.
  - You are about to drop the column `ending_object_id` on the `steps` table. All the data in the column will be lost.
  - You are about to drop the column `ending_object_type` on the `steps` table. All the data in the column will be lost.
  - You are about to drop the column `starting_object_id` on the `steps` table. All the data in the column will be lost.
  - You are about to drop the column `starting_object_type` on the `steps` table. All the data in the column will be lost.
  - You are about to drop the `route_steps` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[nextStepId]` on the table `steps` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `lineId` to the `lines_stations` table without a default value. This is not possible if the table is not empty.
  - Added the required column `stationId` to the `lines_stations` table without a default value. This is not possible if the table is not empty.
  - Added the required column `fromStationId` to the `routes` table without a default value. This is not possible if the table is not empty.
  - Added the required column `toStationId` to the `routes` table without a default value. This is not possible if the table is not empty.
  - Added the required column `endingObjectId` to the `steps` table without a default value. This is not possible if the table is not empty.
  - Added the required column `endingObjectType` to the `steps` table without a default value. This is not possible if the table is not empty.
  - Added the required column `routeId` to the `steps` table without a default value. This is not possible if the table is not empty.
  - Added the required column `startingObjectId` to the `steps` table without a default value. This is not possible if the table is not empty.
  - Added the required column `startingObjectType` to the `steps` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "lines_stations" DROP CONSTRAINT "fkey_lines";

-- DropForeignKey
ALTER TABLE "lines_stations" DROP CONSTRAINT "fkey_next_station";

-- DropForeignKey
ALTER TABLE "lines_stations" DROP CONSTRAINT "fkey_stations";

-- DropForeignKey
ALTER TABLE "route_steps" DROP CONSTRAINT "fkey_next_step";

-- DropForeignKey
ALTER TABLE "route_steps" DROP CONSTRAINT "fkey_route";

-- DropForeignKey
ALTER TABLE "route_steps" DROP CONSTRAINT "fkey_step";

-- DropForeignKey
ALTER TABLE "routes" DROP CONSTRAINT "fkey_station_to";

-- DropForeignKey
ALTER TABLE "routes" DROP CONSTRAINT "fkey_station_from";

-- AlterTable
ALTER TABLE "lines_stations" DROP COLUMN "line_id",
DROP COLUMN "next_station_id",
DROP COLUMN "station_id",
ADD COLUMN     "lineId" INTEGER NOT NULL,
ADD COLUMN     "nextStationId" INTEGER,
ADD COLUMN     "stationId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "routes" DROP COLUMN "from_station_id",
DROP COLUMN "to_station_id",
ADD COLUMN     "fromStationId" INTEGER NOT NULL,
ADD COLUMN     "toStationId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "steps" DROP COLUMN "ending_object_id",
DROP COLUMN "ending_object_type",
DROP COLUMN "starting_object_id",
DROP COLUMN "starting_object_type",
ADD COLUMN     "endingObjectId" INTEGER NOT NULL,
ADD COLUMN     "endingObjectType" VARCHAR(255) NOT NULL,
ADD COLUMN     "nextStepId" INTEGER,
ADD COLUMN     "routeId" INTEGER NOT NULL,
ADD COLUMN     "startingObjectId" INTEGER NOT NULL,
ADD COLUMN     "startingObjectType" VARCHAR(255) NOT NULL;

-- DropTable
DROP TABLE "route_steps";

-- CreateIndex
CREATE UNIQUE INDEX "steps_nextStepId_key" ON "steps"("nextStepId");

-- AddForeignKey
ALTER TABLE "lines_stations" ADD CONSTRAINT "lines_stations_lineId_fkey" FOREIGN KEY ("lineId") REFERENCES "lines"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lines_stations" ADD CONSTRAINT "lines_stations_stationId_fkey" FOREIGN KEY ("stationId") REFERENCES "stations"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "lines_stations" ADD CONSTRAINT "lines_stations_nextStationId_fkey" FOREIGN KEY ("nextStationId") REFERENCES "stations"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "steps" ADD CONSTRAINT "steps_routeId_fkey" FOREIGN KEY ("routeId") REFERENCES "routes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "steps" ADD CONSTRAINT "steps_nextStepId_fkey" FOREIGN KEY ("nextStepId") REFERENCES "steps"("id") ON DELETE SET NULL ON UPDATE CASCADE;
