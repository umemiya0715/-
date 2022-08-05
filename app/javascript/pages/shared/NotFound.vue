<template>
  <div class="text-center">
    <div class="grid grid-cols-12 gap-10 my-32 md:my-12">
      <div class="col-start-2 col-span-10 text-6xl font-bold text-white my-16">
        404 Not Found
      </div>
      <div class="col-start-2 col-span-10 row-auto text-white text-3xl text-left my-16 sm:text-md md:text-4xl">
        <p class="my-4">お探しのページが見つかりませんでした。</p>
        <p class="my-4">一時的にアクセスができない状況にあるか</p>
        <p class="my-4">移動もしくは削除された可能性があります。</p>
        <p class="mt-4 mb-6">URLにお間違いがないか再度ご確認ください。</p>
      </div>
      <div class="col-start-2 col-span-10 my-12">
        <img
          :src="top_logo_src"
          height="1600px"
          width="1000px"
          class="inline"
        >
      </div>
    </div>
    <div class="my-16 justify-center">
      <button class=" bg-red-400 hover:bg-red-600 rounded p-1">
        <router-link
          to="/"
          class="bg-red-500 hover:bg-red-700 text-white font-bold text-2xl rounded w-70 p-4 inline-flex justify-center"
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