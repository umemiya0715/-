import axios from '../../plugins/axios.js';

export default {
  namespaced: true,
  state: {
    account: []
  },
  getters: {
    account: state => state.account,
  },
  mutations: {
    setAccount: (state, account) => {
      state.account = account
    },
  },
  actions: {
    fetchAccount ({ commit }, targetId) {
      axios.post('/v1/accounts', { screen_name: targetId } )
        .then(res => {
          commit('setAccount', res.data)
        })
        .catch(err => console.log(err.response));
    },
  }
}