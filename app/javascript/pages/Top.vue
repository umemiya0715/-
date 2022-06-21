<template>
  <div class="text-center min-h-screen">
    <div class="grid grid-cols-12 gap-10 my-32 md:my-12">
      <div class="col-start-2 col-span-10 md:mt-0">
        <img :src="top_logo_src" height="1600px" width="1000px" class="inline">
      </div>
      <div class="col-start-2 col-span-10 px-10 py-20">
        <ValidationObserver v-slot="{ invalid }">
          <div class="justify-center pb-16">
            <ValidationProvider v-slot="{ errors }" rules="required">
              <input type="text" v-model="targetAccount" class=" h-20 bg-gray-100 text-4xl p-2 rounded-lg border-4 border-indigo-500 shadow-md focus:outline-none focus:border-indigo-600 w-full" placeholder="idを入力">
              <span class="block text-2xl text-white">{{ errors[0] }}</span>
            </ValidationProvider>
          </div>
        <div class="my-32 justify-center">
          <button :disabled="invalid" v-show="!isLoading" @click="startAnalysis(targetAccount)" class="bg-red-500 hover:bg-red-700 text-white font-bold py-8 px-8 text-4xl rounded w-64 inline-flex items-center justify-center">
            診断する
          </button>
          <button :disabled="invalid" v-show="isLoading" class="bg-red-500 hover:bg-red-700 text-white font-bold py-8 px-12 text-4xl rounded w-64 inline-flex justify-between">
            <spinner :size="30" color="#ffffff" class=""></spinner>
            <div class="text-center">診断中</div>
          </button>
        </div>
        <div class="my-32 justify-center">
          <button class=" bg-red-500 hover:bg-red-700 font-bold py-8 px-8 text-4xl text-white rounded w-64 items-center">
          <router-link to="/help">使い方</router-link>
          </button>
        </div>
      </ValidationObserver>
    </div>
  </div>
  </div>
</template>

<script>
import axios from 'axios'
import { mapGetters } from 'vuex'
import Spinner from 'vue-spinner-component/src/Spinner.vue';

export default {
  name: "Top",
  data() {
    return {
      targetAccount: "",
      isLoading: false,
      user_id: "",
    }
  },
  components: {
    Spinner
  },
  computed: {
     ...mapGetters(
      'results',['results']
    ),
    ...mapGetters(
      'dragons', ['dragons']
    ),
    ...mapGetters(
      'users', ['currentUser' , 'isAuthenticatedUser']
    ),
    top_logo_src() {
      return require("../../../public/images/topLogo.png")
    }
  },
  mounted() {
    axios.get("/api/v1/users/me")
    .then(res => {
      this.user = res.data
      this.$store.commit('users/setCurrentUser', res.data)
    })
  },
  methods: {
    async startAnalysis() {
      const target_account = this.targetAccount
      const user_id = (this.currentUser !== null) ? this.currentUser.twitter_id : 0
      this.isLoading = true
      try {
        await this.$store.dispatch('results/fetchResult', {
          target_account: target_account,
          user_id: user_id
        })
        this.isLoading = false
        await this.$router.push('/result')
      } catch (error) {
        alert('データの取得に失敗しました')
        this.dialog = false
      }
    }
  }
}
</script>

<style scoped>
</style>
