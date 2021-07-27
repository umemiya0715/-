<template>
  <header>
    <div class='bg-gray-200'>
      <div class="container mx-auto py-4 px-5 flex flex-wrap flex-col sm:flex-row">
        <div class="text-gray-500 text-sm text-right font-light sm:text-right">
          <router-link
            to="/register"
            class="nav-link"
          >
            ユーザー登録
          </router-link>
          <router-link
            to="/login"
            class="nav-link"
          >
            ログイン
          </router-link>
        </div>
      </div>
    </div>
  </header>
</template>

<script>
export default {
  name: "TheHeader",
  computed: {
  },
  methods: {
    
  }
}
</script>

<style scoped>
</style>
