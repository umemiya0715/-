export const state = () => ({
  analysisData: []
})

export const getters = {
  analysisData: state => state.analysisData
}

export const mutations = {
  addAnalysisData: (state, analysisData) => {
    const daraArray = []
    daraArray.push(analysisData)
    state.analysisData = analysisData
  }
}

export const actions = {
  createAnalysisData ({ commit }, AnalysisData) {
    return this.$axios.$post('/api/v1/analysisdata', { analysisdata: analysisData })
      .then(res => commit('addAnalysisData', res)
      )
  }
}