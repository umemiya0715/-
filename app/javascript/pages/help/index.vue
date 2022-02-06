<template>
  <div class="p-8 bg-opacity-50">
    <div class="text-center">
      <h3>{{ title }}</h3>
    </div>
    <div class="text-center containter text-gray-600 mt-5 mb-5 font-light">
      <div class="m-5">
        ここに解説を書いていく
      </div>
    </div>
    <div class="text-center">
      <router-link to="/">戻る</router-link>
    </div>
  </div>
</template>

<script>
export default {
  name: "Help",
  data() {
    return {
      title: "このサイトは何なのか？"
    }
  }
}
</script>

<style scoped>
</style>
