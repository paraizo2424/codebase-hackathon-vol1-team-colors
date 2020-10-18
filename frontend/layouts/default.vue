<template>
  <div>
    <header>
      <div>
        <nav
          class="flex items-center justify-between flex-wrap bg-teal-500 p-6"
        >
          <div class="flex items-center flex-shrink-0 text-white mr-6">
            <img src="~assets/images/logo.png" width="100" alt="colors logo" />
          </div>
          <div class="block lg:hidden">
            <button
              class="flex items-center px-3 py-2 border rounded text-teal-200 border-teal-400 hover:text-white hover:border-white"
              @click="toggleNav"
            >
              <svg
                class="fill-current h-3 w-3"
                viewBox="0 0 20 20"
                xmlns="http://www.w3.org/2000/svg"
              >
                <title>Menu</title>
                <path d="M0 3h20v2H0V3zm0 6h20v2H0V9zm0 6h20v2H0v-2z" />
              </svg>
            </button>
          </div>
          <div
            v-show="isNavActive"
            class="w-full block flex-grow lg:flex lg:items-center lg:w-auto"
          >
            <div class="text-sm lg:flex-grow">
              <template v-if="this.$auth.loggedIn">
                <nuxt-link
                  to="/paint"
                  class="block mt-4 lg:inline-block lg:mt-0 text-teal-200 hover:text-white mr-4"
                  >色塗り</nuxt-link
                >
                <nuxt-link
                  to="/aggregate"
                  class="block mt-4 lg:inline-block lg:mt-0 text-teal-200 hover:text-white mr-4"
                  >集計</nuxt-link
                >
              </template>
              <template v-else>
                <nuxt-link
                  to="/"
                  class="block mt-4 lg:inline-block lg:mt-0 text-teal-200 hover:text-white mr-4"
                  >ホーム</nuxt-link
                >
              </template>
            </div>
            <div>
              <template v-if="this.$auth.loggedIn">
                <button
                  class="bg-red-500 hover:bg-red-700 text-white py-2 px-4 rounded"
                  type="is-danger"
                  @click="logout"
                >
                  ログアウト
                </button>
              </template>
              <template v-else>
                <nuxt-link
                  to="/login"
                  class="bg-blue-500 hover:bg-blue-700 text-white py-2 px-4 rounded"
                  >ログイン</nuxt-link
                >
                <nuxt-link
                  to="/signup"
                  class="bg-green-500 hover:bg-green-700 text-white py-2 px-4 rounded"
                  >新規登録</nuxt-link
                >
              </template>
            </div>
          </div>
        </nav>
      </div>
    </header>
    <Nuxt />
    <footer>
      <div class="flex items-center flex-wrap bg-teal-500 p-6 mt-12">
        <div class="flex flex-shrink-0 text-white mx-auto">
          <p>
            Copyright ©カラーズ（仮称）, All rights reserved.
          </p>
        </div>
      </div>
    </footer>
  </div>
</template>

<script>
export default {
  data: () => {
    return {
      isNavActive: true,
    }
  },
  mounted() {
    this.handleResize()
    window.addEventListener('resize', this.handleResize)
  },
  destroyed() {
    window.removeEventListener('resize', this.handleResize)
  },
  methods: {
    toggleNav() {
      this.isNavActive = !this.isNavActive
    },
    async logout() {
      await this.$auth.logout()
    },
    handleResize() {
      if (window.innerWidth >= 1024) {
        this.isNavActive = true
      } else {
        this.isNavActive = false
      }
    },
  },
}
</script>

<style>
html {
  font-family: 'Source Sans Pro', -apple-system, BlinkMacSystemFont, 'Segoe UI',
    Roboto, 'Helvetica Neue', Arial, sans-serif;
  font-size: 16px;
  word-spacing: 1px;
  -ms-text-size-adjust: 100%;
  -webkit-text-size-adjust: 100%;
  -moz-osx-font-smoothing: grayscale;
  -webkit-font-smoothing: antialiased;
  box-sizing: border-box;
}

*,
*::before,
*::after {
  box-sizing: border-box;
  margin: 0;
}
</style>
