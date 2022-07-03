<template>
  <Bar
    :chart-options="chartOptions"
    :chart-data="chartData"
    :v-bind="results"
  />
</template>

<script>
import { Bar } from 'vue-chartjs/legacy'
import { mapGetters } from 'vuex'
import { Chart as ChartJS, Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale } from 'chart.js'

ChartJS.register(Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale)

export default {
  name: 'BarChart',
  components: { Bar },
  data() {
    return {
      chartOptions: {
        responsive: true,
        label: false,
        indexAxis: 'y',
        scales: {
          x: {
            max: 1,
          }
        }
      }
    }
  },
  computed: {
    ...mapGetters(
      'results', ['results']
    ),
    chartData() {
      return {
        labels: [ 'ポジティブ度', '感情の強さ', '活発度' ],
        datasets: [
          {
            data: [this.results.score, this.results.magnitude, this.results.troversion],
            backgroundColor: 'rgba(168, 218, 236, 0.2)',
            borderColor: 'rgba(28,171,236,1)',
            borderWidth: 2
          }
        ]
      }
    }
  }
}
</script>

<style scoped>
</style>
