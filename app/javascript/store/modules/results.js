import axios from '../../plugins/axios.js';

const state = {
  results: [],
  dragon_id: 0
}

const getters = {
  results: state => state.results,
  dragon_id: state => state.dragon_id
}

const mutations = {
  setResult: (state, results) => {
    state.results = results
    state.dragon_id = results.dragon_id
  },
}

const actions = {
  async fetchResult ({ commit }, targetId) {
    await axios.post('/v1/results', { user_id: targetId } )
      .then(res => {
        commit('setResult', res.data)
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