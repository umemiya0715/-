<template>
  <div class="text-center">
    <div class="grid grid-cols-12 gap-10 md:pt-20 md:pb-10">
      <div class="col-start-2 col-span-10 mt-20 md:mt-0">
        <div
          v-show="result"
          class="text-2xl inline p-2 text-white font-bold border-b-8 border-white md:text-4xl"
        >
          {{ shortenedName }}さんの心に潜むドラゴンは…
        </div>
      </div>
      <div
        v-show="result"
        class="text-center text-white col-start-2 col-span-10 px-10 pb-10 mx-auto"
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
        <div class="p-4 m-4 border-4 border-white rounded-md font-bold mx-4">
          <div class="text-3xl inline font-bold border-b-2 border-white">
            性格
          </div>
          <div class="text-3xl m-4">
            {{ result.dragon.explanation }}
          </div>
          <div class="text-2xl m-4 text-left">
            {{ result.dragon.personality }}
          </div>
        </div>
        <div class="p-4 m-4 border-4 border-white rounded-md font-bold mx-4">
          <div class="text-3xl inline font-bold border-b-2 border-white">
            アドバイス
          </div>
          <div class="text-2xl m-4 text-left">
            {{ result.dragon.advice }}
          </div>
        </div>
        <div class="p-4 m-4 border-4 border-white rounded-md font-bold mx-4">
          <div class="text-3xl inline font-bold border-b-2 border-white">
            相性のいいドラゴン
          </div>
          <div class="text-2xl m-4 text-left">
            {{ result.dragon.affinity }}
          </div>
        </div>
      </div>
    </div>
    <div class="p-4 pb-20 mx-auto">
      <button class="bg-red-400 hover:bg-red-600 rounded p-1 w-72">
        <div class="bg-red-500 hover:bg-red-700 text-white text-2xl font-bold p-4 rounded">
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
