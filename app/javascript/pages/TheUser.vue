<template>
  <div class="text-center">
    <div class="grid grid-cols-12 gap-10 pt-10 pb-32">
      <div class="col-span-10 col-start-2 my-10">
        <div class="inline border-b-8 border-white p-2 text-3xl font-bold text-white md:text-4xl">
          マイページ
        </div>
      </div>
      <div class="col-span-10 col-start-2 items-center">
        <UserProfileCard
          :user="currentUser"
          :level="levels"
          @update-Settings="updateUserSettings"
          @logout="deleteUser"
          @update-level="updateSettingLevel"
        />
        <div
          v-show="results"
          class="mt-24 mb-16"
        >
          <UserRadar
            :style="chartStyles"
            :results="results"
          />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
import { mapGetters } from 'vuex'
import UserProfileCard from '../components/UserProfileCard';
import UserRadar from '../components/UserRadar.vue';

export default {
  components: {
    UserProfileCard,
    UserRadar,
  },
  data() {
    return {
      results: {
        // type: Object,
        // required: true,
      }
    }
  },
  computed: {
    ...mapGetters(
      'users', ['currentUser']
    ),
    ...mapGetters(
      'levels', ['levels']
    ),
    currentPath() {
      return this.$route.path
    },
    chartStyles() {
      return {
        'margin-left': 'auto',
        'margin-right': 'auto',
        height: '510px',
      }
    }
  },
  watch: {
    currentPath: function() {
      this.fetchResults()
    }
  },
  mounted() {
    this.fetchResults()
  },
  methods: {
    async fetchResults() {
     await axios.get(`/api/v1/results/${this.$route.params.id}/last_result`)
       .then(res => {
        this.results = res.data
       })
       .catch(err => {
        console.log(err.response)
       })
    },
    async updateUserSettings() {
      await axios.patch("/api/v1/user_settings")
      .then(res => {
        this.$store.commit("users/setCurrentUser", res.data)
        this.$store.dispatch('flash/fetchFlash', {
          type: 'info',
          message: 'ユーザー情報を更新しました。'
        })
      })
    },
   async deleteUser() {
      await axios.delete("/api/v1/user_settings")
      .then(
        this.$router.push('/'),
        this.$store.commit("users/setCurrentUser", null),
        this.$store.dispatch("flash/fetchFlash", {
          type: 'alert',
          message: '退会しました。'
      }))
      .catch((err) => {
        console.log(err.response)
      })
    },
    updateSettingLevel(selectLevel) {
      axios.patch(`/api/v1/levels/${selectLevel.id}`, {
        setting_level: selectLevel.level
      })
      .then(res => {
        this.$store.commit("levels/setLevel", res.data)
      })
    }
  }
}
</script>

<style scoped>
</style>
