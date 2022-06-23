<template>
  <div class="text-center">
    <div class="grid grid-cols-12 gap-10 md:pt-20">
      <div class="text-center text-white col-start-2 col-span-10 px-10 pb-10 mx-auto" v-if="dragon">
        <div class="text-6xl font-bold border-b-8 border-white">
          <h3>{{ dragon.name }}</h3>
        </div>
        <div class="m-auto">
          <img :src="dragon_image_src">
        </div>
        <div class="p-4 m-4 border-4 border-white rounded-md font-bold mx-4">
          <div class="text-3xl inline font-bold border-b-2 border-white">性格</div>
          <div class="text-3xl m-4">{{ dragon.explanation }}</div>
          <div class="text-2xl m-4 text-left">{{ dragon.personality }}</div>
        </div>
        <div class="p-4 m-4 border-4 border-white rounded-md font-bold mx-4">
          <div class="text-3xl inline font-bold border-b-2 border-white">アドバイス</div>
          <div class="text-2xl m-4 text-left">{{ dragon.advice }}</div>
        </div>
      </div>
    </div>
    <div class="text-center px-4 pb-12">
      <button class=" bg-red-500 hover:bg-red-700 font-bold py-4 px-8 text-2xl text-white rounded w-52 items-center">診断してみる</button>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
import { mapGetters } from 'vuex'

export default {
  name: "Dragon",
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
    dragon_image_src() {
        return require("../../../public/images/" + this.dragon.image)
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
