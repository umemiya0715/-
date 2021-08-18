import Vue from 'vue'
import Vuex from 'vuex'
import accountdata from './modules/accountdata'
import analyzeddata from './modules/analyzeddata'
import dragons from './modules/dragons'

Vue.use(Vuex)

export default new Vuex.Store({
  modules: {
    accountdata,
    analyzeddata,
    dragons,
  }
})
