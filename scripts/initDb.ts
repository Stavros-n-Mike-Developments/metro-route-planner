import { PrismaClient } from "@prisma/client";

const main = async () => {
	const prisma = new PrismaClient();
};

main()
	.catch(error => console.log(error))
	.finally(() => process.exit(0));
