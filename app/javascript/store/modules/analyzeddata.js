import axios from '../../plugins/axios'

const state = {
  analyzedData: []
}

const getters = {
  analyzedData: state => state.analyzedData
}

const mutations = {
  setAnalyzedData: (state, analyzedData) => {
    const dataArray = []
    dataArray.push(analyzedData.troversion)
    dataArray.push(analyzedData.polarity)
    dataArray.push(analyzedData.magnitude)
    state.analyzedData = dataArray
  }
}

const actions = {
  analyzedAccount ({ commit }, analyzedData) {
    return this.$axios.$post('/api/v1/analyzeddata', { analyzeddata: analyzedData })
      .then(res => commit('setAnalyzedData', res))
  }
}

export default {
  namespaced: true,
  state,
  getters,
  mutations,
  actions
}