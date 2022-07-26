<template>
  <div class="text-center">
    <div class="grid grid-cols-12 gap-10 md:pt-20 md:pb-10">
      <div class="col-start-2 col-span-10 mt-20 md:mt-0">
        <div
          v-if="results"
          class="text-2xl inline p-2 text-white font-bold border-b-8 border-white md:text-4xl"
        >
          {{ shortenedName }}さんの心のドラゴンは…
        </div>
      </div>
      <div
        v-if="results"
        class="text-center text-white col-start-2 col-span-10 pb-10 mx-auto"
      >
        <div class="text-6xl font-bold">
          <h3>{{ results.dragon.name }}</h3>
        </div>
        <div class="m-auto py-4">
          <img :src="dragon_image_src">
        </div>
        <ResultRadar :style="chartStyles" />
        <div class="p-4 m-4 border-4 border-white rounded-md font-bold mx-4">
          <div class="text-3xl inline font-bold border-b-2 border-white">
            性格
          </div>
          <div class="text-3xl m-4">
            {{ results.dragon.explanation }}
          </div>
          <div class="text-2xl m-4 text-left">
            {{ results.dragon.personality }}
          </div>
        </div>
        <div class="p-4 m-4 border-4 border-white rounded-md font-bold mx-4">
          <div class="text-3xl inline font-bold border-b-2 border-white">
            アドバイス
          </div>
          <div class="text-2xl m-4 text-left">
            {{ results.dragon.advice }}
          </div>
        </div>
        <div class="p-4 m-4 border-4 border-white rounded-md font-bold mx-4">
          <div class="text-3xl inline font-bold border-b-2 border-white">
            相性のいいドラゴン
          </div>
          <div class="text-2xl m-4 text-left">
            {{ results.dragon.affinity }}
          </div>
        </div>
      </div>
    </div>
    <div class="p-4 mx-auto">
      <button
        class="bg-blue-300 hover:bg-blue-600 rounded p-1 w-72"
        @click="twitterShare"
      >
        <div class="bg-twitterBlue hover:bg-blue-700 text-white text-2xl font-bold py-4 rounded">
          <i class="px-2 ri-twitter-fill" />Twitterでシェアする
        </div>
      </button>
    </div>
    <div class="p-4 pb-20 mx-auto">
      <button class="bg-red-400 hover:bg-red-600 rounded p-1 w-72">
        <div class="bg-red-500 hover:bg-red-700 text-white text-2xl font-bold p-4 rounded">
          <router-link
            to="/"
          >
            トップページに戻る
          </router-link>
        </div>
      </button>
    </div>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'
import ResultRadar from '../components/ResultRadar.vue'

export default {
  components: {
    ResultRadar
  },
  data() {
    return {
      title: "あなたの心に潜むドラゴンは…"
    }
  },
  computed: {
    ...mapGetters(
      'results', ['results']
    ),
    shortenedName() {
      let name = this.results.target_account;
      return name.length > 8 ? name.substring(0,8) + '...' : name;
    },
    dragon_image_src() {
      return require("../../../public/images/" + this.results.dragon.image)
    },
    chartStyles() {
      return {
        'margin-left': 'auto',
        'margin-right': 'auto',
        height: '510px',
      }
    }
  },
  methods: {
    twitterShare(){
      const url = `https://www.dragon-twitter-analysis.com/dragons/${this.results.dragon.id}`
      window.open(`https://twitter.com/share?text=${this.results.target_account}さんの心の中のドラゴンは${this.results.dragon.name}でした！%0a%23ドラッター%20%23Dratter%0a&url=${url}`, '_blank')
    }
  },
}
</script>

<style scoped>
</style>
