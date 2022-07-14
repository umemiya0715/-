<template>
  <div class="relative">
    <apexchart
      height="600"
      width="800"
      type="radar"
      :options="chartOptions"
      :series="series"
      style="display: relative;"
    />
  </div>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
  data() {
    return {
      chartOptions: {
        chart: {
          animations: {
            enabled: true,
            easing: 'easeinout',
            speed: 800,
          },
          height: 600,
          width: 800,
          type: 'radar',
          offsetY: 0,
          toolbar: {
            show: false,
          }
        },
        fill: {
          colors: ['#f56565'],
          opacity: 0.8,
        },
        colors: ['#f56565'],
        legend: {
          show: false,
        },
        markers: {
          size: 4,
          colors: ['#fff'],
          strokeColor: '#FF4560',
          strokeWidth: 2,
        },
        tooltip:{
          theme: 'dark',
          style: {
            fontSize: '12px'
          }
        },
        xaxis: {
          categories: ['ポジティブ度', '感情の強さ', '活発度'],
          labels: {
            style: {
              colors: ['#ffffff', '#ffffff', '#ffffff'],
              fontSize: '25px',
              fontWeight: 400,
            }
          },
        },
        yaxis: {
          min: 0,
          max: 100,
          labels: {
            show: false,
            fontSize: '1px',
            style: {
              colors: ['#ffffff', '#ffffff', '#ffffff', '#ffffff', '#ffffff', '#ffffff', '#ffffff', '#ffffff', '#ffffff', '#ffffff', '#ffffff']
            },
          }
        }
      },
      series: [
        {
          name: '診断結果',
          data: []
        }
      ],
    }
  },
  mounted(){
    this.adjustData()
  },
  methods: {
     adjustData() {
      let adjustedScore = '';
      let adjustedMagnitude = '';
      let adjustedTroversion ='';
      adjustedScore = Math.trunc( ( this.results.score + 1 ) / 2 * 100 );
      if ( this.results.magnitude < 1.14 ) {
        adjustedMagnitude = Math.trunc( ( this.results.magnitude ) / 1.14 * 100 );
      } else {
        adjustedMagnitude = 100;
      };
      if ( this.results.troversion < 0.74 ) {
        adjustedTroversion = Math.trunc( ( this.results.troversion ) / 0.74 * 100 );
      } else {
        adjustedTroversion = 100;
      };
      this.series = [
        {
          name: '診断結果',
          data: [adjustedScore, adjustedMagnitude, adjustedTroversion]
        }
      ];
    },
  },
  computed: {
    ...mapGetters(
      'results', ['results']
    ),
  }
}
</script>

<style scoped>
#chart {
  display: flex;
}
</style>
