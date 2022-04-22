import { useEffect } from "react";
import useTimeout from "use-timeout";

export default (callback: TimerHandler, delay: number, dependencies: any[]) => {
	const { reset, clear } = useTimeout(callback, delay);

	useEffect(reset, [...dependencies, reset]);
	useEffect(clear, [clear]);
};
