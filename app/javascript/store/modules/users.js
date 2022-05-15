import axios from '../../plugins/axios.js';

const state = {
  currentUser: ""
}

const getters = {
  currentUser: state => state.currentUser,
  isAuthenticatedUser: state => !!state.currentUser
}

const mutations = {
  setCurrentUser(state, user) {
    state.currentUser = user
  }
}

const actions = {
  getCurrentUser({ commit }) {
    axios.get("/api/v1/users/me")
      .then(res => {
        commit("setCurrentUser", res.data)
    })
  },
  logout({ commit }) {
    commit("setCurrentUser", null )
  },
}

export default {
  namespaced: true,
  state,
  getters,
  mutations,
  actions,
}