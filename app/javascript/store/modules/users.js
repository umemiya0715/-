import axios from '../../plugins/axios.js';

const state = {
  currentUser: []
}

const getters = {
  currentUser: state => state.currentUser,
}

const mutations = {
  setCurrentUser(state, user) {
    state.currentUser = user
  }
}

const actions = {
  getCurrentUser({ commit, state }) {
    const { currentUser } = state
    if (currentUser) {
      return currentUser
    }
    axios.get("/api/v1/users/me")
      .then(res => {
        commit("setCurrentUser", res.data)
      })
      .catch(err => {
        return null
      })
  },
  async logoutUser({ commit }) {
    await axios.delete("../../api/v1/logout")
    commit("setCurrentUser", null)
  },
}

export default {
  namespaced: true,
  state,
  getters,
  mutations,
  actions,
}