<template>
  <div class="w-full mx-auto bg-white shadow-md rounded-md px-6 py-4 my-12">
    <div class="sm:flex justify-left py-4">
      <div class="flex items-center">
        <img class="h-24 w-24 rounded-full" :src="'../images/' + result.dragon.image" alt="">
        <div class="ml-4 text-left">
          <h3 class="text-3xl text-gray-800 font-medium">{{ result.target_account }}</h3>
          <h3 class="text-3xl text-gray-800 font-medium">{{ result.dragon.name }}</h3>
          <h3 class="text-3xl text-gray-800">{{ result.dragon.explanation }}</h3>
          <h3 class="text-2xl text-gray-400">診断を行った日-{{ result.created_at }}</h3>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
  name: "ResultsCard",
  data() {
    return{
    }
  },
  props: {
    result: {
      type: Array,
      required: true
    },
  },
  computed: {
    ...mapGetters(
      'results', ['results']
    ),
    dragon_image_src() {
      const result = this.results[0]
        return require("../../../public/images/"  + result.dragon.image)
    },
  },
  methods: {

  }
}
</script>

<style scoped>
</style>
