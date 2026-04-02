import { PrismaClient } from '@prisma/client'
const prisma = new PrismaClient()

async function main() {
  console.log('Migrating user roles...')
  const updated = await prisma.user.updateMany({
    where: {
      role: {
        in: ['customer', 'manager']
      }
    },
    data: {
      role: 'user'
    }
  })
  console.log(`Updated ${updated.count} users to the consolidated "user" role.`)
}

main()
  .catch(e => {
    console.error(e)
    process.exit(1)
  })
  .finally(async () => {
    await prisma.$disconnect()
  })
