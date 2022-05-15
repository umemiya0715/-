import Vue from 'vue'
import Vuex from 'vuex'
import createPersistedState from 'vuex-persistedstate'
import Cookies from 'js-cookie';

import results from './modules/results'
import dragons from './modules/dragons'
import users from './modules/users'

Vue.use(Vuex)

export default new Vuex.Store({
  modules: {
    results,
    dragons,
    users
  },
  plugins: [
    createPersistedState({
      storage: {
        key: 'dratterApp',

        paths: [
          'users.currentUser'
        ],
        getItem: key => Cookies.get(key),
        setItem: (key, value) =>
          Cookies.set(key, value, { expires: 3, secure: true }),
          removeItem: key => Cookies.remove(key),
      },
    }),
  ],
})