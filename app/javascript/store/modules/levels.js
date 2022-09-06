import axios from '../../plugins/axios.js';

const state = {
  levels: []
}

const getters = {
  levels: state => state.levels
}

const mutations = {
  setLevel: (state, levels) => {
    state.levels = levels
  }
}

const actions = {
  fetchLevel ({ commit }, id) {
    axios.get(`/v1/levels/${id}`)
    .then(res => {
      commit('setLevel', res.data)
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