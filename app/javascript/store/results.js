export const state = () => ({
  results: []
})

export const getters = {
  results: state => state.results
}

export const mutations = {
  addResult(state, result) {
    state.results = result
  }
}