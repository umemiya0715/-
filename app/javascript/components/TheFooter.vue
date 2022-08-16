<template>
  <footer>
    <div class="bg-navGray w-full py-4 text-white">
      <div class="mx-auto max-w-screen-xl p-4">
        <ul class="mx-auto flex max-w-screen-md justify-center text-2xl font-light">
          <li class="my-2 px-4">
            <router-link
              to="/term"
              class="rounded border border-transparent p-2 text-center transition-colors duration-300 hover:bg-red-100 hover:text-red-700 md:mx-2 lg:px-4"
            >
              利用規約
            </router-link>
          </li>
          <li class="my-2 px-4">
            <router-link
              to="/privacypolicy"
              class="rounded border border-transparent p-2 text-center transition-colors duration-300 hover:bg-red-100 hover:text-red-700 md:mx-2 lg:px-4"
            >
              プライバシーポリシー
            </router-link>
          </li>
          <li class="my-2 px-4">
            <a
              href="https://twitter.com/Umesho0415"
              class="hover:bg-twitterBlue rounded p-2 text-white"
            >
              お問い合わせ
            </a>
          </li>
        </ul>
        <div class="flex items-center justify-center p-2 text-center text-xl font-light">
          ©2022 Dratter
        </div>
      </div>
    </div>
  </footer>
</template>

<script>
export default {
}
</script>

<style scoped>
</style>
