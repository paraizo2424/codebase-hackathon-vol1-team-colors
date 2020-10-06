<template>
  <div class="PaintArea">
    <div class="flex flex-wrap">
      <PaintSquare v-for="n in 144" :key="n" class="w-1/6" />
    </div>
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
  height: auto;
  display: flex;
}
</style>
