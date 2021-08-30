import axios from '../../plugins/axios.js';

const state = {
  dragons: []
}

const getters = {
  dragons: state => state.dragons
}

const mutations = {
  setDragons: (state, dragons) => {
    state.dragons = dragons
  }
}

const actions = {
  fetchDragon ({ commit }, id) {
    axios.get(`/v1/dragons/${id}`)
    .then(res => {
      commit('setDragons', res.data)
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