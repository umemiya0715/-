<template>
  <header>
    <div class='w-full text-gray-500 bg-gray-100 p-2 fixed top-0'>
      <div class='items-center max-w-screen-xl mx-auto md:px-4'>
        <div class='flex flex-row justify-between p-1'>
          <router-link to="/" class="flex justify-center items-center">
            <img :src="logo_src" width="100px" >
          </router-link>
          <nav class='text-right md:pb-0 md:flex md:flex-row'>
            <a
              href='/api/v1/oauth/twitter' v-if="!currentUser"
              class='block text-2xl text-right hover:text-white hover:bg-gray-600 rounded'
            >
              Twitter認証によるユーザー登録
            </a>
            <router-link v-if="currentUser" :to="`/users/${this.currentUser.screen_name}`">
              <img
                :src="user_avatar_src" class='mx-auto object-cover border-2 rounded-full h-16 w-16'
              >
            </router-link>
            <button
              v-if="currentUser" @click="logout"
              class='block text-2xl text-right hover:text-white hover:bg-gray-600 rounded'
            >
              ログアウト
            </button>
            <button
              v-if="currentUser" @click="deleteUser"
              class='block text-2xl text-right hover:text-white hover:bg-gray-600 rounded'
            >
              ユーザー削除
            </button>
          </nav>
        </div>
      </div>
    </div>
  </header>
</template>

<script>
import Cookies from 'js-cookie'
import { mapGetters, mapMutations } from "vuex"

export default {
  name: 'TheHeader',
  data() {
    return {
      isOpen: false,
    }
  },
  computed: {
    ...mapGetters(
      'users', ['currentUser' , 'isAuthenticatedUser']
    ),
    logo_src() {
      return require("../../../public/images/topLogo.png")
    },
    user_avatar_src() {
      return require("../../../public/images/yellowDragon.png")
    }
  },
  methods: {
    ...mapMutations(
      'users', ['logoutUser', 'deleteCurrentUser']
    ),
    async logout() {
      try {
        await this.$store.dispatch("users/logoutUser")
        Cookies.remove('vuex');
        await this.$router.push('/')
      } catch (error) {
      }
    },
    async deleteUser() {
      try {
        await this.$store.dispatch("users/deleteCurrentUser")
        await this.$router.push('/')
      } catch(error){
      }
    }
  }
}
</script>

<style scoped>
</style>
