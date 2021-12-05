<template>
  <div class=" bg-red-500 bg-opacity-50">
    <div class="text-center">
      <h3>{{ title }}</h3>
    </div>
    <div class="text-center" v-if="dragons.attributes">
      <h3>{{ dragons.attributes.name }}</h3>
      <div class="flex justify-center">
        <img :src="dragon_image_src" width="300px">
      </div>
      <h3>{{ dragons.attributes.explanation }}</h3>
    </div>
    <div class="text-center">
      <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded" @click="twitterShare" >Twitterでシェアする</button>
    </div>
    <div class="text-center">
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
      const shareURL = 'https://twitter.com/intent/tweet?text=' + 'あなたの心の中のドラゴンは○○でした！' + '%20%23ドラゴン%20%23Twitter診断'
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
    }
  }
}
</script>

<style scoped>
</style>
