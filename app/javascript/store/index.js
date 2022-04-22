import Vue from 'vue'
import Vuex from 'vuex'
import createPersistedState from 'vuex-persistedstate'

// import accounts from './modules/accounts'
import results from './modules/results'
import dragons from './modules/dragons'

Vue.use(Vuex)

export default new Vuex.Store({
  modules: {
    // accounts,
    results,
    dragons,
  },
  plugins: [createPersistedState({
    key: 'vuex-test',
    storage: window.sessionStorage
  })]
})