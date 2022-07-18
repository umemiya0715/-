<template>
  <div>
    <div
      v-if="currentUser"
      v-show="isVisibleHeaderMenu"
      class="flex flex-col mt-3 justify-between"
    >
      <button
        class="p-2 lg:px-4 text-2xl text-center border border-transparent rounded hover:bg-red-100 hover:text-red-700 transition-colors duration-300"
      >
        <router-link :to="`/users/${currentUser.screen_name}`">
          マイページ
        </router-link>
      </button>
      <button
        class="p-2 lg:px-4 text-2xl text-center border border-transparent rounded hover:bg-red-100 hover:text-red-700 transition-colors duration-300"
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
</template>

<script>
import { mapGetters　} from "vuex"

export default {
  props: {
    isVisibleHeaderMenu: {
      type: Boolean,
      required: true
    }
  },
  computed: {
    ...mapGetters(
      'users', ['currentUser' , 'isAuthenticatedUser']
    ),
    currentPath() {
      return this.$route.path
    },
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
    closeHeaderMenu(){
      this.$emit("close-menu");
    },
  },
  watch: {
    currentPath: function() {
      this.closeHeaderMenu()
    }
  },
}
</script>

<style scoped>
</style>