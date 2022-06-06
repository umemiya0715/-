<template>
  <footer>
    <div class="bg-gray-100 w-full py-4">
      <div class='max-w-screen-xl mx-auto p-4'>
        <ul class="max-w-screen-md mx-auto text-xl font-light flex justify-center">
          <li class="my-2 px-4">
            <router-link
              to="/term"
              class="p-2 lg:px-4 md:mx-2 text-xl text-gray-500 text-center border border-transparent rounded hover:bg-red-100 hover:text-red-700 transition-colors duration-300"
            >
              利用規約
            </router-link>
          </li>
          <li class="my-2 px-4">
            <router-link
              to="/privacypolicy"
              class="p-2 lg:px-4 md:mx-2 text-xl text-gray-500 text-center border border-transparent rounded hover:bg-red-100 hover:text-red-700 transition-colors duration-300"
            >
              プライバシーポリシー
            </router-link>
          </li>
          <li class="my-2 px-4">
            <a
              href="https://twitter.com/Umesho0415"
              class="p-2 rounded text-twitterBlue hover:text-white hover:bg-twitterBlue"
            >
              <i class="ri-twitter-fill"></i>
            </a>
          </li>
        </ul>
        <div class="text-center text-gray-500 p-2 text-xl font-light flex items-center justify-center">
          ©2022 Dratter
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
