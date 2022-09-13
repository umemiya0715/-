import axios from '../../plugins/axios.js';

const state = {
  results: [],
}

const getters = {
  results: state => state.results,
}

const mutations = {
  setResult: (state, results) => {
    state.results = results
  },
}

const actions = {
  async fetchResult ({ commit }, analyzeData) {
    await axios.post('/v1/results', {
      target_account: analyzeData.target_account,
      user_id: analyzeData.user_id
    })
      .then(res => {
        commit('setResult', res.data)
      })
      .catch(err => {
        return err.response.status
      });
  },
  initializeResult({ commit }) {
    commit('setResult', null)
  }
}

export default {
  namespaced: true,
  state,
  getters,
  mutations,
  actions
}