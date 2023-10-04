/*
  Warnings:

  - You are about to drop the column `createAt` on the `categories` table. All the data in the column will be lost.
  - You are about to drop the column `updateAt` on the `categories` table. All the data in the column will be lost.
  - You are about to drop the column `category_id` on the `products` table. All the data in the column will be lost.
  - You are about to drop the column `user_id` on the `products` table. All the data in the column will be lost.
  - You are about to drop the column `createAt` on the `users` table. All the data in the column will be lost.
  - You are about to drop the column `updateAt` on the `users` table. All the data in the column will be lost.
  - You are about to drop the column `user_id` on the `users` table. All the data in the column will be lost.
  - You are about to drop the `customers` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `product_id` to the `products` table without a default value. This is not possible if the table is not empty.
  - Added the required column `use_id` to the `users` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `categories` DROP COLUMN `createAt`,
    DROP COLUMN `updateAt`,
    ADD COLUMN `createdAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    ADD COLUMN `updatedAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0);

-- AlterTable
ALTER TABLE `products` DROP COLUMN `category_id`,
    DROP COLUMN `user_id`,
    ADD COLUMN `product_id` BIGINT UNSIGNED NOT NULL;

-- AlterTable
ALTER TABLE `users` DROP COLUMN `createAt`,
    DROP COLUMN `updateAt`,
    DROP COLUMN `user_id`,
    ADD COLUMN `createdAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    ADD COLUMN `updatedAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    ADD COLUMN `use_id` BIGINT UNSIGNED NOT NULL;

-- DropTable
DROP TABLE `customers`;

-- AddForeignKey
ALTER TABLE `users` ADD CONSTRAINT `users_use_id_fkey` FOREIGN KEY (`use_id`) REFERENCES `categories`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
