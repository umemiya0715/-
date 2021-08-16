export const state = () => ({
  analyzedData: []
})

export const getters = {
  analyzedData: state => state.analyzedData
}

export const mutations = {
  setAnalyzedData: (state, analyzedData) => {
    const dataArray = []
    dataArray.push(analyzedData.troversion)
    dataArray.push(analyzedData.polarity)
    dataArray.push(analyzedData.magnitude)
    state.analyzedData = dataArray
  }
}

export const actions = {
  analyzedAccount ({ commit }, analyzedData) {
    return this.$axios.$post('/api/v1/analyzeddata', { analyzeddata: analyzedData })
      .then(res => commit('setAnalyzedData', res))
  }
}