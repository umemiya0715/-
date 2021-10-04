import axios from '../../plugins/axios.js';

export default {
  namespaced: true,
  state: {
    accountdata: []
  },
  getters: {
    accountdata: state => state.accountdata,
  },
  mutations: {
    setAccountdata: (state, accountdata) => {
      state.accountdata = accountdata
    },
  },
  actions: {
    fetchAccountdata ({ commit }, targetId) {
      axios.post('/v1/accountdata', { screen_name: targetId } )
        .then(res => {
          commit('setAccountdata', res.data)
        })
        .catch(err => console.log(err.response));
    },
  }
}