<script>
import { Radar } from 'vue-chartjs'

export default {
  extends: Radar,
  props: {
    results: {
      // type: Object,
      // required: true,
    }
  },
  data() {
    return {
      latestResult: {
        type: Array,
        required: true
      },
      formerResult: {
        type: Array,
        required: true
      },
    }
  },
  computed: {
    chartData() {
      return {
        labels: [ 'ポジティブ度', '感情の強さ', '活発度' ],
        datasets: [
          {
            label: '最新の診断結果',
            data: this.latestResult,
            backgroundColor: 'rgba(255, 99, 132, 0.6)',
            borderColor: 'rgb(255, 99, 132)',
            pointBackgroundColor: 'rgb(255, 99, 132)',
            pointBorderColor: '#fff',
            pointHoverBackgroundColor: '#fff',
            pointHoverBorderColor: 'rgb(255, 99, 132)',
          },
          {
            label: '一つ前の診断結果',
            data: this.formerResult,
            backgroundColor: 'rgba(0, 172, 237, 0.7)',
            borderColor: 'rgb(0, 172, 237)',
            pointBackgroundColor: 'rgb(0, 172, 237)',
            pointBorderColor: '#fff',
            pointHoverBackgroundColor: '#fff',
            pointHoverBorderColor: 'rgb(0, 172, 237)',
          },
        ]
      }
    },
    chartOptions() {
      return {
        responsive: true,
        maintainAspectRatio: false,
        tooltips: {
        },
        legend: {
          display: true,
          position: 'bottom',
          labels: {
            fontSize: 18,
            fontColor: 'white',
            fontStyle: 'bold',
          }
        },
        animation:{
          duration: 1500,
          easing: 'easeInOutCubic'
        },
        scale: {
          ticks: {
            display: false,
            max: 100,
            min: 0,
          },
          gridLines: {
            color: 'white',
          },
          angleLines: {
            color: 'white',
          },
          pointLabels: {
            fontSize: 20,
            fontColor: '#ffffff',
            fontStyle: 'bold',
          },
        }
      }
    }
  },
  watch: {
    results: function() {
      this.adjustLatestData(),
      this.adjustFormerData(),
      this.renderChart(this.chartData, this.chartOptions)
    }
  },
  methods: {
    adjustLatestData() {
      let latestScore = this.adjustScore(this.results[0].score)
      let latestMagnitude = this.adjustMagnitude(this.results[0].magnitude)
      let latestTroversion = this.adjustTroversion(this.results[0].troversion)
      this.latestResult = [ latestScore, latestMagnitude, latestTroversion ];
    },
    adjustFormerData(){
      let formerScore = this.adjustScore(this.results[1].score)
      let formerMagnitude = this.adjustMagnitude(this.results[1].magnitude)
      let formerTroversion = this.adjustTroversion(this.results[1].troversion)
      this.formerResult = [ formerScore, formerMagnitude, formerTroversion ];
    },
    adjustScore(score) {
      return Math.trunc( ( score + 1 ) / 2 * 100 );
    },
    adjustMagnitude(magnitude) {
      if ( magnitude < 1.14 ) {
        return Math.trunc( ( magnitude ) / 1.14 * 100 );
      } else {
        return 100;
      };
    },
    adjustTroversion(troversion) {
      if ( troversion < 0.74 ) {
        return Math.trunc( ( troversion ) / 0.74 * 100 );
      } else {
        return 100;
      };
    },
  }
}
</script>

<style scoped>
</style>