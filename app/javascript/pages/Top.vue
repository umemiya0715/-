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
              <span class="block p-4 text-3xl text-white">{{ errors[0] }}</span>
            </ValidationProvider>
          </div>
        <div class="my-32 justify-center">
          <button :disabled="invalid" v-show="!isLoading" @click="startAnalysis(targetAccount)" class="bg-red-400 hover:bg-red-600 rounded p-1">
            <p class="bg-red-500 hover:bg-red-700 text-white font-bold text-4xl rounded w-64 px-8 py-8 inline-flex justify-center">診断する</p>
          </button>
          <button :disabled="invalid" v-show="isLoading" class="bg-red-400 hover:bg-red-600 rounded p-1">
            <div class="bg-red-500 hover:bg-red-700 rounded w-64 px-10 py-8 inline-flex justify-between items-center">
              <spinner :size="30" color="#ffffff"></spinner>
              <p class="text-white font-bold text-4xl ">診断中‥</p>
            </div>
          </button>
        </div>
        <div class="my-32 justify-center">
          <button class=" bg-red-400 hover:bg-red-600 rounded p-1">
            <router-link to="/help" class="bg-red-500 hover:bg-red-700 text-white font-bold text-4xl rounded w-64 px-8 py-8 inline-flex justify-center">使い方</router-link>
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
      this.$store.commit('users/setCurrentUser', res.data)
    })
  },
  methods: {
    async startAnalysis() {
      const target_account = this.targetAccount
      const user_id = (this.currentUser !== null) ? this.currentUser.id : 0
      this.isLoading = true
      await axios.post('/api/v1/results', {
        target_account: target_account,
        user_id: user_id
      })
        .then(res => {
          this.$store.commit("results/setResult", res.data),
          this.isLoading = false,
          this.$router.push('/result')
        })
        .catch(error => {
          console.log(error.response)
          this.isLoading = false
          this.$store.dispatch('flash/fetchFlash', {
            type: 'alert',
            message: error.response.data.error.title
          })
        })
    },
  },
}
</script>

<style scoped>
</style>
