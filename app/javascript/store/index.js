import Vue from 'vue'
import Vuex from 'vuex'
import accountdata from './modules/accountData'
import analyzeddata from './modules/analyzedData'
import dragons from './modules/dragons'

Vue.use(Vuex)

export default new Vuex.Store({
  modules: {
    accountData,
    analyzedData,
    dragons,
  }
})
