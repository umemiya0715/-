<template>
  <div class="mt-8 bg-red-300 bg-gray-200">
    <div class="text-center">
      <h3>診断アプリ</h3>
    </div>
    <div class="text-center">
      <form class="grid grid-cols-1 gap-6 m-16">
        <div class="mt-4">
          <input type="text" v-model="targetAccount" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50" placeholder="@dragon">
        </div>
      </form>
      <button type="submit" @click="startAnalysis(targetAccount)" class="bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded">診断する</button>
    </div>
    <div class="text-center">
      <router-link to="/help">ドラゴン？</router-link>
    </div>
  </div>
</template>

<script>
import { mapGetters, mapMutations, mapActions } from 'vuex'

export default {
  name: "top",
  data() {
    return {
      targetAccount: '',
    }
  },
  computed: {
    ...mapGetters(
      'dragons', ['dragons']
    ),
    ...mapGetters(
      'accountdata', ['accountdata']
    ),
  },
  methods: {
    ...mapMutations(
      'dragons', ['fetchDragon']
    ),
    ...mapActions(
      'accountdata', ['fetchAccountdata']
    ),
    async startAnalysis(targetAccount) {
      try {
        await this.fetchAccountdata(targetAccount)
        // await this.analyzeAccount(accountData)
        // await this.fetchDragon(this.dragonId)
        // setTimeout(
        //  this.$router.push('/analysis'),
        // 3000);
      } catch (error) {
        alert('データの取得に失敗しました')
        console.log(error)
      }
    },
  }
}
</script>

<style scoped>
</style>
