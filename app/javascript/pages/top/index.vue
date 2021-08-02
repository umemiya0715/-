<template>
  <div class="mt-8 bg-red-300 bg-gray-200">
    <div class="text-center">
      <h3>{{ title }}</h3>
    </div>
    <div class="text-center">
      <form class="grid grid-cols-1 gap-6 m-16">
        <div class="mt-4">
          <input type="text" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50" placeholder="@dragon">
        </div>
      </form>
      <router-link to="/result" class="bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded">診断する</router-link>
    </div>
    <div class="text-center">
      <router-link to="/help">ドラゴン？</router-link>
    </div>
  </div>
</template>

<script>
export default {
  name: "top",
  data() {
    return {
      title: "エモドラ"
    }
  }
}
</script>

<style scoped>
</style>
