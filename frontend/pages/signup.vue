<template>
  <div class="container mx-auto">
    <h1 class="font-bold text-2xl text-center">アカウントを作成</h1>
    <div class="w-full max-w-lg mx-auto">
      <form
        class="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4"
        @submit.prevent="signup"
      >
        <div class="mb-4">
          <label class="block text-gray-700 text-sm font-bold mb-2" for="name">
            ユーザー名
          </label>
          <input
            id="name"
            v-model="name"
            name="name"
            class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
            type="text"
            placeholder="Name"
          />
        </div>
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
        <div class="mb-4">
          <label
            class="block text-gray-700 text-sm font-bold mb-2"
            for="password"
          >
            登録するパスワード
          </label>
          <input
            id="password"
            v-model="password"
            name="password"
            class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
            type="password"
            placeholder="Password"
          />
        </div>
        <div class="mb-4">
          <label
            class="block text-gray-700 text-sm font-bold mb-2"
            for="password_confirmation"
          >
            登録するパスワード(確認用)
          </label>
          <input
            id="password_confirmation"
            v-model="password_confirmation"
            name="password_confirmation"
            class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
            type="password"
            placeholder="password_confirmation"
          />
        </div>
        <div class="mb-6">
          <label
            class="block text-gray-700 text-sm font-bold mb-2"
            for="birthday"
          >
            生年月日
          </label>
          <input
            id="birthday"
            v-model="birthday"
            name="birthday"
            class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline"
            type="date"
            placeholder="Birthday"
          />
        </div>
        <div class="mb-6">
          <label class="block text-gray-700 text-sm font-bold mb-2" for="note">
            自己紹介
          </label>
          <textarea
            id="note"
            v-model="note"
            name="note"
            cols="30"
            rows="10"
            class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline"
            placeholder="例) よろしくお願いします。"
          ></textarea>
        </div>
        <div class="text-center">
          <button
            class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"
            type="submit"
          >
            新規登録
          </button>
        </div>
      </form>
    </div>
  </div>
</template>

<script>
export default {
  auth: false,
  data() {
    return {
      name: '',
      email: '',
      password: '',
      password_confirmation: '',
      birthday: '',
      note: '',
    }
  },
  methods: {
    async signup() {
      await this.$axios
        .post('/auth', {
          name: this.name,
          email: this.email,
          birthday: this.birthday,
          password: this.password,
          password_confirmation: this.password_confirmation,
          note: this.note,
        })
        .then(() => {
          this.$router.push('/login')
        })
    },
  },
}
</script>

<style></style>
