import { createApp } from "vue";
import App from "./App.vue";
import router from "./router";
import store from "./store";
import ElementPlus from "element-plus";
import "element-plus/dist/index.css";
//引入样式重置和公共样式
import "normalize.css";
import "@/assets/style/common.css";

createApp(App).use(store).use(router).use(ElementPlus).mount("#app");
