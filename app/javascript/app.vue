<template>
  <div class='d-flex flex-column min-vh-100 bg-cover bg-fixed py-32' :style="{ backgroundImage: 'url(' + image_src + ')' }">
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
  },
  computed: {
    image_src() {
      return require("../../public/images/topImage.png")
    }
  }
}
</script>
