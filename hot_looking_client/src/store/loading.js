export default {
  namespaced: true,
  state() {
    return {
      loading: false,
    };
  },

  mutations: {
    setLoading(state, isLoading) {
      state.loading = isLoading;
    },
  },
};
