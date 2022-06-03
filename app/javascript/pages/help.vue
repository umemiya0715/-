<template>
  <div class="text-center">
    <div class="grid grid-cols-12 gap-10 md:p-20">
      <div class="col-start-1 col-span-12 mt-20 md:mt-0">
        <div class="text-2xl inline p-5 text-white font-bold border-b-8 border-white md:text-4xl">ドラッターって何？</div>
      </div>
      <div class="text-center text-white col-start-1 col-span-12 p-10 mx-auto">
        <div class="row-auto text-white">
          <div class="text-xl text-left sm:text-md md:text-4xl px-3 pt-2">
            <p>最近のTwitterの運用方法について振り返ることができるアプリです。
            <br>使い方は簡単！　
            <br>トップページの入力画面に診断したいアカウントのIDを入力。
            <br>ツイート内容や使い方に応じて、診断対象のアカウントの心の様子をドラゴンで表してくれます。
            </p>
          </div>
        </div>
      </div>
      <div class="col-start-1 col-span-12 md:mt-0">
        <div class="text-2xl inline p-5 text-white font-bold border-b-8 border-white md:text-4xl">何でドラゴン？</div>
      </div>
      <div class="text-center text-white col-start-1 col-span-12 p-10 mx-auto">
        <div class="row-auto text-white">
          <div class="text-xl sm:text-md md:text-4xl px-3 pt-2">
            <p>作者の趣味です！
            </p>
          </div>
        </div>
      </div>
    </div>
    <div class="m-16 justify-center">
      <button class=" bg-red-500 hover:bg-red-700 font-bold py-2 px-4 text-lg text-white rounded w-56 items-center">        <router-link to="/">トップページに戻る</router-link>
      </button>
    </div>
  </div>
</template>

<script>
export default {
  name: "Help",
  data() {
    return {
      title: "このサイトは何なのか？"
    }
  }
}
</script>

<style scoped>
</style>
