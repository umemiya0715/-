export const state = () => ({
  accountData: []
})

export const getters = {
  accountData: state => state.accountData
}

export const mutations = {
  setAccountData: (state, accountData) => {
    const dataArray = []
    dataArray.push(accountData.troversion)
    dataArray.push(accountData.tweets)
    state.accountData = dataArray
  }
}

export const actions = {
  fetchAccountData ({ commit }, accountData) {
    return this.$axios.$post('/api/v1/accountdata', { accountdata: accountData })
      .then(res => commit('setAccountData', res))
  }
}