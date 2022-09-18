import axios from '../../plugins/axios.js';

const state = {
  dragons: ""
}

const getters = {
  dragons: state => state.dragons
}

const mutations = {
  setDragon: (state, dragons) => {
    state.dragons = dragons
  }
}

const actions = {
  fetchDragon ({ commit }, id) {
    axios.get(`/v1/dragons/${id}`)
    .then(res => {
      commit('setDragon', res.data)
    })
    .catch(err => console.log(err.response));
  },
  initializeDragon({ commit }) {
    commit('setDragon', null)
  }
}

export default {
  namespaced: true,
  state,
  getters,
  mutations,
  actions
}