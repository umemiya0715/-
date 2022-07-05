<template>
  <radar
    :chart-options="chartOptions"
    :chart-data="chartData"
    :adjustedScore="adjustedScore"
    :adjustedMagnitude="adjustedMagnitude"
    :adjustedTroversion="adjustedTroversion"
  />
</template>

<script>
import { Radar } from 'vue-chartjs/legacy'
import { mapGetters } from 'vuex'
import {
  Chart as ChartJS,
  Title,
  Tooltip,
  Legend,
  PointElement,
  LineElement,
  RadialLinearScale
} from 'chart.js'

ChartJS.register(
  Title,
  Tooltip,
  Legend,
  PointElement,
  RadialLinearScale,
  LineElement
)

export default {
  name: 'ResultRadar',
  components: { Radar },
  data() {
    return {
      adjustedScore: {
        type: Number,
        required: true
      },
      adjustedMagnitude: {
        type: Number,
        required: true
      },
      adjustedTroversion: {
        type: Number,
        required: true
      },
      chartOptions: {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
          legend: {
            display: false,
          },
        },
        animation:{
          duration: 1500,
          easing: 'easeInOutCubic'
        },
        scales: {
          r: {
            ticks: {
              display: false
            },
            suggestedMax: 100,
            suggestedMin: 0,
            grid: {
              color: 'white',
            },
            angleLines: {
              color: 'white',
            },
            pointLabels: {
              color: 'white',
              font: {
                size: 25,
                weight: 'bold',
              }
            }
          }
        }
      },
    }
  },
  watch: {
    results: function() {
      this.adjustData()
    }
  },
  computed: {
    ...mapGetters(
      'results', ['results']
    ),
    adjustData() {
      this.adjustedScore = Math.trunc( ( this.results.score + 1 ) / 2 * 100 );
      if ( this.results.magnitude < 1.14 ) {
        this.adjustedMagnitude = Math.trunc( ( this.results.magnitude ) / 1.14 * 100 );
      } else {
        this.adjustedMagnitude = 100;
      };
      if ( this.results.troversion < 0.74 ) {
        this.adjustedTroversion = Math.trunc( ( this.results.troversion ) / 0.74 * 100 );
      } else {
        this.adjustedTroversion = 100;
      }
    },
    chartData() {
      return {
        labels: [ 'ポジティブ度', '感情の強さ', '活発度' ],
        datasets: [
          {
            data: [ this.adjustedScore, this.adjustedMagnitude, this.adjustedTroversion ],
            backgroundColor: 'rgba(255, 99, 132, 0.2)',
            borderColor: 'rgb(255, 99, 132)',
            pointBackgroundColor: 'rgb(255, 99, 132)',
            pointBorderColor: '#fff',
            pointHoverBackgroundColor: '#fff',
            pointHoverBorderColor: 'rgb(255, 99, 132)',
          }
        ]
      }
    }
  }
}
</script>

<style scoped>
</style>
