<template>
  <header>
    <nav class="bg-navGray w-full py-2 text-gray-100">
      <div class="mx-auto items-center px-12">
        <div class="flex items-center justify-between">
          <router-link
            to="/"
            class="flex items-center justify-center"
          >
            <img
              :src="logo_src"
              width="120px"
            >
          </router-link>
          <div>
            <a
              v-if="!currentUser"
              href="/api/v1/oauth/twitter"
              class="rounded border border-transparent px-2 text-center text-2xl transition-colors duration-300 hover:bg-red-100 hover:text-red-700 md:mx-2 lg:px-4"
            >
              Twitter認証によるユーザー登録
            </a>
            <button
              @click="isVisibleHeaderMenu = !isVisibleHeaderMenu"
            >
              <img
                v-if="currentUser"
                :src="currentUser.image"
                class="h-16 w-16 rounded-full border-2"
              >
            </button>
          </div>
        </div>
        <HeaderMenu
          :is-visible-header-menu="isVisibleHeaderMenu"
          @close-menu="handleCloseHeaderMenu"
        />
      </div>
    </nav>
  </header>
</template>

<script>
import HeaderMenu from "./HeaderMenu"
import { mapGetters　} from "vuex"

export default {
  components: {
    HeaderMenu
  },
  data() {
    return {
      isVisibleHeaderMenu: false,
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
    openHeaderMenu(){
      this.isVisibleHeaderMenu = true;
    },
    handleCloseHeaderMenu() {
      this.isVisibleHeaderMenu = false;
    }
  },
}
</script>

<style scoped>
</style>
