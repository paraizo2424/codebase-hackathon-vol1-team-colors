import { Bar, mixins } from 'vue-chartjs'
const { reactiveProp } = mixins

export default {
  extends: Bar,
  mixins: [reactiveProp],
  props: ['options'],
  data() {
    return {
      responsive: true,
      legend: {
        // 凡例に関する設定
        display: true,
        position: 'bottom',
      },
      //   tooltips: {
      //     //   ツールチップに関する設定
      //     display: true,
      //   },
      //   elements: {
      //     //   要素に関する設定
      //   },
      scales: {
        yAxes: [
          {
            // stacked: false, // 積み上げ面グラフを有効にする
            autoSkip: false,
          },
        ],
      },
    }
  },
  mounted() {
    this.renderChart(this.chartData, this.options)
  },
}
