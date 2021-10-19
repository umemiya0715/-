import Vue from 'vue'
import Vuex from 'vuex'
import accounts from './modules/accounts'
import analyzeddata from './modules/analyzeddata'
import dragons from './modules/dragons'

Vue.use(Vuex)

export default new Vuex.Store({
  modules: {
    accounts,
    analyzeddata,
    dragons,
  }
})
