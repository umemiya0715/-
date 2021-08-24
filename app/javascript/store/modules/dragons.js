import axios from '../../plugins/axios'

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
    return this.$axios.$get(`/api/v1/dragons/${id}`)
      .then(res => commit('setDragons', res))
  }
}

export default {
  namespaced: true,
  state,
  getters,
  mutations,
  actions
}