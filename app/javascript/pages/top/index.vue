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
          <button :disabled="invalid" @click="startAnalysis(targetAccount)" class="bg-red-500 hover:bg-red-700 text-white font-bold py-4 px-8 text-lg rounded w-36 justify-center">診断する</button>
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
import { mapGetters, mapMutations, mapActions } from 'vuex'
export default {
  name: "top",
  data() {
    return {
      targetAccount: "",
    }
  },
  computed: {
     ...mapGetters(
      'results',['results']
    ),
    ...mapGetters(
      'dragons', ['dragons']
    ),
    top_logo_src() {
      return require("../../../assets/images/topLogo.png")
    }
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
      try {
        await this.fetchResult(targetId)
        await this.fetchDragon(this.results.dragon_id)
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
