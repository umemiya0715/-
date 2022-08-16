<template>
  <div class="text-center">
    <div class="my-32 grid grid-cols-12 gap-10 md:my-12">
      <div class="col-span-10 col-start-2 my-16 text-6xl font-bold text-white">
        404 Not Found
      </div>
      <div class="col-span-10 col-start-2 row-auto my-16 text-left text-3xl text-white md:text-4xl">
        <p class="my-4">
          お探しのページが見つかりませんでした。
        </p>
        <p class="my-4">
          一時的にアクセスができない状況にあるか
        </p>
        <p class="my-4">
          移動もしくは削除された可能性があります。
        </p>
        <p class="mt-4 mb-6">
          URLにお間違いがないか再度ご確認ください。
        </p>
      </div>
      <div class="col-span-10 col-start-2 my-12">
        <img
          :src="top_logo_src"
          height="1600px"
          width="1000px"
          class="inline"
        >
      </div>
    </div>
    <div class="my-16 justify-center">
      <button class=" rounded bg-red-400 p-1 hover:bg-red-600">
        <router-link
          to="/"
          class="inline-flex justify-center rounded bg-red-500 p-4 text-2xl font-bold text-white hover:bg-red-700"
        >
          トップページに戻る
        </router-link>
      </button>
    </div>
  </div>
</template>

<script>
export default {
  computed: {
    top_logo_src() {
      return require("../../../../public/images/topLogo.png")
    }
  },
  mounted() {
    document.title = "ページが見つかりません - ドラッター";
  },
};
</script>