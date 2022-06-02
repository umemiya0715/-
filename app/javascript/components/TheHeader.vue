<template>
  <header>
    <div class='w-full text-gray-500 bg-gray-100 p-6 fixed top-0'>
      <div class='max-w-screen-xl px-4 py-6 mx-auto md:px-6 lg:px-8'>
        <div class='flex flex-row justify-between p-1'>
          <router-link to="/">
            <img :src="logo_src" width="100px">
          </router-link>
          <nav class='text-right md:pb-0 md:flex md:flex-row'>
            <a
              href='/api/v1/oauth/twitter' v-if="!currentUser"
              class='block text-2xl text-right hover:text-white hover:bg-gray-600 rounded'
            >
              Twitter認証によるユーザー登録
            </a>
            <div
              to='/api/v1/logout' v-if="currentUser"
              @click="logout"
              class='block text-2xl text-right hover:text-white hover:bg-gray-600 rounded'
            >
              ログアウト
            </div>
          </nav>
        </div>
      </div>
    </div>
  </header>
</template>

<script>
import Cookies from 'js-cookie'
import { mapGetters, mapActions } from "vuex"

export default {
  name: 'TheHeader',
  data() {
    return {
      isOpen: false,
    }
  },
  computed: {
    ...mapGetters({ currentUser: "users/currentUser"}),
    logo_src() {
      return require("../../../public/images/topLogo.png")
    }
  },
  methods: {
    ...mapActions(
      'users', ['logout']
    ),
  }
}
</script>

<style scoped>
</style>
