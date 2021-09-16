import axios from '../../plugins/axios.js';

export default {
  namespaced: true,
  state: {
    accountdata: []
  },
  getters: {
    accountdata: state => state.accountdata
  },
  mutations: {
    setAccountdata: (state, accountdata) => {
      state.user = accountdata.user
      state.tweets = accountdata.tweets
    },
    addAccountdata (state, accountdata) {
      state.targetId = accountdata
    }
  },
  actions: {
    fetchAccountdata ({ commit }, targetId) {
      axios.post('/v1/accountdata', { accountdata: targetId } )
        .then(res => {
          commit('setAccountdata', res.data)
        })
        .catch(err => console.log(err.response));
    },
  }
}