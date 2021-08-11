export const state = () => ({
  analyzedData: []
})

export const getters = {
  analyzedData: state => state.analyzedData
}

export const mutations = {
  setAnalyzedData: (state, analyzedData) => {
    state.analyzedData = analyzedData
  }
}

export const actions = {
  fetchAnalyzedData ({ commit }, analyzedDataId) {
    return this.$axios.$get(`https://language.googleapis.com/v1beta1/documents;analyzeEntities?ley?=????/${analyzedDataId}`)
      .then(res => commit('setAnalyzedData', res))
  }
}