<template>
  <div class="text-center min-h-screen">
    <div class="grid grid-cols-12 gap-10 md:pt-20">
      <div class="col-start-2 col-span-10 mt-20 md:mt-0">
        <div class="text-3xl inline p-2 text-white font-bold border-b-8 border-white md:text-4xl">{{ title }}</div>
      </div>
      <div class="items-center col-start-2 col-span-10">
        <div v-for="result in results" v-bind:key="result.id" class="w-full mx-auto bg-white hover:bg-gray-200 shadow-md rounded-md my-12">
          <router-link :to="`/previous/${result.id}`">
            <div class="sm:flex justify-left px-4 py-6">
              <div class="flex items-center">
                <img class="h-24 w-24" :src="'../images/'  + result.dragon.image" alt="">
                <div class="ml-4 text-left">
                  <h3 class="text-3xl text-gray-800 font-medium">{{ result.target_account }}</h3>
                  <h3 class="text-3xl text-gray-800 font-medium">{{ result.dragon.name }}</h3>
                  <h3 class="text-3xl text-gray-800">{{ result.dragon.explanation }}</h3>
                  <h3 class="text-2xl text-gray-400">診断を行った日-{{ format(result.created_at) }}</h3>
                </div>
              </div>
            </div>
          </router-link>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
import { mapGetters } from 'vuex'
import dayjs from 'dayjs';

export default {
  name: "PreviousResults",
  components: {
  },
  data() {
    return {
      title: "過去の診断結果",
      results: {}
    };
  },
  computed: {
    ...mapGetters(
      'users', ['currentUser']
    ),
    dragon_image_src() {
      const result = this.results[0]
        return require("../../../public/images/"  + result.dragon.image)
    },
  },
  mounted() {
    this.fetchResults()
  },
  methods: {
    async fetchResults() {
      await axios.get(`/api/v1/results/${this.currentUser.id}/previous_results`)
      .then(res => {
        this.results = res.data
      })
    },
    format(date) {
      let created_at = dayjs(date).format('YYYY-MM-DD');
      return created_at;
    },
  }
}
</script>

<style scoped>
</style>
