import axios from '../../plugins/axios.js';

const state = {
  analyzeddata: []
}

const getters = {
  analyzeddata: state => state.analyzeddata
}

const mutations = {
  setAnalyzeddata: (state, analyzeddata) => {
    const dataArray = []
    dataArray.push(analyzeddata.troversion)
    dataArray.push(analyzeddata.polarity)
    dataArray.push(analyzeddata.magnitude)
    state.analyzeddata = dataArray
  }
}

const actions = {
  analyzedAccount({ commit }, analyzeddata){
    axios.post('/v1/analyzeddata', { analyzeddata: analyzeddata })
    .then(res => {
      commit('setAnalyzeddata', res.data)
    })
    .catch(err => console.log(err.response));
  },
}

export default {
  namespaced: true,
  state,
  getters,
  mutations,
  actions
}