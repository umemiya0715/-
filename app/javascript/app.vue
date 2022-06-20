<template>
  <div class='d-flex flex-column min-h-screen bg-cover bg-fixed bg-center pt-24' :style="{ backgroundImage: 'url(' + image_src + ')' }">
    <TheHeader class='mb-auto' />
      <transition>
        <TheFlash v-if="flash.message" />
      </transition>
      <router-view />
    <TheFooter class='mt-auto' />
  </div>
</template>

<script>
import TheHeader from 'components/TheHeader'
import TheFooter from 'components/TheFooter'
import TheFlash from 'components/TheFlash'
import { mapGetters } from 'vuex'

export default {
  components: {
    TheHeader,
    TheFooter,
    TheFlash
  },
  methods: {
  },
  computed: {
    ...mapGetters(
      'flash',['flash']
    ),
    image_src() {
      return require("../../public/images/topImage.jpg")
    }
  }
}
</script>

<style scoped>
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.5s;
}
.fade-enter,
.fade-leave-to {
  opacity: 0;
}
</style>