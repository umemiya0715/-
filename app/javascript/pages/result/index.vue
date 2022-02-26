<template>
  <div class="text-center">
    <div class="grid grid-cols-12 gap-10 md:p-20">
      <div class="col-start-1 col-span-12 mt-20 md:mt-0">
        <div class="text-2xl inline p-5 text-white font-bold border-b-8 border-white md:text-4xl">{{ title }}</div>
      </div>
      <div class="text-center text-white col-start-1 col-span-12 p-10 mx-auto" v-if="dragons.attributes">
        <div class="text-2xl font-bold p-4">
          <h3>{{ dragons.attributes.name }}</h3>
        </div>
        <div class="m-auto p-4">
          <img :src="dragon_image_src">
        </div>
        <div class="text-lg p-4 m-4 border-2 border-white rounded-md font-bold mx-32">
          <div class="text-2xl inline font-bold border-b-2 border-white">性格</div>
          <div class="m-4">{{ dragons.attributes.explanation }}</div>
          <div class="m-4">{{ dragons.attributes.personality }}</div>
        </div>
        <div class="text-lg p-4 m-4 border-2 border-white rounded-md font-bold mx-32">
          <div class="text-2xl inline font-bold border-b-2 border-white">アドバイス</div>
          <div class="m-4">{{ dragons.attributes.advice }}</div>
        </div>
      </div>
    </div>
    <div class="text-center p-4">
      <button class="bg-blue-500 hover:bg-blue-700 text-white text-lg font-bold py-4 px-8 rounded" @click="twitterShare" >Twitterでシェアする</button>
    </div>
    <div class="text-center text-white p-4 text-lg">
      <router-link to="/">トップページに戻る</router-link>
    </div>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
  name: "result",
  data() {
    return {
      title: "あなたの心に潜むドラゴンは…"
    }
  },
  methods: {
    twitterShare(){
      const url = `https://dragon-twitter-analysis.herokuapp.com/dragons/${this.dragons.attributes.id}`
      window.open(`https://twitter.com/share?text=あなたの心の中のドラゴンは${this.dragons.attributes.name}でした！%0a%23ドラゴン%20%23Twitter診断%0a&url=${url}`, '_blank')
    }
  },
  computed: {
    ...mapGetters(
      'dragons', ['dragons']
    ),
    ...mapGetters(
      'accounts', ['accounts']
    ),
    dragon_image_src() {
        return require("../../../assets/images/" + this.dragons.attributes.image)
    },
  },
}
</script>

<style scoped>
</style>
