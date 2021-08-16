<template>
  <div class="mt-8 bg-red-300 bg-gray-200">
    <div class="text-center">
      <h3>診断アプリ</h3>
    </div>
    <div class="text-center">
      <form class="grid grid-cols-1 gap-6 m-16">
        <div class="mt-4">
          <input type="text" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50" placeholder="@dragon">
        </div>
      </form>
      <router-link @click='startAnalysis' class="bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded">診断する</router-link>
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
      analyzingAccount: [],
      averageTroversion: [],
      avaragePolarity: [],
      averageMagnitude: [],
      dragon: []
    }
  },
  computed: {
    ...mapGetters(
      'dragons', ['dragons']
    ),
    ...mapGetters(
      'results', ['results']
    )
  },
  methods: {
    ...mapMutations(
      'dragons', ['fetchDragon']
    ),
    ...mapActions(
      'results', ['addResult']
    ),
    async startAnalysis() {
      const targetAccount = this.account
      try {
        await this.fetchAccountData(targetAccount)
        await this.analyzeAccount(accountData)
        await this.fetchDragon(this.dragonId)
        setTimeout(
          this.$router.push('/result'),
        3000)
      } catch (error) {
        alert('データの取得に失敗しました')
        this.dialog = false
      }
    },
  }
}
</script>

<style scoped>
</style>
