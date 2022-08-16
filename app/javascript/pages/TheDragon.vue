<template>
  <div class="text-center">
    <div class="grid grid-cols-12 gap-10 pt-20">
      <div
        v-if="dragon"
        class="col-span-10 col-start-2 mx-auto px-10 pb-10 text-center text-white"
      >
        <div class="border-b-8 border-white text-6xl font-bold">
          <h3>{{ dragon.name }}</h3>
        </div>
        <div class="m-auto py-4">
          <img :src="dragon_image_src">
        </div>
        <div class="m-4 mx-4 rounded-md border-4 border-white p-4 font-bold">
          <div class="inline border-b-2 border-white text-3xl font-bold">
            性格
          </div>
          <div class="m-4 text-3xl">
            {{ dragon.explanation }}
          </div>
          <div class="m-4 text-left text-2xl">
            {{ dragon.personality }}
          </div>
        </div>
        <div class="m-4 mx-4 rounded-md border-4 border-white p-4 font-bold">
          <div class="inline border-b-2 border-white text-3xl font-bold">
            アドバイス
          </div>
          <div class="m-4 text-left text-2xl">
            {{ dragon.advice }}
          </div>
        </div>
        <div class="m-4 mx-4 rounded-md border-4 border-white p-4 font-bold">
          <div class="inline border-b-2 border-white text-3xl font-bold">
            相性のいいドラゴン
          </div>
          <div class="m-4 text-left text-2xl">
            {{ dragon.affinity }}
          </div>
        </div>
      </div>
    </div>
    <div class="mx-auto p-4 pb-20">
      <button class="w-72 rounded bg-red-400 p-1 hover:bg-red-600">
        <div class="rounded bg-red-500 p-4 text-2xl font-bold text-white hover:bg-red-700">
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
