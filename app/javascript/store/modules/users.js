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
  async updateCurrentUser({ commit }){
    await axios.patch("/v1/user_settings")
    .then(res => {
      commit("setCurrentUser", res.data, { root: true})
    })
  },
  async logoutUser({ commit }) {
    await axios.delete("../../api/v1/logout")
    commit("setCurrentUser", null)
  },
  async deleteCurrentUser({ commit }) {
    await axios.delete("/v1/user_settings")
    commit("setCurrentUser", null)
  }
}

export default {
  namespaced: true,
  state,
  getters,
  mutations,
  actions,
}