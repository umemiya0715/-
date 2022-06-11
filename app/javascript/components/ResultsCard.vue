<template>
  <div class="w-full mx-auto bg-white shadow-md rounded-md px-6 py-4 my-12">
    <div class="sm:flex justify-left py-4">
      <div class="flex items-center">
        <!-- <img class="h-20 w-20 rounded-full" :src="dragon_image_src" alt=""> -->
        <div class="ml-4 text-left">
          <h3 class="text-3xl text-gray-800 font-medium">{{ result.target_account }}</h3>
          <h3 class="text-3xl text-gray-800 font-medium">{{ result.dragon.name }}</h3>
          <h3 class="text-3xl text-gray-600">@{{ result.dragon.explanation }}</h3>
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
