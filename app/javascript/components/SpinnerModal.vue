<template>
  <div
    v-if="isVisibleSpinnerModal"
    class="relative z-10"
  >
    <div class="fixed inset-0 bg-gray-500 bg-opacity-75 transition-opacity" />
    <div class="fixed inset-0 z-10 overflow-y-auto">
      <div class="flex min-h-full items-end justify-center p-4 text-center sm:items-center sm:p-0">
        <div class="relative overflow-hidden rounded-lg text-left shadow-xl transition-all sm:my-8 sm:w-full sm:max-w-lg">
          <div class="bg-red-400 p-1">
            <div class="flex h-32 items-center justify-between rounded bg-red-500 px-40">
              <spinner
                :size="30"
                color="#ffffff"
              />
              <p class="text-4xl font-bold text-white ">
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