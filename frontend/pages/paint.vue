<template>
  <div class="container mx-auto">
    <div class="flex mb-4">
      <div class="w-3/5">
        <div class="border-solid border-4">
          <div class="flex flex-wrap h-auto">
            <div
              v-for="square in squares"
              :key="square.id"
              class="w-1/6 border-solid border-4 h-24"
              :style="{ backgroundColor: square.color }"
              @click="paint(square)"
            ></div>
          </div>
        </div>
        <div class="text-center">
          <p>&lt;&lt; 1 2 3 4 5</p>
        </div>
      </div>
      <div class="w-2/5">
        <div class="text-center mb-5 relative">
          <img
            src="/images/default.jpeg"
            class="rounded-full mx-auto w-32"
            alt="ユーザ画像"
          />
        </div>
        <h3>タイマーモード</h3>
        <div class="flex">
          <div class="flex-1 text-center border-solid border-4" color="red">
            <div @click="startOrStop">
              {{ timerOnOff ? 'on' : 'off' }}
              <svg
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                stroke="currentColor"
                :color="timerColor"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"
                />
              </svg>
            </div>
          </div>
          <div class="flex-1 border-solid border-4 text-center">
            <h3 class="text-center">経過時間</h3>
            <p>{{ formatTime }}</p>
          </div>
        </div>
        <h3>描画モード</h3>
        <div class="flex">
          <div class="flex-1 text-center border-solid border-4">
            <input
              id="paint-mode"
              v-model="paintMode"
              type="radio"
              name="selected-mode"
              value="paint"
            />
            <label for="paint-mode">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                stroke="currentColor"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"
                />
              </svg>
            </label>
          </div>
          <div class="flex-1 text-center border-solid border-4">
            <input
              id="eraser-mode"
              v-model="paintMode"
              type="radio"
              name="selected-mode"
              value="eraser"
            />
            <label for="eraser-mode">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                stroke="currentColor"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"
                />
              </svg>
            </label>
          </div>
        </div>
        <div class="border-solid border-4">
          <h2>日付：2020年9月23日</h2>
        </div>
        <div class="flex">
          <div class="flex-1 text-center border-solid border-4">
            <div>
              <input
                id="html5"
                v-model="checkedSubject"
                type="radio"
                name="checked-subject"
                value="red"
              />
              <label for="html5"
                ><i class="devicon-html5-plain-wordmark colored"></i
                >HTML5</label
              >
            </div>
            <div class="flex-1 text-center border-solid border-4">
              <input
                id="css3"
                v-model="checkedSubject"
                type="radio"
                name="checked-subject"
                value="blue"
              />
              <label for="css3"
                ><i class="devicon-css3-plain-wordmark colored"></i>CSS3</label
              >
            </div>
            <div class="flex-1 text-center border-solid border-4">
              <input
                id="js"
                v-model="checkedSubject"
                type="radio"
                name="checked-subject"
                value="yellow"
              />
              <label for="js"
                ><i class="devicon-javascript-plain colored"></i
                >JavaScript</label
              >
            </div>
            <div class="flex-1 text-center border-solid border-4">
              <input
                id="ruby"
                v-model="checkedSubject"
                type="radio"
                name="checked-subject"
                value="deeppink"
              />
              <label for="ruby"
                ><i class="devicon-ruby-plain-wordmark colored"></i>Ruby</label
              >
            </div>
            <div class="flex-1 text-center border-solid border-4">
              <input
                id="sinatra"
                v-model="checkedSubject"
                type="radio"
                name="checked-subject"
                value="gray"
              />
              <label for="sinatra"
                ><i class="devicon-apache-plain-wordmark colored"></i
                >Sinatra</label
              >
            </div>
            <div class="flex-1 text-center border-solid border-4">
              <input
                id="rails"
                v-model="checkedSubject"
                type="radio"
                name="checked-subject"
                value="crimson"
              />
              <label for="rails"
                ><i class="devicon-rails-plain-wordmark colored"></i>Ruby on
                Rails</label
              >
            </div>
            <div class="flex-1 text-center border-solid border-4">
              <input
                id="webapp"
                v-model="checkedSubject"
                type="radio"
                name="checked-subject"
                value="lime"
              />
              <label for="webapp"
                ><i class="devicon-ie10-original colored"></i>サイト制作</label
              >
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  data() {
    return {
      info: null,
      min: 0,
      sec: 0,
      timerObj: null,
      timerOnOff: false,
      timerColor: 'black',
      paintMode: 'paint',
      checkedSubject: '',
      squares: null,
    }
  },
  computed: {
    formatTime() {
      const timeStrings = [this.min.toString(), this.sec.toString()].map(
        function (str) {
          if (str.length < 2) {
            return '0' + str
          } else {
            return str
          }
        }
      )
      return timeStrings[0] + '分' + timeStrings[1] + '秒'
    },
  },
  mounted() {
    axios
      .get('http://localhost:8000/studied_records', {
        headers: {
          'access-token': '-3ahp_lHsgihLX3-WE4X4w',
          client: 'GnI9bCqDLYG5VJUV-ULYWQ',
          uid: 'sample@sample.com',
        },
      })
      .then((response) => (this.squares = response.data))
  },
  methods: {
    count() {
      if (this.sec >= 59) {
        this.min++
        this.sec = 0
      } else {
        this.sec++
      }
    },

    start() {
      const self = this
      this.timerObj = setInterval(function () {
        self.count()
      }, 1000)
      this.timerOn = true
    },

    stop() {
      clearInterval(this.timerObj)
      this.timerOn = false
    },

    startOrStop() {
      this.timerOnOff = !this.timerOnOff
      if (this.timerOnOff) {
        this.start()
        this.timerColor = 'red'
      } else {
        this.stop()
        this.timerColor = 'black'
      }
    },

    paint(record) {
      if (this.paintMode === 'paint') {
        if (record.color === '') {
          if (record.id - 1 < 0) {
            record.color = this.checkedSubject
          } else if (this.records[record.id - 1].color !== '') {
            record.color = this.checkedSubject
          }
        }
      } else if (this.paintMode === 'eraser') {
        if (this.records.length === record.id + 1) {
          record.color = ''
        } else if (this.records[record.id + 1].color === '') {
          record.color = ''
        }
      }
    },
  },
}
</script>
<style></style>
