<template>
  <div class="mt-8 bg-red-300 bg-gray-200">
    <div class="text-center">
      <h3>性格診断アプリ</h3>
    </div>
    <div class="text-center">
      <form class="grid grid-cols-1 gap-6 m-16">
        <div class="mt-4">
          <input type="text" v-model="targetAccount" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50" placeholder="@example">
        </div>
      </form>
      <button @click="startAnalysis(targetAccount)" class="bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded">診断する</button>
      <button @click="showDragonId()" class="bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded">ゴンゴン</button>
    </div>
    <div class="text-center">
      <router-link to="/help">howto</router-link>
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
      'accounts',['accounts']
    ),
    ...mapGetters(
      'accounts',['dragonId']
    ),
    ...mapGetters(
      'dragons', ['dragons']
    )
  },
  methods: {
    ...mapMutations(
      'accounts', ['setAccount']
    ),
    ...mapMutations(
      'dragons', ['setDragon']
    ),
    ...mapActions(
      'accounts', ['fetchAccount']
    ),
    ...mapActions(
      'dragons', ['fetchDragon']
    ),
    async startAnalysis() {
      const targetId = this.targetAccount
      try {
        await this.fetchAccount(targetId)
        await this.fetchDragon(this.dragonId)
        await this.$router.push('/result')
      } catch (error) {
        alert('データの取得に失敗しました')
        this.dialog = false
      }
    },
    showDragonId(){
      console.log(typeof this.dragonId)
    },
  }
}
</script>

<style scoped>
</style>
