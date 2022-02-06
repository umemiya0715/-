<template>
  <div class='d-flex flex-column min-vh-100 bg-cover bg-repeat' :style="{ backgroundImage: 'url(' + image_src + ')' }">
    <TheHeader class='mb-auto' />
      <router-view />
    <TheFooter class='mt-auto' />
  </div>
</template>

<script>
import TheHeader from 'components/TheHeader'
import TheFooter from 'components/TheFooter'

export default {
  components: {
    TheHeader,
    TheFooter,
  },
  methods: {
    randomNumber(min, max){
      return Math.floor(Math.random() * (max + 1 - min)) + min
    },
  },
  computed: {
    image_src() {
      return require("../assets/images/topImage_" + this.randomNumber(1,4) +".png")
    }
  }
}
</script>
