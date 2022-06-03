<template>
  <div class="text-center">
    <div class="grid grid-cols-12 gap-10 md:pt-20">
      <div class="col-start-2 col-span-10 mt-20 md:mt-0">
        <div class="text-2xl inline p-2 text-white font-bold border-b-8 border-white md:text-4xl">{{ title }}</div>
      </div>
      <div class="text-center text-white col-start-2 col-span-10 px-10 pb-10 mx-auto">
        <UserProfileCard :user="currentUser"/>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
import { mapGetters } from 'vuex'
import UserProfileCard from '../components/UserProfileCard';

export default {
  name: "user",
  components: {
    UserProfileCard,
  },
  data() {
    return {
      title: "あなたの心に潜むドラゴンは…",
      user: {},
    };
  },
  computed: {
    ...mapGetters(
      'users', ['currentUser']
    ),
    // dragon_image_src() {
    //     return require("../../../public/images/" + this.dragon.attributes.image)
    // },
    currentPath() {
      return this.$route.path
    },
  },
  watch: {
    currentPath: function() {
      this.fetchUser()
    }
  },
  mounted() {
    this.fetchUser()
  },
  methods: {
    async fetchUser() {
     const res = await axios.get(`/api/v1/users/${this.$route.params.twitter_id}`)
     this.user = res.data
    },
  }
}
</script>

<style scoped>
</style>
