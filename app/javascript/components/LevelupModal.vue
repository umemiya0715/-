<template>
  <div
    v-if="isVisibleLevelupModal"
    class="relative z-10"
  >
    <div class="fixed inset-0 bg-gray-500 bg-opacity-75 transition-opacity" />
    <div class="fixed inset-0 z-10 overflow-y-auto">
      <div class="flex min-h-full items-end justify-center p-4 text-center sm:items-center sm:p-0">
        <div class="relative overflow-hidden rounded-lg text-left shadow-xl transition-all sm:my-8 sm:w-full sm:max-w-lg">
          <div class="flex flex-col items-center justify-center rounded bg-white">
            <div class="p-6">
              <button
                class="absolute top-3 right-2.5 text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900"
                style="font-size: 32px;"
                @click="handleCloseModal"
              >
                <i class="ri-close-fill"></i>
              </button>
              <div class="text-5xl font-bold text-gray-500 pt-4 pb-1 text-center">
                LEVEL UP!
              </div>
              <div class="text-5xl font-bold text-gray-500 pt-1 pb-2 text-center">
                Lv.{{ displayLevel }}
              </div>
              <div class="mx-auto py-4">
                <img
                  :src="dragon_image_src"
                  height="500px"
                  width="500px"
                  class="justify-center"
                >
              </div>
              <div class="flex items-center justify-center">
                <button
                  class="w-72 rounded bg-red-400 p-1 hover:bg-red-600"
                  @click="handleCloseModal"
                >
                  <div class="rounded bg-red-500 p-4 text-2xl font-bold text-white hover:bg-red-700">
                    閉じる
                  </div>
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default ({
  data() {
    return {
    }
  },
  computed: {
    dragon_image_src() {
      return require("../../../public/images/logo-dragon"+ this.level.current_level + ".png")
      // return require("../../../public/images/logo-dragon3.png")
    },
    displayLevel() {
      if(this.level.current_level == 4) {
        return "MAX"
      } else {
        return this.level.current_level
      }
    }
  },
  props: {
    isVisibleLevelupModal: {
      type: Boolean,
      required: true
    },
    level: {
      type: Object,
      required: true
    }
  },
  methods: {
    handleCloseModal() {
      this.$emit("close-modal");
    }
  }
})
</script>

<style scoped>
</style>