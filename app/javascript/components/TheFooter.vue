<template>
  <footer class="bg-white w-full py-8">
    <div class='max-w-screen-xl mx-auto px-4'>
      <div class="max-w-screen-md mx-auto text-lg font-light flex justify-center">
        <div class="my-2 px-4">
          <router-link
            to="/term"
            class="text-gray-500 hover:text-gray-800"
          >
            利用規約
          </router-link>
        </div>
        <div class="my-2 px-4">
          <router-link
            to="/privacypolicy"
            class="text-gray-500 hover:text-gray-800"
          >
            プライバシーポリシー
          </router-link>
        </div>
        <div class="my-2 px-4">
          <router-link
            to="/"
            class="text-gray-500 hover:text-gray-800"
          >
            お問い合わせ
          </router-link>
        </div>
      </div>
    </div>
  </footer>
</template>

<script>
export default {
  name: "TheFooter",
}
</script>

<style scoped>
</style>
