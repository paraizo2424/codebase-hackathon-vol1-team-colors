<template>
  <div class="small">
    <h5>学習時間</h5>
    <bar-chart :chart-data="datacollection"></bar-chart>
  </div>
</template>

<script>
import axios from 'axios'
import BarChart from './BarChart.js'

export default {
  components: {
    BarChart,
  },
  data() {
    return {
      datacollection: null,
      options: {},
      // subs_list: [
      //   { value: 1, text: 'HTML5' },
      //   { value: 2, text: 'CSS3' },
      //   { value: 3, text: 'JavaScript' },
      //   { value: 4, text: 'Ruby' },
      //   { value: 5, text: 'Sinatra' },
      //   { value: 6, text: 'Ruby on Rails' },
      //   { value: 7, text: 'Web制作' },
      // ],
    }
  },
  mounted() {
    this.fillData()
  },
  methods: {
    fillData() {
      this.url = 'http://localhost:8000/subjects'
      axios
        .get(this.url, {
          headers: {
            'access-token': '9EhnDsx6pa3YyDRVD0ns2Q',
            client: '-DECCSRcAYwQl5bQ48s0sA',
            uid: 'sample@sample.com',
          },
          data: {},
        })
        .then(({ data }) => {
          // console.log(`response => ${Object.keys(data)}`)
          const labels = Object.keys(data)
          const html = labels[0]
          const css = labels[1]
          const js = labels[2]
          const ruby = labels[3]
          const sinatra = labels[4]
          const rails = labels[5]
          const web = labels[6]
          // console.log(`html => ${html}`)
          // console.log(`data[html]['mimute'] => ${data[html].mimute}`)
          this.datacollection = {
            datasets: [
              {
                label: html,
                backgroundColor: 'red',
                data: [data[html].mimute],
              },
              {
                label: css,
                backgroundColor: 'blue',
                data: [data[css].mimute],
              },
              {
                label: js,
                backgroundColor: 'yellow',
                data: [data[js].mimute],
              },
              {
                label: ruby,
                backgroundColor: 'deeppink',
                data: [data[ruby].mimute],
              },
              {
                label: sinatra,
                backgroundColor: 'gray',
                data: [data[sinatra].mimute],
              },
              {
                label: rails,
                backgroundColor: 'crimson',
                data: [data[rails].hour],
              },
              {
                label: web,
                backgroundColor: 'lime',
                data: [data[web].hour],
              },
            ],
          }
        })
    },
  },
  // computed: {
  // datacollection () {
  //   // データの整形
  //   return { datasets: [] }
  // }
  // },
}
</script>

<style>
.small {
  max-width: 600px;
  margin: 10px auto;
}
</style>
