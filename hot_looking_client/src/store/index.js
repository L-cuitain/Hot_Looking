import { createStore } from "vuex";
import user from "@/store/user";
//引入 vuex-persistedstate插件
import createPersistedState from "vuex-persistedstate";

export default createStore({
  //配置
  plugins: [
    createPersistedState({
      //数据存储在 localStorage 时的 key
      key: "User",
      //指定将哪些模块中的数据同步到本地
      paths: ["user"],
    }),
  ],
  modules: {
    user,
  },
});
