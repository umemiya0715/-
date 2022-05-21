<template>
  <div class="text-center">
    <div class="grid grid-cols-12 gap-10 md:p-20">
      <div class="col-start-1 col-span-12 mt-20 md:mt-0">
        <div class="text-2xl inline p-5 text-white font-bold border-b-8 border-white md:text-4xl">{{ title }}</div>
      </div>
      <div class="text-center text-white col-start-1 col-span-12 p-10 mx-auto" v-if="dragons.attributes">
        <div class="text-2xl font-bold p-4">
          <h3>{{ dragon.attributes.name }}</h3>
        </div>
        <div class="m-auto p-4">
          <img :src="dragon_image_src">
        </div>
        <div class="text-lg p-4 m-4 border-2 border-white rounded-md font-bold mx-16">
          <div class="text-2xl inline font-bold border-b-2 border-white">性格</div>
          <div class="m-4">{{ dragon.attributes.explanation }}</div>
          <div class="m-4">{{ dragon.attributes.personality }}</div>
        </div>
        <div class="text-lg p-4 m-4 border-2 border-white rounded-md font-bold mx-16">
          <div class="text-2xl inline font-bold border-b-2 border-white">アドバイス</div>
          <div class="m-4">{{ dragon.attributes.advice }}</div>
        </div>
      </div>
    </div>
    <div class="text-center p-4">
      <button class=" bg-red-500 hover:bg-red-700 font-bold py-4 px-4 text-lg text-white rounded w-48 items-center">診断してみる</button>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
import { mapGetters } from 'vuex'

export default {
  name: "result",
  data() {
    return {
      title: "あなたの心に潜むドラゴンは…",
      dragon: {},
    };
  },
  computed: {
    ...mapGetters(
      'dragons', ['dragons']
    ),
    ...mapGetters(
      'results', ['results']
    ),
    dragon_image_src() {
        return require("../../assets/images/" + this.dragon.attributes.image)
    },
    currentPath() {
      return this.$route.path
    },
  },
  watch: {
    currentPath: function() {
      this.fetchDragons()
    }
  },
  mounted() {
    this.fetchDragons()
  },
  methods: {
    async fetchDragons() {
      const res = await axios.get(`/api/v1/dragons/${this.$route.params.id}`)
      this.dragon = res.data
    }
  }
}
</script>

<style scoped>
</style>
