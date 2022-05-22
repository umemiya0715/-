<template>
  <div class="bg-cover h-7/8">
    <div class="flex justify-center m-16">
      <img :src="top_logo_src" width="400px">
    </div>
    <div class="m-16 text-center">
      <ValidationObserver v-slot="{ invalid }">
        <div class="justify-center">
          <ValidationProvider v-slot="{ errors }" rules="required">
            <input type="text" v-model="targetAccount" class=" bg-gray-100 p-2 rounded-lg border-2 border-indigo-500 shadow-md focus:outline-none focus:border-indigo-600 w-full" placeholder="@example">
            <span class="block text-white">{{ errors[0] }}</span>
          </ValidationProvider>
        </div>
        <div class="m-16 justify-center">
          <button :disabled="invalid" v-show="!isLoading" @click="startAnalysis(targetAccount)" class="bg-red-500 hover:bg-red-700 text-white font-bold py-4 px-4 text-lg rounded w-36 inline-flex items-center justify-center">
            診断する
          </button>
          <button :disabled="invalid" v-show="isLoading" class="bg-red-500 hover:bg-red-700 text-white font-bold py-4 px-4 text-lg rounded w-36 inline-flex items-center justify-center">
            <spinner :size="20" color="#ffffff" class="m-2"></spinner>
            診断中
          </button>
        </div>
        <div class="m-16 justify-center">
          <button class=" bg-red-500 hover:bg-red-700 font-bold py-4 px-8 text-lg text-white rounded w-36 items-center">
          <router-link to="/help">使い方</router-link>
          </button>
        </div>
      </ValidationObserver>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
import { mapGetters, mapMutations, mapActions } from 'vuex'
import Spinner from 'vue-spinner-component/src/Spinner.vue';

export default {
  name: "top",
  data() {
    return {
      targetAccount: "",
      isLoading: false
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
    ...mapMutations(
      'results', ['setResult']
    ),
    ...mapMutations(
      'dragons', ['setDragon']
    ),
    ...mapActions(
      'results', ['fetchResult']
    ),
    ...mapActions(
      'dragons', ['fetchDragon']
    ),
    async startAnalysis() {
      const targetId = this.targetAccount
      this.isLoading = true
      try {
        await this.fetchResult(targetId)
        await this.fetchDragon(this.results.dragon_id)
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
