<template>
  <footer>
    <div class='bg-gray-200'>
      <div class="container mx-auto py-4 px-5 flex flex-wrap flex-col flex-row">
        <div class="text-gray-500 sm:text-blue-500 md:text-yellow-500 lg:text-green-500 xl:text-purple-500 text-sm text-center font-light">
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
  name: "TheFooter",
}
</script>

<style scoped>
</style>
