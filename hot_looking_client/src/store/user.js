export default {
  namespaced: true,
  //返回该模块下存储的应用状态
  state() {
    return {
      //用户信息
      profile: {
        //用户id
        uId: "",
        avatar: "",
        name: "",
        account: "",
        password: "",
        token: "",
      },
    };
  },
  mutations: {
    /**
     * 设置用户信息
     * @param state 状态对象
     * @param user 用户信息
     */
    setUser(state, user) {
      //判断 user 对象是否是空对象
      if (Object.keys(user).length > 0) {
        //不是空对象的情况,表示要进行用户信息的修改
        state.profile = { ...state.profile, ...user };
      } else {
        //是空对象 表示要进行用户信息的清除
        state.profile = {};
      }
    },
  },
  actions: {},
};
