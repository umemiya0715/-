import axios from '../../plugins/axios.js';

export default {
  namespaced: true,
  state: {
    accountData: []
  },
  getters: {
    accountData: state => state.accountData
  },
  mutations: {
    setAccountData: (state, accountData) => {
      const dataArray = []
      dataArray.push(accountData.troversion)
      dataArray.push(accountData.tweets)
      state.accountData = dataArray
    }
  },
  actions: {
    fetchAccountData ({ commit }, targetAccount) {
      axios.post('/api/v1/accountData', { accountData: targetAccount })
        .then(res => {
          commit('setAccountData', res.data)
        })
        .catch(err => console.log(err.response));
    },
  }
}