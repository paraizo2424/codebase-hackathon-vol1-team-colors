<template>
  <div class="container mx-auto">
    <div class="w-full max-w-lg mx-auto">
      <form
        class="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4"
        @submit.prevent="login"
      >
        <div class="mb-4">
          <label class="block text-gray-700 text-sm font-bold mb-2" for="email">
            メールアドレス
          </label>
          <input
            id="email"
            v-model="email"
            name="email"
            class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
            type="text"
            placeholder="Email"
          />
        </div>
        <div class="mb-6">
          <label
            class="block text-gray-700 text-sm font-bold mb-2"
            for="password"
          >
            パスワード
          </label>
          <input
            id="password"
            v-model="password"
            name="password"
            class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline"
            type="password"
            placeholder="password"
          />
        </div>
        <div class="flex items-center justify-between">
          <button
            class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"
            type="submit"
          >
            サインイン
          </button>
          <nuxt-link
            to="/reset-password"
            class="inline-block align-baseline font-bold text-sm text-blue-500 hover:text-blue-800"
          >
            パスワードをお忘れですか?
          </nuxt-link>
        </div>
      </form>
    </div>

    <div class="text-center">
      <nuxt-link
        to="/signup"
        class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded-full"
      >
        アカウント作成
      </nuxt-link>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      email: '',
      password: '',
    }
  },
  methods: {
    async login() {
      await this.$auth
        .loginWith('local', {
          data: {
            email: this.email,
            password: this.password,
          },
        })
        .then((res) => {
          this.$auth.setUser(res.data.data)
          alert('ログインしました')
        })
        .catch(() => {
          alert('メールアドレスかパスワードが間違えています')
        })
    },
  },
}
</script>

<style></style>
