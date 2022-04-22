import { configureStore } from "@reduxjs/toolkit";

const store = configureStore({
	reducer: {},
});

export default store;
export { useSelector, useDispatch } from "store/store.helpers";
