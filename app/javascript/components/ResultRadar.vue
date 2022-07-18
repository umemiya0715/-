<script>
import { Radar } from 'vue-chartjs'
import { mapGetters } from 'vuex'

export default {
  extends: Radar,
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
      adjustedTroversion:{
        type: Number,
        required: true
      },
    }
  },
  computed: {
    ...mapGetters(
      'results', ['results']
    ),
  },
  mounted(){
    this.adjustData(),
    this.renderChart(
      {
        labels: [ 'ポジティブ度', '感情の強さ', '活発度' ],
        datasets: [
          {
            label: '診断結果',
            data: [ this.adjustedScore, this.adjustedMagnitude, this.adjustedTroversion ],
            backgroundColor: 'rgba(255, 99, 132, 0.6)',
            borderColor: 'rgb(255, 99, 132)',
            pointBackgroundColor: 'rgb(255, 99, 132)',
            pointBorderColor: '#fff',
            pointHoverBackgroundColor: '#fff',
            pointHoverBorderColor: 'rgb(255, 99, 132)',
          }
        ]
      },
      {
        responsive: true,
        maintainAspectRatio: false,
        tooltips: {
          // enabled: false,
        },
        legend: {
          display: false,
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
    )
  },
  methods: {
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
      };
    },
  },
}
</script>

<style scoped>
</style>
