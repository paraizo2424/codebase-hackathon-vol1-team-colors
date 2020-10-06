<template>
  <div
    class="painted"
    :style="{ backgroundColor: subjectColor }"
    @click="paint"
  >
    {{ count }}
  </div>
</template>
<script>
export default {
  data() {
    return {
      count: true,
      subjectColor: '',
    }
  },
  methods: {
    paint() {
      this.count = !this.count
      if (this.subjectColor) {
        this.subjectColor = ''
      } else {
        this.subjectColor = 'lightgreen'
      }
    },
  },
}
</script>
<style scoped>
.painted {
  width: 150px;
  height: 75px;
  margin: 10px;
  border: solid 1px black;
}
</style>
