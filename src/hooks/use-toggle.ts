import { useState } from "react";

export default (defaultValue: boolean) => {
	const [values, setValues] = useState(defaultValue);

	const toggleValue = (value?: boolean) =>
		setValues(currentValue =>
			typeof value === "boolean" ? value : !currentValue
		);

	return [values, toggleValue];
};
