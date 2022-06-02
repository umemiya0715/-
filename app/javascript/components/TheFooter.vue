<template>
  <footer>
    <div class="bg-gray-100 w-full py-4 fixed bottom-0">
      <div class='max-w-screen-xl mx-auto p-4'>
        <ul class="max-w-screen-md mx-auto text-2xl font-light flex justify-center">
          <li class="my-2 px-4">
            <router-link
              to="/term"
              class="text-gray-500 hover:text-gray-800"
            >
              利用規約
            </router-link>
          </li>
          <li class="my-2 px-4">
            <router-link
              to="/privacypolicy"
              class="text-gray-500 hover:text-gray-800"
            >
              プライバシーポリシー
            </router-link>
          </li>
          <li class="my-2 px-4">
            <a
              href="https://twitter.com/Umesho0415"
              class="text-gray-500 hover:text-gray-800"
            >
              <i class="ri-twitter-fill"></i>
            </a>
          </li>
        </ul>
        <div class="text-center text-gray-500 p-2 text-2xl font-light flex items-center justify-center">
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
