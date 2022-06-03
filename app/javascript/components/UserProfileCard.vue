<template>
<!-- component -->
<div class="w-full max-w-md mx-auto bg-white shadow-md rounded-md px-6 py-4 my-6">
        <div class="sm:flex sm:justify-between">
            <div class="flex items-center">
                <img class="h-12 w-12 rounded-full" src="user.image" alt="">
                <div class="ml-2">
                    <h3 class="text-lg text-gray-800 font-medium">{{ user.name }}</h3>
                    <span class="text-gray-600">{{ user.twitter_id }}</span>
                </div>
            </div>
        </div>
        <div class="flex justify-between items-center mt-4">
            <div>
                <h4 class="text-gray-600 text-sm">Rating</h4>
                <span class="mt-2 text-xl font-medium text-gray-800">127274</span>
            </div>
            <div>
                <h4 class="text-gray-600 text-sm">Submissions</h4>
                <span class="mt-2 text-xl font-medium text-gray-800">12171</span>
            </div>
            <div>
                <h4 class="text-gray-600 text-sm">Reviews</h4>
                <span class="mt-2 text-xl font-medium text-gray-800">35</span>
            </div>
        </div>
        <div class="mt-3">
            <h4 class="text-gray-600 text-sm">User Score</h4>
            <span class="mt-2 text-xl font-medium text-gray-800">21%</span>
        </div>
        <div class="mt-4">
            <h4 class="text-sm text-gray-600">45 Followers</h4>
            <div class="flex items-center overflow-hidden mt-2">
            </div>
        </div>
        <div class="mt-4">
            <h4 class="text-sm text-gray-600">250 Following</h4>
            <div class="flex items-center overflow-hidden mt-2">
            </div>
        </div>
        <a class="block mt-4 text-blue-400 hover:underline" href="#">3 Collections</a>
    </div>
</template>

<script>
export default {
  name: "UserProfileCard",
  props: {
    user: {
      type: Object,
      required: true
    },
  },
  computed: {
  }
}
</script>

<style scoped>
</style>
