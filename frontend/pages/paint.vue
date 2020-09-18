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
        <button id="pen-black-button" @click="penBlack">ペン（黒）</button>
        <button id="pen-red-button" @click="penRed">ペン（赤）</button>
        <button id="pen-blue-button" @click="penBlue">ペン（青）</button>
        <button id="eraser-button" @click="erase">消しゴム</button>
        <button id="clear-button" @click="clear">クリア</button>
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
    // ペンモード（赤）
    penRed() {
      // カーソル変更
      this.canvasMode = 'penRed'

      // 描画設定
      this.context.lineCap = 'round'
      this.context.lineJoin = 'round'
      this.context.lineWidth = 5
      this.context.strokeStyle = '#FF0000'
    },
    // ペンモード（青）
    penBlue() {
      // カーソル変更
      this.canvasMode = 'penBlue'

      // 描画設定
      this.context.lineCap = 'round'
      this.context.lineJoin = 'round'
      this.context.lineWidth = 5
      this.context.strokeStyle = '#0000FF'
    },
    // 消しゴムモード
    eraser() {
      // カーソル変更
      this.canvasMode = 'eraser'

      // 描画設定
      this.context.lineCap = 'square'
      this.context.lineJoin = 'square'
      this.context.lineWidth = 5
      this.context.strokeStyle = '#FFFFFF'
    },
  },
}
</script>

<style></style>
