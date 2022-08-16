<template>
  <div
    class="bg-cover bg-fixed bg-center"
    :style="{ backgroundImage: 'url(' + image_src + ')' }"
  >
    <TheHeader class="sticky top-0 z-10 mb-auto" />
    <transition name="fade">
      <TheFlash v-if="flash.message" />
    </transition>
    <transition mode="out-in">
      <router-view />
    </transition>
    <TheFooter class="bottom-0 mt-auto w-full" />
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
.v-enter-active, .v-leave-active {
  transition: opacity .5s;
}
.v-enter, .v-leave-to {
  opacity: 0;
}
</style>