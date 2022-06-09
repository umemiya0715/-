<template>
  <div class="text-center min-h-screen">
    <div class="grid grid-cols-12 gap-10 md:pt-20">
      <div class="col-start-2 col-span-10 mt-20 md:mt-0">
        <div class="text-3xl inline p-2 text-white font-bold border-b-8 border-white md:text-4xl">{{ title }}</div>
      </div>
      <div class="items-center col-start-2 col-span-10">
        <ResultsCard :user="currentUser" @update-Settings="updateUserSettings" @logout="deleteUser" />
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
import { mapGetters } from 'vuex'
import ResultsCard from '../components/ResultsCard';

export default {
  name: "PreviousResults",
  components: {
    ResultsCard,
  },
  data() {
    return {
      title: "過去の診断結果",
      results: {},
    };
  },
  computed: {
    ...mapGetters(
      'results', ['setResult']
    ),
    ...mapGetters(
      'users', ['currentUser']
    ),
    currentPath() {
      return this.$route.path
    },
  },
  watch: {
    currentPath: function() {
      this.fetchResults()
    }
  },
  mounted() {
    this.fetchResults()
  },
  methods: {
    async fetchResults() {
     const res = await axios.get(`/api/v1/results/${this.$route.params.twitter_id}`)
     this.user = res.data
    },
    async updateUserSettings() {
      await axios.patch("/api/v1/user_settings")
      .then(res => {
        this.$store.commit("users/setCurrentUser", res.data)
      })
    },
   async deleteUser() {
      try {
        await axios.delete("/api/v1/user_settings")
        await this.$router.push('/')
      } catch(err){
        this.$store.commit("users/setCurrentUser", null)
        err => console.log(err.response)
      }
    },
  }
}
</script>

<style scoped>
</style>
