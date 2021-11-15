<template>
  <div class=" bg-red-300 bg-gray-200">
    <div class="text-center">
      <h3>性格診断アプリ</h3>
    </div>
    <div class="grid grid-cols-1 m-8 text-center">
      <ValidationObserver v-slot="{ invalid }">
        <div class="m-auto">
          <ValidationProvider v-slot="{ errors }" rules="required">
            <input type="text" v-model="targetAccount" class="block mb-2 bg-gray-100 p-2 rounded-lg border-2 border-indigo-500 shadow-md focus:outline-none focus:border-indigo-600" placeholder="@example">
            <span class="text-danger">{{ errors[0] }}</span>
          </ValidationProvider>
        </div>
        <button :disabled="invalid" @click="startAnalysis(targetAccount)" class="bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded">診断する</button>
      </ValidationObserver>
    </div>
    <div class="text-center py-3">
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
    }
  }
}
</script>

<style scoped>
</style>
