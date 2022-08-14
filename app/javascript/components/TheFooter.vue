<template>
  <footer>
    <div class="text-white bg-navGray w-full py-4">
      <div class="max-w-screen-xl mx-auto p-4">
        <ul class="max-w-screen-md mx-auto text-2xl font-light flex justify-center">
          <li class="my-2 px-4">
            <router-link
              to="/term"
              class="p-2 lg:px-4 md:mx-2 text-center border border-transparent rounded hover:bg-red-100 hover:text-red-700 transition-colors duration-300"
            >
              利用規約
            </router-link>
          </li>
          <li class="my-2 px-4">
            <router-link
              to="/privacypolicy"
              class="p-2 lg:px-4 md:mx-2 text-center border border-transparent rounded hover:bg-red-100 hover:text-red-700 transition-colors duration-300"
            >
              プライバシーポリシー
            </router-link>
          </li>
          <li class="my-2 px-4">
            <a
              href="https://twitter.com/Umesho0415"
              class="p-2 rounded text-white hover:bg-twitterBlue"
            >
              お問い合わせ
            </a>
          </li>
          <li class="my-2 px-4">
            <a
              href="https://twitter.com"
              class="p-2 rounded text-white hover:bg-twitterBlue"
            >
              <i class="ri-twitter-fill" />
            </a>
          </li>
        </ul>
        <div class="text-center text-xl p-2 font-light flex items-center justify-center">
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
