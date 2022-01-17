<template>
  <div class="contaner mx-auto">
    <div class="text-white text-center">
      <h1>{{ title }}</h1>
    </div>
    <div class="text-center text-white" v-if="dragons.attributes">
      <h3>{{ dragons.attributes.name }}</h3>
      <div class="m-auto w-1/2">
        <img :src="dragon_image_src">
      </div>
      <h3>{{ dragons.attributes.explanation }}</h3>
    </div>
    <div class="text-center">
      <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded" @click="twitterShare" >Twitterでシェアする</button>
    </div>
    <div class="text-center text-white">
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
      const shareURL = 'https://twitter.com/intent/tweet?text=' + `あなたの心の中のドラゴンは${this.dragons.attributes.name}でした！` + `%0a%23ドラゴン%20%23Twitter診断%0a`
      // + '&url=' + 'https://www.mtggoldfish.com/'
      location.href = shareURL
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
  mounted: function() {
    const title = "タイトル"
    const description = "説明文"
    document.title = title
    document.querySelector("meta[property='og:title']").setAttribute('content', title)
    document.querySelector("meta[name='description']").setAttribute('content', description)
    document.querySelector("meta[property='og:description']").setAttribute('content', description)
  }
}
</script>

<style scoped>
</style>
