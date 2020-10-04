<template>
  <div class="PaintArea">
    <PaintSquare v-for="n in 6" :key="n" />
  </div>
</template>
<script>
import PaintSquare from '~/components/PaintSquare'

export default {
  components: {
    PaintSquare,
  },
}
</script>
<style scoped>
.PaintArea {
  width: 1fr;
  height: 440px;
  display: flex;
}
</style>
