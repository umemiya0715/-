<template>
  <div>
    <div v-if="flash.type == 'info'" class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded fixed top-28 w-full">
      {{ flash.message }}
    </div>
    <div v-if="flash.type == 'alert'" class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded fixed top-28 w-full">
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
