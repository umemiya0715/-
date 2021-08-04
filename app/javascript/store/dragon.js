export const state = () => ({
  dragons: []
})

export const getters = {
  results: state => state.dragons
}

export const mutations = {
  setDragons: (state, dragons) => {
    state.dragons = dragons
  }
}

export const dragons = {
  fetchDragon ({ commit }, id) {
    return this.$axios.$get(`/api/v1/dragons/${id}`)
      .then(res => commit('setDragons', res))
  }
}