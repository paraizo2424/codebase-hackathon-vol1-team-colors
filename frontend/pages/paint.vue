<template>
  <div class="container mx-auto">
    <div class="flex mb-4">
      <div class="w-3/5">
        <canvas
          id="myCanvas"
          :class="{ eraser: canvasMode === 'eraser' }"
          width="640px"
          height="800px"
          @mousedown="dragStart"
          @mouseup="dragEnd"
          @mouseout="dragEnd"
          @mousemove="draw"
        ></canvas>
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
          <div class="flex-1 text-center border-solid border-4">
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
                d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"
              />
            </svg>
          </div>
          <div class="flex-1 border-solid border-4">
            <h3 class="text-center">経過時間</h3>
            {{ Time }}
          </div>
        </div>
        <h3>描画モード</h3>
        <div class="flex">
          <div class="flex-1 text-center border-solid border-4">
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
          </div>
          <div class="flex-1 text-center border-solid border-4">
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
                type="radio"
                name="checked-subject"
                value="html5"
              />
              <label for="html5"
                ><i class="devicon-html5-plain-wordmark colored"></i
                >HTML5</label
              >
            </div>
            <div class="flex-1 text-center border-solid border-4">
              <input
                id="css3"
                type="radio"
                name="checked-subject"
                value="css3"
              />
              <label for="css3"
                ><i class="devicon-css3-plain-wordmark colored"></i>CSS3</label
              >
            </div>
            <div class="flex-1 text-center border-solid border-4">
              <input id="js" type="radio" name="checked-subject" value="js" />
              <label for="js"
                ><i class="devicon-javascript-plain colored"></i
                >JavaScript</label
              >
            </div>
            <div class="flex-1 text-center border-solid border-4">
              <input
                id="ruby"
                type="radio"
                name="checked-subject"
                value="ruby"
              />
              <label for="ruby"
                ><i class="devicon-ruby-plain-wordmark colored"></i>Ruby</label
              >
            </div>
            <div class="flex-1 text-center border-solid border-4">
              <input
                id="sinatra"
                type="radio"
                name="checked-subject"
                value="sinatra"
              />
              <label for="sinatra"
                ><i class="devicon-apache-plain-wordmark colored"></i
                >Sinatra</label
              >
            </div>
            <div class="flex-1 text-center border-solid border-4">
              <input
                id="rails"
                type="radio"
                name="checked-subject"
                value="rails"
              />
              <label for="rails"
                ><i class="devicon-rails-plain-wordmark colored"></i>Ruby on
                Rails</label
              >
            </div>
            <div class="flex-1 text-center border-solid border-4">
              <input
                id="webapp"
                type="radio"
                name="checked-subject"
                value="webapp"
              />
              <label for="webapp"
                ><i class="devicon-ie10-original colored"></i>サイト制作</label
              >
            </div>
          </div>
        </div>
        <!-- <button id="pen-black-button" @click="penBlack">ペン（黒）</button>
        <button id="pen-red-button" @click="penRed">ペン（赤）</button>
        <button id="pen-blue-button" @click="penBlue">ペン（青）</button>
        <button id="eraser-button" @click="erase">消しゴム</button>
        <button id="clear-button" @click="clear">クリア</button> -->
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      canvasMode: 'pen',
      canvas: null,
      context: null,
      isDrag: false,
    }
  },
  mounted() {
    this.canvas = document.querySelector('#myCanvas')
    this.context = this.canvas.getContext('2d')
    this.context.lineCap = 'round'
    this.context.lineJoin = 'round'
    this.context.lineWidth = 5
    this.context.strokeStyle = '#000000'
  },
  methods: {
    // 描画
    draw(e) {
      const x = e.layerX
      const y = e.layerY

      if (!this.isDrag) {
        return
      }

      this.context.lineTo(x, y)
      this.context.stroke()
    },
    // 描画開始（mousedown）
    dragStart(e) {
      const x = e.layerX
      const y = e.layerY

      this.context.beginPath()
      this.context.lineTo(x, y)
      this.context.stroke()

      this.isDrag = true
    },
    // 描画終了（mouseup, mouseout）
    dragEnd() {
      this.context.closePath()
      this.isDrag = false
    },
    // クリア
    clear() {
      this.context.clearRect(0, 0, this.canvas.width, this.canvas.height)
    },
    // ペンモード（黒）
    penBlack() {
      // カーソル変更
      this.canvasMode = 'penBlack'

      // 描画設定
      this.context.lineCap = 'round'
      this.context.lineJoin = 'round'
      this.context.lineWidth = 5
      this.context.strokeStyle = '#000000'
    },
    // // ペンモード（赤）
    // penRed() {
    //   // カーソル変更
    //   this.canvasMode = 'penRed'

    //   // 描画設定
    //   this.context.lineCap = 'round'
    //   this.context.lineJoin = 'round'
    //   this.context.lineWidth = 5
    //   this.context.strokeStyle = '#FF0000'
    // },
    // // ペンモード（青）
    // penBlue() {
    //   // カーソル変更
    //   this.canvasMode = 'penBlue'

    //   // 描画設定
    //   this.context.lineCap = 'round'
    //   this.context.lineJoin = 'round'
    //   this.context.lineWidth = 5
    //   this.context.strokeStyle = '#0000FF'
    // },
    // // 消しゴムモード
    // eraser() {
    //   // カーソル変更
    //   this.canvasMode = 'eraser'

    //   // 描画設定
    //   this.context.lineCap = 'square'
    //   this.context.lineJoin = 'square'
    //   this.context.lineWidth = 5
    //   this.context.strokeStyle = '#FFFFFF'
    // },
  },
}
</script>

<style></style>
