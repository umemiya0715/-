<template>
  <header>
    <div class='w-full text-gray-700 bg-gray-200 p-4'>
      <div class='flex flex-col max-w-screen-xl px-4 mx-auto md:items-center md:justify-between md:flex-row md:px-6 lg:px-8'>
        <div class='flex flex-row items-center justify-between p-1'>
          <h1>HR</h1>
          <button @click='isOpen = !isOpen' class='md:hidden rounded-lg focus:outline-none focus:shadow-outline'>
            <svg class='h-6 w-6 fill-current' viewBox='0 0 24 24'>
              <path v-show='!isOpen' d='M24 6h-24v-4h24v4zm0 4h-24v4h24v-4zm0 8h-24v4h24v-4z' />
              <path v-show='isOpen' d='M24 20.188l-8.315-8.209 8.2-8.282-3.697-3.697-8.212 8.318-8.31-8.203-3.666 3.666 8.321 8.24-8.206 8.313 3.666 3.666 8.237-8.318 8.285 8.203z' />
            </svg>
          </button>
        </div>
        <nav :class="isOpen ? 'block' : 'hidden'" class='flex-col flex-grow md:pb-0 md:flex md:justify-end md:flex-row'>
          <router-link
            to='/register'
            class='block px-8 py-2 my-4 hover:bg-gray-600 rounded'
          >
            ユーザー登録
          </router-link>
          <router-link
            to='/login'
            class='block px-8 py-2 my-4 hover:bg-gray-600 rounded'
          >
            ログイン
          </router-link>
        </nav>
      </div>
    </div> 
  </header>
</template>

<script>
export default {
  name: 'TheHeader',
  data() {
    return {
      isOpen: false,
    }
  },
}
</script>

<style scoped>
</style>
