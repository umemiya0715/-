<template>
  <div class="text-center">
    <div class="grid grid-cols-12 gap-10 pt-20">
      <div
        v-if="dragon"
        class="text-center text-white col-start-2 col-span-10 px-10 pb-10 mx-auto"
      >
        <div class="text-6xl font-bold border-b-8 border-white">
          <h3>{{ dragon.name }}</h3>
        </div>
        <div class="m-auto py-4">
          <img class="" :src="dragon_image_src">
        </div>
        <div class="p-4 m-4 border-4 border-white rounded-md font-bold mx-4">
          <div class="text-3xl inline font-bold border-b-2 border-white">
            性格
          </div>
          <div class="text-3xl m-4">
            {{ dragon.explanation }}
          </div>
          <div class="text-2xl m-4 text-left">
            {{ dragon.personality }}
          </div>
        </div>
        <div class="p-4 m-4 border-4 border-white rounded-md font-bold mx-4">
          <div class="text-3xl inline font-bold border-b-2 border-white">
            アドバイス
          </div>
          <div class="text-2xl m-4 text-left">
            {{ dragon.advice }}
          </div>
        </div>
        <div class="p-4 m-4 border-4 border-white rounded-md font-bold mx-4">
          <div class="text-3xl inline font-bold border-b-2 border-white">
            相性のいいドラゴン
          </div>
          <div class="text-2xl m-4 text-left">
            {{ dragon.affinity }}
          </div>
        </div>
      </div>
    </div>
    <div class="p-4 pb-20 mx-auto">
      <button class="bg-red-400 hover:bg-red-600 rounded p-1 w-72">
        <div class="bg-red-500 hover:bg-red-700 text-white text-2xl font-bold p-4 rounded">
          <router-link to="/">
            診断してみる
          </router-link>
        </div>
      </button>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
import { mapGetters } from 'vuex'

export default {
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
