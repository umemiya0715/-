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
  fetchDragon ({ commit }, dragonId) {
    return this.$axios.$get(`/api/v1/dragons/${dragonId}`)
      .then(res => commit('setDragons', res))
  }
}