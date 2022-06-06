<template>
  <div class="text-center">
    <div class="grid grid-cols-12 gap-10 md:pt-20">
      <div class="col-start-2 col-span-10 mt-20 md:mt-0">
        <div class="text-2xl inline p-2 text-white font-bold border-b-8 border-white md:text-4xl">{{ title }}</div>
      </div>
      <div class="text-center text-white col-start-2 col-span-10 px-10 pb-10 mx-auto" v-if="dragons.attributes">
        <div class="text-6xl font-bold">
          <h3>{{ dragons.attributes.name }}</h3>
        </div>
        <div class="m-auto">
          <img :src="dragon_image_src">
        </div>
        <div class="p-4 m-4 border-4 border-white rounded-md font-bold mx-16">
          <div class="text-3xl inline font-bold border-b-2 border-white">性格</div>
          <div class="text-3xl m-4">{{ dragons.attributes.explanation }}</div>
          <div class="text-2xl m-4">{{ dragons.attributes.personality }}</div>
        </div>
        <div class="p-4 m-4 border-4 border-white rounded-md font-bold mx-16">
          <div class="text-3xl inline font-bold border-b-2 border-white">アドバイス</div>
          <div class="text-2xl m-4">{{ dragons.attributes.advice }}</div>
        </div>
      </div>
    </div>
    <div class="text-center p-4">
      <button class="bg-twitterBlue hover:bg-blue-700 text-white text-2xl font-bold py-4 px-4 rounded" @click="twitterShare" >
        <i class="px-2 ri-twitter-fill"></i>Twitterでシェアする
      </button>
    </div>
    <div class="text-center text-white p-8 text-2xl">
      <router-link to="/">トップページに戻る</router-link>
    </div>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
  name: "Result",
  data() {
    return {
      title: "あなたの心に潜むドラゴンは…"
    }
  },
  methods: {
    twitterShare(){
      const url = `https://www.dragon-twitter-analysis.com/dragons/${this.dragons.attributes.id}`
      window.open(`https://twitter.com/share?text=${this.results.target_account}さんの心の中のドラゴンは${this.dragons.attributes.name}でした！%0a%23ドラッター%20%23Dratter%0a&url=${url}`, '_blank')
    }
  },
  computed: {
    ...mapGetters(
      'dragons', ['dragons']
    ),
    ...mapGetters(
      'results', ['results']
    ),
    dragon_image_src() {
        return require("../../../public/images/" + this.dragons.attributes.image)
    },
  },
}
</script>

<style scoped>
</style>
