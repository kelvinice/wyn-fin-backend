/*
  Warnings:

  - The primary key for the `Budget` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `Budget` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `Classification` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `Classification` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `Period` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `Period` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `Source` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `Source` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `Spending` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `Spending` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `SpendingType` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `SpendingType` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `User` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `User` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - A unique constraint covering the columns `[secureId]` on the table `Budget` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[secureId]` on the table `Classification` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[secureId]` on the table `Period` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[secureId]` on the table `Source` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[secureId]` on the table `Spending` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[secureId]` on the table `SpendingType` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[secureId]` on the table `User` will be added. If there are existing duplicate values, this will fail.
  - The required column `secureId` was added to the `Budget` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.
  - Changed the type of `periodId` on the `Budget` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `classificationId` on the `Budget` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - The required column `secureId` was added to the `Classification` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.
  - Changed the type of `userId` on the `Classification` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - The required column `secureId` was added to the `Period` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.
  - Changed the type of `userId` on the `Period` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - The required column `secureId` was added to the `Source` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.
  - Changed the type of `userId` on the `Source` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - The required column `secureId` was added to the `Spending` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.
  - Changed the type of `periodId` on the `Spending` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `classificationId` on the `Spending` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - The required column `secureId` was added to the `SpendingType` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.
  - The required column `secureId` was added to the `User` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.

*/
-- DropForeignKey
ALTER TABLE "Budget" DROP CONSTRAINT "Budget_classificationId_fkey";

-- DropForeignKey
ALTER TABLE "Budget" DROP CONSTRAINT "Budget_periodId_fkey";

-- DropForeignKey
ALTER TABLE "Classification" DROP CONSTRAINT "Classification_userId_fkey";

-- DropForeignKey
ALTER TABLE "Period" DROP CONSTRAINT "Period_userId_fkey";

-- DropForeignKey
ALTER TABLE "Source" DROP CONSTRAINT "Source_userId_fkey";

-- DropForeignKey
ALTER TABLE "Spending" DROP CONSTRAINT "Spending_classificationId_fkey";

-- DropForeignKey
ALTER TABLE "Spending" DROP CONSTRAINT "Spending_periodId_fkey";

-- AlterTable
ALTER TABLE "Budget" DROP CONSTRAINT "Budget_pkey",
ADD COLUMN     "secureId" TEXT NOT NULL,
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
DROP COLUMN "periodId",
ADD COLUMN     "periodId" INTEGER NOT NULL,
DROP COLUMN "classificationId",
ADD COLUMN     "classificationId" INTEGER NOT NULL,
ADD CONSTRAINT "Budget_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "Classification" DROP CONSTRAINT "Classification_pkey",
ADD COLUMN     "secureId" TEXT NOT NULL,
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
DROP COLUMN "userId",
ADD COLUMN     "userId" INTEGER NOT NULL,
ADD CONSTRAINT "Classification_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "Period" DROP CONSTRAINT "Period_pkey",
ADD COLUMN     "secureId" TEXT NOT NULL,
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
DROP COLUMN "userId",
ADD COLUMN     "userId" INTEGER NOT NULL,
ADD CONSTRAINT "Period_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "Source" DROP CONSTRAINT "Source_pkey",
ADD COLUMN     "secureId" TEXT NOT NULL,
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
DROP COLUMN "userId",
ADD COLUMN     "userId" INTEGER NOT NULL,
ADD CONSTRAINT "Source_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "Spending" DROP CONSTRAINT "Spending_pkey",
ADD COLUMN     "secureId" TEXT NOT NULL,
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
DROP COLUMN "periodId",
ADD COLUMN     "periodId" INTEGER NOT NULL,
DROP COLUMN "classificationId",
ADD COLUMN     "classificationId" INTEGER NOT NULL,
ADD CONSTRAINT "Spending_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "SpendingType" DROP CONSTRAINT "SpendingType_pkey",
ADD COLUMN     "secureId" TEXT NOT NULL,
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD CONSTRAINT "SpendingType_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "User" DROP CONSTRAINT "User_pkey",
ADD COLUMN     "secureId" TEXT NOT NULL,
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD CONSTRAINT "User_pkey" PRIMARY KEY ("id");

-- CreateIndex
CREATE UNIQUE INDEX "Budget_secureId_key" ON "Budget"("secureId");

-- CreateIndex
CREATE UNIQUE INDEX "Classification_secureId_key" ON "Classification"("secureId");

-- CreateIndex
CREATE UNIQUE INDEX "Period_secureId_key" ON "Period"("secureId");

-- CreateIndex
CREATE UNIQUE INDEX "Source_secureId_key" ON "Source"("secureId");

-- CreateIndex
CREATE UNIQUE INDEX "Spending_secureId_key" ON "Spending"("secureId");

-- CreateIndex
CREATE UNIQUE INDEX "SpendingType_secureId_key" ON "SpendingType"("secureId");

-- CreateIndex
CREATE UNIQUE INDEX "User_secureId_key" ON "User"("secureId");

-- AddForeignKey
ALTER TABLE "Classification" ADD CONSTRAINT "Classification_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Source" ADD CONSTRAINT "Source_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Period" ADD CONSTRAINT "Period_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Budget" ADD CONSTRAINT "Budget_periodId_fkey" FOREIGN KEY ("periodId") REFERENCES "Period"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Budget" ADD CONSTRAINT "Budget_classificationId_fkey" FOREIGN KEY ("classificationId") REFERENCES "Classification"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Spending" ADD CONSTRAINT "Spending_periodId_fkey" FOREIGN KEY ("periodId") REFERENCES "Period"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Spending" ADD CONSTRAINT "Spending_classificationId_fkey" FOREIGN KEY ("classificationId") REFERENCES "Classification"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
