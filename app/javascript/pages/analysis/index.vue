<template>
  <div class="mt-8 bg-red-500 bg-opacity-50">
    <div class="text-center">
      <h3>{{ title }}</h3>
    </div>
    <div class="text-center">
      <form class="grid grid-cols-1 gap-6 m-16">
        <label class="block">
          <input type="text" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50" placeholder="@dragon">
          <button class="bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded">診断する</button>
        </label>
      </form>
    </div>
    <div class="text-center">
      <router-link to="/">トップページに戻る</router-link>
    </div>
  </div>
</template>

<script>
export default {
  name: "Analysis",
  data() {
    return {
      title: "あなたの心は..."
    }
  }
}
</script>

<style scoped>
</style>
