<template>
  <div class="w-full mx-auto bg-white shadow-md rounded-md px-6 py-4 my-12">
    <div class="sm:flex justify-left py-4">
      <div class="flex items-center">
        <img
          class="h-20 w-20 rounded-full"
          :src="user.image"
        >
        <div class="ml-4 text-left">
          <h3 class="text-3xl text-gray-800 font-medium">
            {{ user.name }}
          </h3>
          <h3 class="text-3xl text-gray-600">
            @{{ user.screen_name }}
          </h3>
        </div>
      </div>
    </div>
    <div class="text-2xl pt-4 border-t-2">
      次のボタンを押すとTwitterの最新プロフィールに更新されます
    </div>
    <div class="flex flex-row justify-center items-center my-4">
      <button
        class="bg-blue-300 hover:bg-blue-600 rounded p-1"
        @click="updateUserSettings"
      >
        <div class="bg-twitterBlue hover:bg-blue-700 text-white text-2xl font-bold py-4 px-4 rounded">
          <i class="ri-restart-line mx-2" />ユーザー情報を更新する
        </div>
      </button>
    </div>
    <div class="flex flex-row justify-center items-center text-2xl pt-4 border-t-2">
      <input
        v-model="checkbox"
        type="checkbox"
        style="transform:scale(2.0);"
        class="mr-6"
      >
      退会する場合は全ての情報が削除されます。
    </div>
    <div class="my-4">
      <button
        v-if="checkbox"
        class="bg-red-400 hover:bg-red-600 rounded p-1"
        :disabled="!checkbox"
        @click="logoutUser"
      >
        <div class="bg-red-500 hover:bg-red-700 text-white text-2xl font-bold p-4 rounded">
          退会する
        </div>
      </button>
      <button
        v-if="!checkbox"
        class="bg-red-400 hover:bg-red-600 rounded p-1 cursor-not-allowed opacity-50"
        :disabled="!checkbox"
        @click="logoutUser"
      >
        <div class="bg-red-500 hover:bg-red-700 text-white text-2xl font-bold p-4 rounded">
          退会する
        </div>
      </button>
    </div>
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
  data() {
    return {
      checkbox: false
    }
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
