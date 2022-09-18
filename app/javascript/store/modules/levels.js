import axios from '../../plugins/axios.js';

const state = {
  levels: ""
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
      .catch(err => {
        return null
      });
  },
  levelUp ({ commit }, id) {
    axios.get(`/v1/levels/${id}/levelup`)
    .then(res => {
      commit('setLevel', res.data)
    })
  },
  updateLevel({ commit }, setLevel) {
    axios.patch(`/v1/levels/${setLevel.id}`, {
      setting_level: setLevel.level
    })
    .then(res => {
      commit('setLevel', res.data)
    })
  },
  initializeLevel({ commit }) {
    commit('setLevel', null)
  }
}

export default {
  namespaced: true,
  state,
  getters,
  mutations,
  actions
}