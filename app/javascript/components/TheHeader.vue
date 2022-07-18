<template>
  <header>
    <nav class="w-full text-gray-100 bg-navGray py-2">
      <div class="px-12 mx-auto items-center">
        <div class="flex justify-between items-center">
          <router-link
            to="/"
            class="flex justify-center items-center"
          >
            <img
              :src="logo_src"
              width="120px"
              @click="closeMenu"
            >
          </router-link>
          <div class="item">
            <a
              v-if="!currentUser"
              href="/api/v1/oauth/twitter"
              class="px-2 lg:px-4 md:mx-2 text-2xl text-center border border-transparent rounded hover:bg-red-100 hover:text-red-700 transition-colors duration-300"
            >
              Twitter認証によるユーザー登録
            </a>
            <button @click="isOpen = !isOpen">
              <img
                v-if="currentUser"
                :src="currentUser.image"
                class="border-2 rounded-full w-16 h-16"
              >
            </button>
          </div>
        </div>
        <div
          v-if="currentUser"
          :class="isOpen ? 'flex' : 'hidden'"
          class="flex-col mt-3 justify-between"
        >
          <button
            class="p-2 lg:px-4 text-2xl text-center border border-transparent rounded hover:bg-red-100 hover:text-red-700 transition-colors duration-300"
            @click="closeMenu"
          >
            <router-link :to="`/users/${currentUser.screen_name}`">
              マイページ
            </router-link>
          </button>
          <button
            class="p-2 lg:px-4 text-2xl text-center border border-transparent rounded hover:bg-red-100 hover:text-red-700 transition-colors duration-300"
            @click="closeMenu"
          >
            <router-link to="/previous">
              過去の診断結果
            </router-link>
          </button>
          <button
            class="p-2 lg:px-4 text-2xl text-center border border-transparent rounded hover:bg-red-100 hover:text-red-700 transition-colors duration-300"
            @click="logout"
          >
            ログアウト
          </button>
        </div>
      </div>
    </nav>
  </header>
</template>

<script>
import Cookies from 'js-cookie'
import { mapGetters　} from "vuex"

export default {
  name: 'TheHeader',
  components: {
  },
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
    async logout() {
      await this.$store.dispatch('users/logoutUser')
      try {
        this.$router.push('/'),
        this.$store.dispatch('flash/fetchFlash', {
          type: 'alert',
          message: 'ログアウトしました。'
        })
      }
      catch (err) {
        console.log(err.response)
      }
    },
    closeMenu(){
      this.isOpen = false;
    },
  }
}
</script>

<style scoped>
</style>
