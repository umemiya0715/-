<template>
  <div class="w-full max-w-md mx-auto bg-white shadow-md rounded-md px-6 py-4 my-6">
    <div class="sm:flex justify-left">
      <div class="flex items-center">
        <img class="h-12 w-12 rounded-full" :src="user.image" alt="">
        <div class="ml-2">
          <h3 class="text-2xl text-gray-800 font-medium">{{ user.name }}</h3>
          <span class="text-2xl text-gray-600">{{ user.screen_name }}</span>
        </div>
     </div>
    </div>
    <div class="flex justify-center items-center mt-4">
      <button class="bg-twitterBlue hover:bg-blue-700 text-white text-2xl font-bold py-4 px-4 rounded" @click="updateUserSettings">ユーザー情報を更新する</button>
    </div>
    <div class="mt-3">
      <button class="bg-twitterBlue hover:bg-blue-700 text-white text-2xl font-bold py-4 px-4 rounded" @click="logoutUser">退会する</button>
    </div>
    <div class="mt-4">
      <h4 class="text-sm text-gray-600"></h4>
      <div class="flex items-center overflow-hidden mt-2">
      </div>
    </div>
    <div class="mt-4">
      <h4 class="text-sm text-gray-600"></h4>
      <div class="flex items-center overflow-hidden mt-2">
      </div>
    </div>
    <a class="block mt-4 text-blue-400 hover:underline" href="#"></a>
  </div>
</template>

<script>
export default {
  name: "UserProfileCard",
  props: {
    user: {
      type: Object,
      required: true
    },
  },
  computed: {
  },
  methods: {
    updateUserSettings() {
      this.$emit("update-Settings");
    },
    logoutUser() {
      this.$emit("logout")
    }
  }
}
</script>

<style scoped>
</style>
