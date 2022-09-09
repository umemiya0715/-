<template>
  <div>
    <div
      v-if="currentUser"
      v-show="isVisibleHeaderMenu"
      class="mt-3 flex flex-col justify-between"
    >
      <button
        class="rounded border border-transparent p-2 text-center text-2xl transition-colors duration-300 hover:bg-red-100 hover:text-red-700 lg:px-4"
        @click="closeHeaderMenu"
      >
        <router-link :to="`/users/${currentUser.screen_name}`">
          マイページ
        </router-link>
      </button>
      <button
        class="rounded border border-transparent p-2 text-center text-2xl transition-colors duration-300 hover:bg-red-100 hover:text-red-700 lg:px-4"
        @click="closeHeaderMenu"
      >
        <router-link to="/previous">
          過去の診断結果
        </router-link>
      </button>
      <button
        class="rounded border border-transparent p-2 text-center text-2xl transition-colors duration-300 hover:bg-red-100 hover:text-red-700 lg:px-4"
        @click="logout"
      >
        ログアウト
      </button>
    </div>
  </div>
</template>

<script>
import { mapGetters } from "vuex"

export default {
  props: {
    isVisibleHeaderMenu: {
      type: Boolean,
      required: true
    }
  },
  computed: {
    ...mapGetters(
      'users', ['currentUser']
    ),
    ...mapGetters(
      'levels', ['levels']
    ),
    currentPath() {
      return this.$route.path
    },
  },
  watch: {
    currentPath: function() {
      this.closeHeaderMenu()
    }
  },
  methods: {
    async logout() {
      await this.$store.dispatch('users/logoutUser')
      await this.$store.dispatch('levels/initializeLevel')
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
}
</script>

<style scoped>
</style>