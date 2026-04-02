-- Step 1: Broaden the enum to include all possible values (old + new)
ALTER TABLE `users` MODIFY `role` ENUM('user', 'driver', 'admin', 'customer', 'manager') NOT NULL;

-- Step 2: Migrate data
UPDATE `users` SET `role` = 'user' WHERE `role` IN ('customer', 'manager');

-- Step 3: Narrow the enum to remove the old values
ALTER TABLE `users` MODIFY `role` ENUM('user', 'driver', 'admin') NOT NULL;
