<template>
  <div class="container mx-auto">
    <h1 class="font-bold text-2xl text-center">アカウントを作成</h1>
    <div class="w-full max-w-lg mx-auto">
      <form class="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4">
        <div class="mb-4">
          <label class="block text-gray-700 text-sm font-bold mb-2" for="name">
            ユーザー名
          </label>
          <input
            id="name"
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
            name="email"
            class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
            type="text"
            placeholder="Email"
          />
        </div>
        <div class="mb-6">
          <label class="block text-gray-700 text-sm font-bold mb-2" for="birth">
            生年月日
          </label>
          <input
            id="birth"
            name="birth"
            class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline"
            type="date"
            placeholder="Birth"
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
            id="password
            "
            name="password"
            class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
            type="password
            "
            placeholder="Password"
          />
        </div>
        <div class="mb-4">
          <label
            class="block text-gray-700 text-sm font-bold mb-2"
            for="password_confirm"
          >
            登録するパスワード(確認用)
          </label>
          <input
            id="password_confirm
            "
            name="password_confirm"
            class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
            type="password
             "
            placeholder="Password_confirm"
          />
        </div>
        <div class="text-center">
          <button
            class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"
            type="button"
          >
            新規登録
          </button>
        </div>
      </form>
    </div>
  </div>
</template>

<script>
export default {}
</script>

<style></style>
