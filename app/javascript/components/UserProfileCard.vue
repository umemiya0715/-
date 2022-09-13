<template>
  <div class="mx-auto my-12 w-full rounded-md bg-white px-6 py-4 shadow-md">
    <div class="py-4 sm:flex">
      <img
        class="h-20 w-20 rounded-full"
        :src="user.image"
      >
      <div class="w-full flex flex-row items-center justify-between">
        <div class="ml-4 text-left">
          <h3 class="text-3xl font-medium text-gray-800">
            {{ user.name }}
          </h3>
          <h3 class="text-3xl text-gray-600">
            @{{ user.screen_name }}
          </h3>
        </div>
        <div class="text-left">
          <h3 class="text-3xl font-medium text-gray-800">
            Lv. {{ currentLevel }}<br>
            次のレベルまで {{ nextLevel }}
          </h3>
        </div>
      </div>
    </div>
    <div class="border-t-2 pt-4 text-2xl">
      現在のレベルに応じてトップページに表示される画像を変更できます。
    </div>
    <div class="my-4 flex flex-row items-center justify-center">
      <select
        v-model="selectLevel.level"
        class="bg-gray-50 border border-gray-300 text-gray-900 text-2xl rounded-lg focus:ring-blue-500 focus:border-blue-500 w-80 p-2.5 mx-4"
      >
        <option disabled value="">設定したいレベルを選択</option>
        <option>レベル1</option>
        <option v-if="level.current_level >= 2">レベル2</option>
        <option v-if="level.current_level >= 3">レベル3</option>
        <option v-if="level.current_level >= 4">レベル4</option>
      </select>
      <button
        class="rounded bg-blue-300 p-1 hover:bg-blue-600"
        @click="updateLevel"
      >
        <div class="bg-twitterBlue rounded p-4 text-2xl font-bold text-white hover:bg-blue-700">
          変更する
        </div>
      </button>
    </div>
    <div class="border-t-2 pt-4 text-2xl">
      次のボタンを押すとTwitterの最新プロフィールに更新されます。
    </div>
    <div class="my-4 flex flex-row items-center justify-center">
      <button
        class="rounded bg-blue-300 p-1 hover:bg-blue-600"
        @click="updateUserSettings"
      >
        <div class="bg-twitterBlue rounded p-4 text-2xl font-bold text-white hover:bg-blue-700">
          <i class="ri-restart-line mx-2" />ユーザー情報を更新する
        </div>
      </button>
    </div>
    <div class="flex flex-row items-center justify-center border-t-2 pt-4 text-2xl">
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
        class="rounded bg-red-400 p-1 hover:bg-red-600"
        :disabled="!checkbox"
        @click="logoutUser"
      >
        <div class="rounded bg-red-500 p-4 text-2xl font-bold text-white hover:bg-red-700">
          退会する
        </div>
      </button>
      <button
        v-if="!checkbox"
        class="cursor-not-allowed rounded bg-red-400 p-1 opacity-50 hover:bg-red-600"
        :disabled="!checkbox"
        @click="logoutUser"
      >
        <div class="rounded bg-red-500 p-4 text-2xl font-bold text-white hover:bg-red-700">
          退会する
        </div>
      </button>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    user: {
      type: Object,
      required: true
    },
    level: {
      type: Object,
      required: true
    }
  },
  data() {
    return {
      checkbox: false,
      selectLevel: {
        id: this.level.user_id,
        level: ''
      }
    }
  },
  computed: {
    currentLevel() {
      if (this.level.current_level < 4) {
        return this.level.current_level
      } else {
        return 'MAX'
      }
    },
    nextLevel() {
      if (this.level.current_level < 4) {
        const next = [0, 3, 7, 14]
        let exp = next[this.level.current_level]
        return exp - this.level.experience
      } else {
        return '-'
      }
    }
  },
  methods: {
    updateUserSettings() {
      this.$emit("update-Settings");
    },
    logoutUser() {
      this.$emit("logout")
    },
    updateLevel() {
      this.$emit("update-level", this.selectLevel)
    }
  }
}
</script>

<style scoped>
</style>
