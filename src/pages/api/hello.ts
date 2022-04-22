import type { NextApiHandler } from "next";

export interface Response {
	name: string;
}

const handler: NextApiHandler<Response> = (req, res) => {
	res.status(200).json({ name: "John Doe" });
};

export default handler;
