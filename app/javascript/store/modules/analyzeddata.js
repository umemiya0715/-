import axios from '../../plugins/axios.js';

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
  analyzedAccount({ commit }, analyzedData){
    axios.post('/v1/analyzedData', { analyzeddata: analyzedData })
    .then(res => {
      commit('setAnalyzedData', res.data)
    })
    .catch(err => console.log(err.respoonse));
  },
}

export default {
  namespaced: true,
  state,
  getters,
  mutations,
  actions
}