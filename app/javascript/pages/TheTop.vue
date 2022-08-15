<template>
  <div class="text-center">
    <div class="grid grid-cols-12 gap-10">
      <div class="col-start-2 col-span-10 pt-8">
        <img
          :src="top_logo_src"
          height="1600px"
          width="1000px"
          class="inline"
        >
      </div>
      <div class="col-start-2 col-span-10 px-10 py-16">
        <ValidationObserver v-slot="{ invalid }">
          <div class="justify-center pb-16">
            <ValidationProvider
              v-slot="{ errors }"
              rules="required"
            >
              <input
                v-model="targetAccount"
                type="text"
                class=" h-20 bg-gray-100 text-4xl p-2 rounded-lg border-4 border-indigo-500 shadow-md focus:outline-none focus:border-indigo-600 w-full"
                placeholder="idを入力"
              >
              <span class="block p-4 text-3xl text-white">
                {{ errors[0] }}
              </span>
            </ValidationProvider>
          </div>
          <transition name="spinner">
            <SpinnerModal
              :is-visible-spinner-modal="isVisibleSpinnerModal"
            />
          </transition>
          <div
            v-show="currentUser === null"
            class="my-32 justify-center"
          >
            <button
              :disabled="invalid"
              class="bg-red-400 hover:bg-red-600 rounded p-1 w-72"
              @click="startAnalysis(targetAccount)"
            >
              <p class="bg-red-500 hover:bg-red-700 text-white font-bold text-4xl rounded h-28 justify-center items-center flex">
                診断する
              </p>
            </button>
          </div>
          <div
            v-show="currentUser !== null"
            class="my-32 flex justify-between"
          >
            <button
              :disabled="invalid"
              class="bg-red-400 hover:bg-red-600 rounded p-1 w-72"
              @click="startAnalysis(targetAccount)"
            >
              <p class="bg-red-500 hover:bg-red-700 text-white font-bold text-3xl rounded h-28 justify-center items-center flex">
                IDを入力して<br>診断する
              </p>
            </button>
            <button
              class="bg-red-400 hover:bg-red-600 rounded p-1 w-72"
              @click="analyzeMyself"
            >
              <p class="bg-red-500 hover:bg-red-700 text-white font-bold text-3xl rounded h-28 justify-center items-center flex">
                自分のアカウント<br>で診断する
              </p>
            </button>
          </div>
          <div class="my-32 justify-center">
            <button class=" bg-red-400 hover:bg-red-600 rounded p-1 w-72">
              <div class="bg-red-500 hover:bg-red-700 rounded h-28 justify-center items-center flex">
                <router-link
                  to="/help"
                  class=" text-white font-bold text-4xl"
                >
                  使い方
                </router-link>
              </div>
            </button>
          </div>
        </ValidationObserver>
        <TwitterLink />
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
import { mapGetters } from 'vuex'
import SpinnerModal from '../components/SpinnerModal.vue';
import TwitterLink from '../components/TwitterLink.vue';

export default {
  components: {
    SpinnerModal,
    TwitterLink,
  },
  data() {
    return {
      targetAccount: "",
      user_id: "",
      isVisibleSpinnerModal: false,
    }
  },
  computed: {
     ...mapGetters(
      'results',['results']
    ),
    ...mapGetters(
      'dragons', ['dragons']
    ),
    ...mapGetters(
      'users', ['currentUser' , 'isAuthenticatedUser']
    ),
    top_logo_src() {
      return require("../../../public/images/topLogo.png")
    }
  },
  mounted() {
    axios.get("/api/v1/users/me")
    .then(res => {
      this.$store.commit('users/setCurrentUser', res.data)
    })
  },
  methods: {
    async startAnalysis() {
      const target_account = this.targetAccount
      const user_id = (this.currentUser !== null) ? this.currentUser.id : 0
      this.isVisibleSpinnerModal = true
      await axios.post('/api/v1/results', {
        target_account: target_account,
        user_id: user_id
      })
        .then(res => {
          this.$store.commit("results/setResult", res.data),
          this.isVisibleSpinnerModal = false,
          this.$router.push('/result')
        })
        .catch(error => {
          console.log(error.response)
          this.isVisibleSpinnerModal = false
          this.$store.dispatch('flash/fetchFlash', {
            type: 'alert',
            message: error.response.data.error.title
          })
        })
    },
    async analyzeMyself() {
      const target_account = this.currentUser.screen_name
      const user_id = (this.currentUser !== null) ? this.currentUser.id : 0
      this.isVisibleSpinnerModal = true
      await axios.post('/api/v1/results', {
        target_account: target_account,
        user_id: user_id
      })
        .then(res => {
          this.$store.commit("results/setResult", res.data),
          this.isVisibleSpinnerModal = false,
          this.$router.push('/result')
        })
        .catch(error => {
          console.log(error.response)
          this.isVisibleSpinnerModal = false
          this.$store.dispatch('flash/fetchFlash', {
            type: 'alert',
            message: error.response.data.error.title
          })
        })
    },
    openSpinnerModal() {
      this.isVisibleSpinnerModal = true;
    },
  },
}
</script>

<style scoped>
.spinner-enter-active,
.spinner-fade-leave-active {
    transition: opacity .3s ease;
}
.spinner-fade-enter,
.spinner-fade-leave-to {
    opacity: 0;
}
</style>
