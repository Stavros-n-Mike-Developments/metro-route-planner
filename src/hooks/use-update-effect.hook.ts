import { useEffect, useRef } from "react";

export default (callback: () => void | (() => void), dependencies: any[]) => {
	const firstRenderRef = useRef(true);

	useEffect(() => {
		if (firstRenderRef.current) {
			firstRenderRef.current = false;
			return;
		}

		return callback();
	}, [...dependencies, callback]);
};
