<template>
  <div
    v-show="isVisibleSpinnerModal"
    class="relative z-10"
  >
    <div class="fixed inset-0 bg-gray-500 bg-opacity-75 transition-opacity">
    </div>
    <div class="fixed z-10 inset-0 overflow-y-auto">
      <div class="flex items-end sm:items-center justify-center min-h-full p-4 text-center sm:p-0">
        <div class="relative rounded-lg text-left overflow-hidden shadow-xl transform transition-all sm:my-8 sm:max-w-lg sm:w-full">
          <div class="bg-red-400 p-1">
            <div class="bg-red-500 rounded px-40 h-32 justify-between items-center flex">
              <spinner
                :size="30"
                color="#ffffff"
              />
              <p class="text-white font-bold text-4xl ">
                診断中‥
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import Spinner from 'vue-spinner-component/src/Spinner.vue'

export default ({
  components: {
    Spinner,
  },
  props: {
    isVisibleSpinnerModal: {
      type: Boolean,
      required: true
    }
  },
  methods: {
  }
})
</script>

<style scoped>
</style>