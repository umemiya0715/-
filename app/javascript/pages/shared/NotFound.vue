<template>
  <div class="container mx-auto py-10 text-center min-h-screen">
    <h1 class="text-6xl py-4 font-bold text-white">
      404 Not Found
    </h1>
    <div class="my-10">
      <div class="row-auto text-white">
        <div class="text-2xl sm:text-md md:text-4xl px-3 pt-2">
          <p>お探しのページが見つかりませんでした。</p>
          <p>
            一時的にアクセスができない状況にあるか
            <br>移動もしくは削除された可能性があります。
          </p>
          <p>URLにお間違いがないか再度ご確認ください。</p>
        </div>
      </div>
    </div>
    <div class="m-16 justify-center">
      <button class=" bg-red-400 hover:bg-red-600 rounded p-1">
        <router-link to="/" class="bg-red-500 hover:bg-red-700 text-white font-bold text-2xl rounded w-70 p-4 inline-flex justify-center">トップページに戻る</router-link>
      </button>
    </div>
  </div>
</template>

<script>
export default {
  mounted() {
    document.title = "ページが見つかりません - ドラッター";
  },
};
</script>