<template>
  <div
    id="login-form"
    class="container w-50 text-center"
  >
    <div class="h3 mb-3">
      ログイン
    </div>
      <div class="form-group text-left">
          <label for="email">メールアドレス</label>
          <input
            id="email"
            type="email"
            placeholder="test@example.com"
            class="form-control"
            name="メールアドレス"
          >
      </div>
      <div class="form-group text-left">
        <label for="password">パスワード</label>
        <input
          id="password"
          type="password"
          placeholder="password" 
          class="form-control"
          name="パスワード"
        >
      </div>
      <button
        type="submit"
        class="btn btn-primary"
      >
        ログイン
      </button>
      <router-link to='/'>トップページに戻る</router-link>
  </div>
</template>

<script>
export default {
  name: "Login",
  data() {
    return {
      title: "エモドラ"
    }
  }
}
</script>

<style scoped>
</style>
