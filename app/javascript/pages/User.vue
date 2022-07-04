<template>
  <div class="text-center min-h-screen">
    <div class="grid grid-cols-12 gap-10 md:pt-20">
      <div class="col-start-2 col-span-10 mt-20 md:mt-0">
        <div class="text-3xl inline p-2 text-white font-bold border-b-8 border-white md:text-4xl">{{ title }}</div>
      </div>
      <div class="items-center col-start-2 col-span-10">
        <UserProfileCard :user="currentUser" @update-Settings="updateUserSettings" @logout="deleteUser" />
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
import { mapGetters } from 'vuex'
import UserProfileCard from '../components/UserProfileCard';

export default {
  name: "User",
  components: {
    UserProfileCard,
  },
  data() {
    return {
      title: "マイページ",
    };
  },
  computed: {
    ...mapGetters(
      'users', ['currentUser']
    ),
    currentPath() {
      return this.$route.path
    },
  },
  watch: {
    currentPath: function() {
      this.fetchUser()
    }
  },
  mounted() {
    this.fetchUser()
  },
  methods: {
    async fetchUser() {
     const res = await axios.get(`/api/v1/users/${this.$route.params.twitter_id}`)
     this.user = res.data
    },
    async updateUserSettings() {
      await axios.patch("/api/v1/user_settings")
      .then(res => {
        this.$store.commit("users/setCurrentUser", res.data)
        this.$store.dispatch('flash/fetchFlash', {
          type: 'info',
          message: 'ユーザー情報を更新しました。'
        })
      })
    },
   async deleteUser() {
      await axios.delete("/api/v1/user_settings")
      .then(
        this.$router.push('/'),
        this.$store.commit("users/setCurrentUser", null),
        this.$store.dispatch('flash/fetchFlash', {
          type: 'alert',
          message: '退会しました。'
      }))
      .catch((err) => {
        console.log(err.response)
      })
    },
  }
}
</script>

<style scoped>
</style>
