<template>
  <div class="mt-8 bg-red-500 bg-opacity-50">
    <div class="text-center">
      <h3>{{ title }}</h3>
    </div>
    <div class="text-center">
      <div class="container text-gray-600 mt-5 mb-5 font-light">
        <label class="block">
          README読んで
        </label>
      </div>
    </div>
    <div class="text-center">
      <router-link to="/">トップページに戻る</router-link>
    </div>
  </div>
</template>

<script>
export default {
  name: "help",
  data() {
    return {
      title: "何このページ？"
    }
  }
}
</script>

<style scoped>
</style>
