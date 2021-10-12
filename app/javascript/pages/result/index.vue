<template>
  <div class="mt-8 bg-red-500 bg-opacity-50">
    <div class="text-center">
      <h3>{{ title }}</h3>
    </div>
    <div class="text-center" v-if="dragons">
      <h3>{{ dragons.attributes.name }}</h3>
      <h3>{{ dragons.attributes.explanation }}</h3>
      <h3>{{ accounts.dragonId }}</h3>
    </div>
    <div class="text-center" v-if="dragons">
      <h3>{{ image }}</h3>
    </div>
    <div class="text-center">
      <router-link to="/">トップページに戻る</router-link>
    </div>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
  name: "result",
  data() {
    return {
      title: "あなたの心に潜むドラゴンは…",
      image: "かっこいい"
    }
  },
  computed: {
    ...mapGetters(
      'dragons', ['dragons']
    ),
    ...mapGetters(
      'accounts', ['accounts']
    )
  }
}
</script>

<style scoped>
</style>
