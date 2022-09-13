<template>
  <div class="text-center">
    <div class="grid grid-cols-12 gap-10 md:pt-20 md:pb-10">
      <div class="col-span-10 col-start-2 mt-20 md:mt-0">
        <div
          v-if="results"
          class="inline border-b-8 border-white p-2 text-2xl font-bold text-white md:text-4xl"
        >
          {{ shortenedName }}さんの心のドラゴンは…
        </div>
      </div>
      <div
        v-if="results"
        class="col-span-10 col-start-2 mx-auto pb-10 text-center text-white"
      >
        <div class="text-6xl font-bold">
          <h3>{{ results.dragon.name }}</h3>
        </div>
        <div class="m-auto py-4">
          <img :src="dragon_image_src">
        </div>
        <ResultRadar :style="chartStyles" />
        <div class="m-4 mx-4 rounded-md border-4 border-white p-4 font-bold">
          <div class="inline border-b-2 border-white text-3xl font-bold">
            性格
          </div>
          <div class="m-4 text-3xl">
            {{ results.dragon.explanation }}
          </div>
          <div class="m-4 text-left text-2xl">
            {{ results.dragon.personality }}
          </div>
        </div>
        <div class="m-4 mx-4 rounded-md border-4 border-white p-4 font-bold">
          <div class="inline border-b-2 border-white text-3xl font-bold">
            アドバイス
          </div>
          <div class="m-4 text-left text-2xl">
            {{ results.dragon.advice }}
          </div>
        </div>
        <div class="m-4 mx-4 rounded-md border-4 border-white p-4 font-bold">
          <div class="inline border-b-2 border-white text-3xl font-bold">
            相性のいいドラゴン
          </div>
          <div class="m-4 text-left text-2xl">
            {{ results.dragon.affinity }}
          </div>
        </div>
      </div>
    </div>
    <div class="mx-auto p-4">
      <button
        class="w-72 rounded bg-blue-300 p-1 hover:bg-blue-600"
        @click="twitterShare"
      >
        <div class="bg-twitterBlue rounded py-4 text-2xl font-bold text-white hover:bg-blue-700">
          <i class="ri-twitter-fill px-2" />Twitterでシェアする
        </div>
      </button>
    </div>
    <transition name="spinner">
      <LevelupModal
        :level="levels"
        :is-visible-levelup-modal="isVisibleLevelupModal"
        @close-modal="closeLevelupModal"
      />
    </transition>
    <div class="mx-auto p-4 pb-20">
      <button class="w-72 rounded bg-red-400 p-1 hover:bg-red-600">
        <div class="rounded bg-red-500 p-4 text-2xl font-bold text-white hover:bg-red-700">
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
import LevelupModal from '../components/LevelupModal.vue'

export default {
  components: {
    ResultRadar,
    LevelupModal
  },
  data() {
    return {
      title: "あなたの心に潜むドラゴンは…",
      isVisibleLevelupModal: true
    }
  },
  computed: {
    ...mapGetters(
      'users', ['currentUser']
    ),
    ...mapGetters(
      'results', ['results']
    ),
    ...mapGetters(
      'levels', ['levels']
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
    },
    currentPath() {
      return this.$route.path
    },
    currentLevel() {
      return this.levels.current_level
    }
  },
  watch: {
    currentPath: function() {
      this.levelUp()
    },
    currentLevel: function(){
      this.openLevelupModal()
    }
  },
  mounted() {
    this.levelUp()
  },
  methods: {
    levelUp() {
      this.$store.dispatch('levels/levelUp', this.currentUser.id)
    },
    twitterShare(){
      const url = `https://www.dragon-twitter-analysis.com/dragons/${this.results.dragon.id}`
      window.open(`https://twitter.com/share?text=${this.results.target_account}さんの心の中のドラゴンは${this.results.dragon.name}でした！%0a%23ドラッター%20%23Dratter%0a&url=${url}`, '_blank')
    },
    openLevelupModal() {
      this.isVisibleLevelupModal = true;
    },
    closeLevelupModal() {
      this.isVisibleLevelupModal = false;
    }
  },
}
</script>

<style scoped>
</style>
