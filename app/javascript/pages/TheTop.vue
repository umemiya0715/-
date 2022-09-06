<template>
  <div class="text-center">
    <div class="grid grid-cols-12 gap-10">
      <div class="col-span-10 col-start-2 pt-8">
        <img
          :src="top_logo_src"
          height="1600px"
          width="1000px"
          class="inline"
        >
      </div>
      <div class="col-span-10 col-start-2 px-10 py-16">
        <ValidationObserver v-slot="{ invalid }">
          <div class="justify-center pb-16">
            <ValidationProvider
              v-slot="{ errors }"
              rules="required"
            >
              <input
                v-model="targetAccount"
                type="text"
                class=" h-20 w-full rounded-lg border-4 border-indigo-500 bg-gray-100 p-2 text-4xl shadow-md focus:border-indigo-600 focus:outline-none"
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
              class="w-72 rounded bg-red-400 p-1 hover:bg-red-600"
              @click="startAnalysis(targetAccount)"
            >
              <p class="flex h-28 items-center justify-center rounded bg-red-500 text-4xl font-bold text-white hover:bg-red-700">
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
              class="w-72 rounded bg-red-400 p-1 hover:bg-red-600"
              @click="startAnalysis(targetAccount)"
            >
              <p class="flex h-28 items-center justify-center rounded bg-red-500 text-3xl font-bold text-white hover:bg-red-700">
                IDを入力して<br>診断する
              </p>
            </button>
            <button
              class="w-72 rounded bg-red-400 p-1 hover:bg-red-600"
              @click="analyzeMyself"
            >
              <p class="flex h-28 items-center justify-center rounded bg-red-500 text-3xl font-bold text-white hover:bg-red-700">
                自分のアカウント<br>で診断する
              </p>
            </button>
          </div>
          <div class="my-32 justify-center">
            <button class=" w-72 rounded bg-red-400 p-1 hover:bg-red-600">
              <div class="flex h-28 items-center justify-center rounded bg-red-500 hover:bg-red-700">
                <router-link
                  to="/help"
                  class=" text-4xl font-bold text-white"
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
      'users', ['currentUser']
    ),
    ...mapGetters(
      'levels', ['levels']
    ),
    top_logo_src() {
      return require("../../../public/images/topLogo.png")
    },
    currentUserId() {
      if (this.currentUser !== null)
      return this.currentUser.id
    }
  },
  watch: {
    currentUserId: function() {
      axios.get(`/api/v1/levels/${this.currentUser.id}`)
      .then(res => {
        this.$store.commit('levels/setLevel', res.data)
      })
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
