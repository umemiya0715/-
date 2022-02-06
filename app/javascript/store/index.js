import Vue from 'vue'
import Vuex from 'vuex'
import createPersistedState from 'vuex-persistedstate'

import accounts from './modules/accounts'
import analyzeddata from './modules/analyzeddata'
import dragons from './modules/dragons'

Vue.use(Vuex)

export default new Vuex.Store({
  modules: {
    accounts,
    analyzeddata,
    dragons,
  },
  plugins: [createPersistedState({
    key: 'vuex-test',
    storage: window.sessionStorage
  })]
})