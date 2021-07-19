<template>
  <button id="app" class="w-24 m-4 p-4 rounded-sm bg-red-500 text-center text-white">
    <p>{{ message }}</p>
  </button>
</template>

<script>
export default {
  data: function () {
    return {
      message: "Hello Vue!"
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
