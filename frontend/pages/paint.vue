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
              :style="{ backgroundColor: square.color[0] }"
              @click="paint(square)"
            >
              <!-- デバッグ用に表示 -->
              {{ square.subject }}{{ square.date }}
            </div>
          </div>
        </div>
        <div class="text-center">
          <sliding-pagination
            :current="currentPage"
            :total="totalPages"
            @page-change="pageChangeHandler"
          />
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
            <label for="paint-mode" @click="paintClick()">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                stroke="currentColor"
                :class="{ 'text-red-700': isPaintActive }"
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
            <label for="eraser-mode" @click="trashClick()">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                stroke="currentColor"
                :class="{ 'text-red-700': isTrashActive }"
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
          <h2>日付: {{ today.getMonth() + 1 }}月 {{ today.getDate() }}日</h2>
        </div>
        <div class="flex">
          <div class="flex-1 text-center border-solid border-4 text-xl">
            <div v-for="subject in subjects" :key="subject.id" class="my-2">
              <input
                :id="subject.name"
                v-model="checkedSubject"
                type="radio"
                name="checked-subject"
                :value="subject"
                class="subject"
              />

              <label :for="subject.name">
                <img
                  :src="subject.logo"
                  width="20"
                  :alt="subject.name"
                  style="display: inline-block;"
                />
                {{ subject.name }}
              </label>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
const timerType = 1
const paintType = 2

const maxPageSquareCount = 144 // 1ページに描画するマスの個数

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
      pages: null,
      squares: null,
      subjects: null,
      today: new Date(),
      currentPage: 1,
      totalPages: 1,
      isPaintActive: false,
      isTrashActive: false,
      isSubjectActive: {},
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
  watch: {
    currentPage() {
      this.squares = this.pages[this.currentPage - 1]
    },
  },
  mounted() {
    this.$axios
      .get('/studied_records')
      .then((response) => {
        window.console.log(response)
        this.pages = response.data.pages
        this.totalPages = this.pages.length
        this.currentPage = this.totalPages
        this.squares = this.pages[this.totalPages - 1]
        this.subjects = response.data.subjects
      })
      .catch((error) => {
        window.console.log(error)
      })
      .finally(() => (this.loading = false))
  },
  methods: {
    pageChangeHandler(selectedPage) {
      this.currentPage = selectedPage
    },
    count() {
      if (this.sec >= 59) {
        this.min++
        this.sec = 0
      } else {
        this.sec++
      }

      if (this.min % 10 === 0 && this.sec === 0) {
        const reqData = {
          date:
            this.today.getFullYear() +
            '-' +
            (this.today.getMonth() + 1) +
            '-' +
            this.today.getDate(),
          studied_type: timerType,
          name: [this.checkedSubject.name],
        }

        let endSquareId = 0 // 末尾マス
        for (let i = 0; i < maxPageSquareCount; i++) {
          if (this.squares[i].color.length === 0) {
            endSquareId = i
            break
          }
        }

        this.squares[endSquareId].subject = reqData.name
        this.squares[endSquareId].color = [this.checkedSubject.color]
        this.squares[endSquareId].studied_type = reqData.type
        this.squares[endSquareId].date = reqData.date

        this.$axios
          .post('/studied_records', reqData)
          .then(function (response) {
            window.console.log(response)
          })
          .catch(function (error) {
            window.console.log(error)
          })
      }
    },

    start() {
      const self = this
      this.timerObj = setInterval(function () {
        self.count()
      }, 1000) // 1秒=1000
      this.timerOn = true
    },

    stop() {
      clearInterval(this.timerObj)
      this.timerOn = false
    },

    startOrStop() {
      this.isPaintActive = false
      this.isTrashActive = false
      if (this.checkedSubject !== '') {
        this.timerOnOff = !this.timerOnOff
        if (this.timerOnOff) {
          this.start()
          this.timerColor = 'red'
        } else {
          this.stop()
          this.timerColor = 'black'
        }
      }
    },
    paintClick() {
      this.timerOnOff = false
      this.stop()
      this.timerColor = 'black'
      this.isPaintActive = true
      this.isTrashActive = false
    },
    trashClick() {
      this.timerOnOff = false
      this.stop()
      this.timerColor = 'black'
      this.isPaintActive = false
      this.isTrashActive = true
    },
    paint(square) {
      if (this.paintMode === 'paint') {
        if (square.color.length === 0 && this.checkedSubject !== '') {
          const reqData = {
            date:
              this.today.getFullYear() +
              '-' +
              (this.today.getMonth() + 1) +
              '-' +
              this.today.getDate(),
            studied_type: paintType,
            name: [this.checkedSubject.name],
          }
          if (square.id - 1 < 0) {
            square.subject = [this.checkedSubject.name]
            square.color = [this.checkedSubject.color]
            square.studied_type = paintType
            square.date =
              this.today.getFullYear() +
              '-' +
              (this.today.getMonth() + 1) +
              '-' +
              this.today.getDate()

            this.$axios
              .post('/studied_records', reqData)
              .then(function (response) {
                window.console.log(response)
              })
              .catch(function (error) {
                window.console.log(error)
              })
          } else if (this.squares[square.id - 1].color.length > 0) {
            square.subject = [this.checkedSubject.name]
            square.color = [this.checkedSubject.color]
            square.studied_type = paintType
            square.date =
              this.today.getFullYear() +
              '-' +
              (this.today.getMonth() + 1) +
              '-' +
              this.today.getDate()

            this.$axios
              .post('/studied_records', reqData)
              .then(function (response) {
                window.console.log(response)
              })
              .catch(function (error) {
                window.console.log(error)
              })
          }
        }
      } else if (this.paintMode === 'eraser') {
        if (square.color.length !== 0) {
          const reqData = {
            data: {
              date: square.date,
              name: square.subject,
            },
          }
          if (square.id === maxPageSquareCount - 1) {
            square.subject = []
            square.color = []
            square.studied_type = ''
            square.date = ''
            square.note = ''

            this.$axios
              .delete('/studied_records', reqData)
              .then(function (response) {
                window.console.log(response)
              })
              .catch(function (error) {
                window.console.log(error)
              })
          } else if (this.squares[square.id + 1].color.length === 0) {
            square.subject = []
            square.color = []
            square.studied_type = ''
            square.date = ''
            square.note = ''

            this.$axios
              .delete('/studied_records', reqData)
              .then(function (response) {
                window.console.log(response)
              })
              .catch(function (error) {
                window.console.log(error)
              })
          }
        }
      }
    },
  },
}
</script>
<style>
input[type='radio'] {
  display: none;
}
.subject:checked + label {
  @apply border-dashed;
  @apply border-4;
  @apply border-red-700;
  @apply px-5 py-2;
}
</style>
