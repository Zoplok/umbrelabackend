-- AlterTable
ALTER TABLE `drivers` ADD COLUMN `max_deliveries` INTEGER NOT NULL DEFAULT 3;

-- AlterTable
ALTER TABLE `orders` MODIFY `status` ENUM('Unassigned', 'Pending', 'Assigned', 'Picked Up', 'On The Way', 'Delivered') NOT NULL DEFAULT 'Unassigned';
