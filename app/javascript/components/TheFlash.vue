<template>
  <div>
    <div
      v-if="flash.type == 'info'"
      class="fixed top-24 w-full rounded border border-green-400 bg-green-100 px-4 py-3 text-xl text-green-700"
    >
      {{ flash.message }}
    </div>
    <div
      v-if="flash.type == 'alert'"
      class="fixed top-24 w-full rounded border border-red-400 bg-red-100 px-4 py-3 text-xl text-red-700"
    >
      {{ flash.message }}
    </div>
  </div>
</template>

<script>
import { mapGetters } from "vuex"

export default {
  data() {
    return {
      isShow: true
    }
  },
  computed: {
    ...mapGetters({ flash: "flash/flash" })
  },
  mounted() {
    setTimeout(() => {
      this.$store.dispatch("flash/fetchFlash",{
        type: "",
        message: ""
      })
    }, 2000)
  }
}
</script>

<style scoped>
</style>
