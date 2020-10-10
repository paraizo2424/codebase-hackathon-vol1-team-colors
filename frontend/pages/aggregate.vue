<template>
  <div class="container mx-auto">
    <div class="flex mb-4">
      <div class="w-1/2">
        <div class="table w-full">
          <div class="table-row-group">
            <div class="table-row">
              <div class="table-cell text-gray-700 px-4 py-2 text-sm"></div>
              <div
                class="table-cell bg-gray-200 text-gray-700 px-4 py-2 text-lg"
              >
                項目
              </div>
              <div
                class="table-cell bg-gray-400 text-gray-700 px-4 py-2 text-lg"
              >
                学習時間
              </div>
              <div
                class="table-cell bg-gray-400 text-gray-700 px-4 py-2 text-lg"
              ></div>
            </div>

            <div v-for="subject in subjects" :key="subject" class="table-row">
              <div
                class="table-cell bg-gray-400 text-gray-700 px-4 py-2 text-lg"
              >
                <i class="colored" :class="subject.class"></i>
              </div>
              <div
                class="table-cell bg-gray-200 text-gray-700 px-4 py-2 text-lg"
              >
                {{ subject.item }}
              </div>
              <div
                class="table-cell bg-gray-400 text-gray-700 px-4 py-2 text-lg"
              >
                {{ subject.hour }} 時間
              </div>
              <div
                class="table-cell bg-gray-400 text-gray-700 px-4 py-2 text-lg"
              >
                {{ subject.minutes }} 分
              </div>
            </div>
          </div>
        </div>
        <div class="mt-4 flex">
          <svg
            xmlns="http://www.w3.org/2000/svg"
            fill="none"
            viewBox="0 0 24 24"
            stroke="currentColor"
            class="h-4 w-4"
          >
            <path
              stroke-linecap="round"
              stroke-linejoin="round"
              stroke-width="2"
              d="M12 9v3m0 0v3m0-3h3m-3 0H9m12 0a9 9 0 11-18 0 9 9 0 0118 0z"
            />
          </svg>
          <span>勉強項目を追加する</span>
        </div>
      </div>
      <div class="w-1/2">
        <div class="text-center mb-5 relative">
          <img
            src="/images/default.jpeg"
            class="rounded-full mx-auto w-32"
            alt="ユーザ画像"
          />
        </div>
        <div class="text-center">
          <nuxt-link
            to="/edit"
            class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded-full"
          >
            プロフィールを編集
          </nuxt-link>
          <h3>ユーザ名</h3>
          <p>ああああ</p>
          <h3>メールアドレス</h3>
          <p>aa@sample.com</p>
          <h3>自己紹介</h3>
          <p>初めまして。ああああ勉強ああああ好きああ</p>
        </div>
      </div>
    </div>
    <div class="w48 text-center">
      <BarChart />
      <p>素晴らしいグラフ</p>
      <p>{{ info }}</p>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
import BarChart from '@/components/BarChart'

export default {
  components: {
    BarChart,
  },
  data() {
    return {
      info: null,
      subjects: [
        {
          class: 'devicon-css3-plain-wordmark',
          item: 'css3',
          hour: 0,
          minutes: 0,
        },
        {
          class: 'devicon-javascript-plain',
          item: 'javascript',
          hour: 0,
          minutes: 0,
        },
        {
          class: 'devicon-ruby-plain-wordmark',
          item: 'ruby',
          hour: 0,
          minutes: 0,
        },
        {
          class: 'devicon-apache-plain-wordmark',
          item: 'sinatra',
          hour: 0,
          minutes: 0,
        },
        {
          class: 'devicon-rails-plain-wordmark',
          item: 'rails',
          hour: 0,
          minutes: 0,
        },
        {
          class: 'devicon-ie10-original',
          item: 'webapp',
          hour: 0,
          minutes: 0,
        },
      ],
    }
  },
  mounted() {
    axios
      .get('http://localhost:8000/subjects', {
        headers: {
          'access-token': 'CKMlldF4imjY3gHICEf7hQ',
          client: 'igIew3qZsF4UCeIzR_1H4Q',
          uid: 'sample@sample.com',
        },
      })
      .then((response) => (this.info = response))
  },
  chartdata: {
    labels: ['January', 'February', 'March', 'April'],
    datasets: [
      {
        label: ['Data One'],
        backgroundColor: '#f87979',
        data: [40, 30, 10, 25],
      },
    ],
  },
}
</script>
<style></style>
