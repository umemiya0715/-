export const state = () => ({
  dragons: []
})

export const getters = {
  dragons: state => state.dragons
}

export const mutations = {
  setDragons: (state, dragons) => {
    state.dragons = dragons
  }
}

export const actions = {
  fetchDragon ({ commit }, id) {
    return this.$axios.$get(`/api/v1/dragons/${id}`)
      .then(res => commit('setDragons', res))
  }
}