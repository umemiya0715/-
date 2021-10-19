import axios from '../../plugins/axios.js';

const state = {
  accounts: [],
  dragonId: 0
}

const getters = {
  accounts: state => state.accounts,
  dragonId: state => state.dragonId
}

const mutations = {
  setAccount: (state, accounts) => {
    state.accounts = accounts
    state.dragonId = accounts.dragonId
  },
}

const actions = {
  async fetchAccount ({ commit }, targetId) {
    await axios.post('/v1/accounts', { screen_name: targetId } )
      .then(res => {
        commit('setAccount', res.data)
      })
      .catch(err => console.log(err.response));
  },
}

export default {
  namespaced: true,
  state,
  getters,
  mutations,
  actions
}