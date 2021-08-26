import Vue from 'vue'
import Vuex from 'vuex'
import accountData from './modules/accountData'
import analyzedData from './modules/analyzedData'
import dragons from './modules/dragons'

Vue.use(Vuex)

export default new Vuex.Store({
  modules: {
    accountData,
    analyzedData,
    dragons,
  }
})
