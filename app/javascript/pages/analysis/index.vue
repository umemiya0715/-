<template>
  <div class="mt-8 bg-red-500 bg-opacity-50">
    <div class="text-center">
      <div class="bg-gray-100 rounded overflow-hidden shadow-md relative">
        <div class="m-4">
          <span class="font-bold">あなたの心は</span>
          <span class="block text-gray-500 text-sm">
            ユーザー名:{{ accountdata.user }}
            <br/>
            {{ dragon.explanation }}
            <br/>
            {{ dragon.personality }}
            <br/>
            {{ dragon.advise }}
          </span>
        </div>
      </div>
    </div>
    <div class="text-center">
      <router-link to="/">トップページに戻る</router-link>
    </div>
  </div>
</template>

<script>
import { mapGetters, mapActions } from  'vuex'

export default {
  data() {
    return {
      dragon: "",
    }
  },
  computed: {
    ...mapGetters(
      'accountdata', ['accountdata']
    ),
  },
  methods: {
    ...mapActions(
      'dragons', ['fetchDragon']
    ),
  }
}
</script>

<style scoped>
</style>
