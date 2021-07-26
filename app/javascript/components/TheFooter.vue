<template>
  <footer>
    <div class='bg-gray-200'>
      <div class="container mx-auto py-4 px-5 flex flex-wrap flex-col sm:flex-row">
        <div class="text-gray-500 text-sm text-center font-light sm:text-left">
          <router-link
            to="/term"
            class="ml-3"
          >
            利用規約
          </router-link>
          <router-link
            to="/privacypolicy"
            class="nav-link"
          >
            プライバシーポリシー
          </router-link>
          <router-link
            to="/"
            class="nav-link"
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
  name: "TheHeader",
}
</script>

<style scoped>
</style>
