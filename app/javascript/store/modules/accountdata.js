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
      const dataArray = []
      dataArray.push(accountdata.troversion)
      dataArray.push(accountdata.tweets)
      state.accountdata = dataArray
    }
  },
  actions: {
    fetchAccountdata ({ commit }, targetAccount) {
     axios.get('/v1/accountdata', { accountdata: targetAccount })
        .then(res => {
          commit('setAccountdata', res.data)
        })
        .catch(err => console.log(err.response));
    },
  }
}