export const state = {
  results: []
})

export const getters = {
  results: state => state.results
}

export const mutations = {
  setResults: (state, results) => {
    state.results = results
  }
}

export const actions = {
  fetchResults ({ commit }, ResultsId) {
    return this.$axios.$get(`/api/v1/results/${ResultsId}`)
      .then(res => commit('setResults', res))
  }
}