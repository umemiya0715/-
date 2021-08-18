import axios from '../../plugins/axios'

const state = {
  accountData: []
}

const getters = {
  accountData: state => state.accountData
}

const mutations = {
  setAccountData: (state, accountData) => {
    const dataArray = []
    dataArray.push(accountData.troversion)
    dataArray.push(accountData.tweets)
    state.accountData = dataArray
  }
}

const actions = {
  fetchAccountData ({ commit }, accountData) {
    return this.$axios.$post('/api/v1/accountdata', { accountdata: accountData })
      .then(res => commit('setAccountData', res))
  }
}

export default {
  namespaced: true,
  state,
  getters,
  mutations,
  actions
}