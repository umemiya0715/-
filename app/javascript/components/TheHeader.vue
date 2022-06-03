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
              href='/api/v1/oauth/twitter'
              class='block text-2xl text-right hover:text-white hover:bg-gray-600 rounded'
            >
              Twitter認証によるユーザー登録
            </a>
            <!-- <router-link :to="`/users/${this.currentUser.twitter_id}`">
              <img
                v-if="currentUser"
                :src="user_avatar_src" class='mx-auto object-cover border-2 rounded-full h-16 w-16'
              >
            </router-link> -->
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
    },
    user_avatar_src() {
      return require("../../../public/images/yellowDragon.png")
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
