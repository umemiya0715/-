<<template>
  <div
    id="register-form"
    class="container w-50 text-center"
  >
    <div class="h3 mb-3">
      ユーザー登録
    </div>
    <div class="form-group text-left">
      <label for="name">ユーザー名</label>
        <input
          id="name"
          name="ユーザー名"
          type="text"
          placeholder="username"
          class="form-control"
        >
    </div>
    <div class="form-group text-left">
      <label for="email">メールアドレス</label>
        <input
          id="email"
          name="メールアドレス"
          type="email"
          placeholder="test@example.com"
          class="form-control"
        >
    </div>
      <div class="form-group text-left">
          <label for="password">パスワード</label>
          <input
            id="password"
            name="パスワード"
            type="password"
            placeholder="password"
            class="form-control"
          >
      </div>
      <div class="form-group text-left">
          <label for="password_confirmation">パスワード（確認）</label>
          <input
            id="password_confirmation"
            name="パスワード（確認）"
            type="password"
            placeholder="password"
            class="form-control"
          >
      </div>
      <button
        type="submit"
        class="btn btn-primary"
      >
        登録
      </button>
      <router-link to='/'>トップページに戻る</router-link>
  </div>
</template>

<script>
export default {
  name: "Register",
}
</script>

<style scoped>
</style>
