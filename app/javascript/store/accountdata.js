export const state = () => ({
  accountdata: []
})

export const getters = {
  accountData: state => state.accountData
}

export const mutations = {
  setAccountData: (state, accountData) => {
    state.accountData = accountData
  }
}

export const actions = {
  fetchAccountData ({ commit }, accounrDataId) {
    return this.$axios.$get(`/api/v1/accountData/${accountDataId}`)
      .then(res => commit('setAccountData', res))
  }
}