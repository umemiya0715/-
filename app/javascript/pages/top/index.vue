<template>
  <div class="bg-cover h-7/8">
    <div class="flex justify-center m-8">
      <img :src="top_logo_src" width="300px">
    </div>
    <div class="m-8 text-center">
      <ValidationObserver v-slot="{ invalid }">
        <div class="m-auto">
          <ValidationProvider v-slot="{ errors }" rules="required">
            <input type="text" v-model="targetAccount" class="m-8 w-1/2 bg-gray-100 p-2 rounded-lg border-2 border-indigo-500 shadow-md focus:outline-none focus:border-indigo-600 justify-center" placeholder="@example">
            <span class="block text-white">{{ errors[0] }}</span>
          </ValidationProvider>
          <button :disabled="invalid" @click="startAnalysis(targetAccount)" class="bg-red-500 hover:bg-red-700 text-white font-bold py-4 px-8 text-lg rounded w-36">診断する</button>
          <router-link to="/help">
            <button class=" bg-red-500 hover:bg-red-700 text-white font-bold py-4 px-8 text-lg rounded w-36">使い方</button>
          </router-link>
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
      'accounts',['accounts']
    ),
    ...mapGetters(
      'accounts',['dragonId']
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
