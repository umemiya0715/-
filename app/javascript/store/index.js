import Vue from 'vue'
import Vuex from 'vuex'
import accountdata from './modules/accountdata'
import analyzedData from './modules/analyzedData'
import dragons from './modules/dragons'

Vue.use(Vuex)

export default new Vuex.Store({
  modules: {
    accountdata,
    analyzedData,
    dragons,
  }
})
