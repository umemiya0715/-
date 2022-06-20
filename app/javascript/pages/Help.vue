<template>
  <div class="text-center min-h-screen">
    <div class="grid grid-cols-12 gap-10 md:pt-20">
      <div class="text-center text-white col-start-2 col-span-10">
        <div class="text-4xl inline-block p-2 font-bold border-b-8 border-white mb-10">
          ドラッターって何？
        </div>
        <p class="text-3xl col-start-2 col-span-10 text-left text-white">最近のTwitterの運用方法について振り返ることができるアプリです。</p>
      </div>

      <div class="text-center text-white col-start-2 col-span-10">
        <div class="text-4xl inline-block p-2 font-bold border-b-8 border-white mb-10">使い方</div>
        <div class="text-3xl text-left">
          <p>トップページの入力画面に診断したいアカウントのIDを入力。</p>
          <p>「診断する」ボタンを押して、診断結果が返ってくるまで少しの間待機。</p>
          <p>ツイート内容や使い方に応じて、診断対象のアカウントの心の様子をドラゴンで表してくれます。</p>
          <p>Twitterアカウントでユーザー登録をすると、過去に行った診断結果を振り返ることができます。</p>
        </div>
      </div>

      <div class="text-center text-white col-start-2 col-span-10">
        <div class="text-4xl inline-block p-2 font-bold mb-10 border-b-8 border-white">何でドラゴン？</div>
        <div class="text-3xl text-left">
          <p>ドラゴン(竜・龍）は伝説上の生き物で、人間の想像力が生み出した存在です。</p>
          <p>西洋では悪や力の化身であり征服されるものとして、東洋では神や自然の象徴として畏怖される存在として、古来から人の歴史と共に歩んできました。</p>
          <p>今現在でも様々なファンタジー小説やゲームなどに登場し、花形として人気のあるキャラクターです。</p>
          <p>神や悪魔が人の心を象徴したものという現代の神話学的な考え方をするならば、ドラゴンも同様に人の心を表すものとなります。</p>
          <p>強欲や傲慢さ、権威などを表す一方で、人に試練を与えて乗り越えたものに祝福を与える側面もあり、人の心には色々な種類のドラゴンがいると言ってもよいかもしれません。</p>
          <p>21世紀から急速に発達したネット社会は、人々の多種多様な思想や欲望が渦巻く混沌とした様相を呈しています。</p>
          <p>そんなネット社会を代表するSNSを使う人々の心の中を、ドラゴンで例えたら面白いじゃないかと思って作りました。</p>
        </div>
      </div>
    </div>
    <div class="m-16 justify-center">
      <button class=" bg-red-500 hover:bg-red-700 font-bold p-8 text-2xl text-white rounded w-72 items-center">
        <router-link to="/">トップページに戻る</router-link>
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
