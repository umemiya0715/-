export const state = () => ({
  dragondata: []
})

export const getters = {
  dragondata: state => state.dragondata
}

export const mutations = {
  addDragonData: (state, dragondata) => {
    state.dragondata = dragondata
  }
}

export const actions = {
  createDragonData ({ commit }, dragonData) {
    return this.$axios.$post('/api/v1/dragondata', { dragondata: dragonData })
      .then(res => commit('addDragonData', res)
      )
  }
}