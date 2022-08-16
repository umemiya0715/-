<template>
  <div class="text-center">
    <div class="grid grid-cols-12 gap-10 md:pt-20 md:pb-10">
      <div class="col-span-10 col-start-2 mt-20 md:mt-0">
        <div
          v-show="result"
          class="inline border-b-8 border-white p-2 text-2xl font-bold text-white md:text-4xl"
        >
          {{ shortenedName }}さんの心に潜むドラゴンは…
        </div>
      </div>
      <div
        v-show="result"
        class="col-span-10 col-start-2 mx-auto px-10 pb-10 text-center text-white"
      >
        <div class="text-6xl font-bold">
          <h3>
            {{ result.dragon.name }}
          </h3>
        </div>
        <div class="m-auto py-4">
          <img :src="'../images/' + result.dragon.image">
        </div>
        <PreviousRadar
          :style="chartStyles"
          :result="result"
        />
        <div class="m-4 mx-4 rounded-md border-4 border-white p-4 font-bold">
          <div class="inline border-b-2 border-white text-3xl font-bold">
            性格
          </div>
          <div class="m-4 text-3xl">
            {{ result.dragon.explanation }}
          </div>
          <div class="m-4 text-left text-2xl">
            {{ result.dragon.personality }}
          </div>
        </div>
        <div class="m-4 mx-4 rounded-md border-4 border-white p-4 font-bold">
          <div class="inline border-b-2 border-white text-3xl font-bold">
            アドバイス
          </div>
          <div class="m-4 text-left text-2xl">
            {{ result.dragon.advice }}
          </div>
        </div>
        <div class="m-4 mx-4 rounded-md border-4 border-white p-4 font-bold">
          <div class="inline border-b-2 border-white text-3xl font-bold">
            相性のいいドラゴン
          </div>
          <div class="m-4 text-left text-2xl">
            {{ result.dragon.affinity }}
          </div>
        </div>
      </div>
    </div>
    <div class="mx-auto p-4 pb-20">
      <button class="w-72 rounded bg-red-400 p-1 hover:bg-red-600">
        <div class="rounded bg-red-500 p-4 text-2xl font-bold text-white hover:bg-red-700">
          <router-link
            to="/previous"
          >
            戻る
          </router-link>
        </div>
      </button>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
import PreviousRadar from '../components/PreviousRadar.vue'

export default {
  components: {
    PreviousRadar
  },
  data() {
    return {
      result: {}
    }
  },
  computed: {
    shortenedName(){
      let name = this.result.target_account
      return name.length > 8 ? name.substring(0,8) + '...' : name;
    },
    currentPath() {
      return this.$route.path
    },
    chartStyles() {
      return {
        'margin-left': 'auto',
        'margin-right': 'auto',
        height: '510px',
      }
    }
  },
  watch: {
    currentPath: function() {
      this.fetchResult()
    }
  },
  mounted() {
    this.fetchResult()
  },
  methods: {
    async fetchResult() {
      const res = await axios.get(`/api/v1/results/${this.$route.params.id}`)
      this.result = res.data
    }
  }
}
</script>

<style scoped>
</style>
