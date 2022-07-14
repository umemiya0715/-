<template>
  <apexchart
    :chart-options="chartOptions"
    :chart-data="chartData"
    :adjustedScore="adjustedScore"
    :adjustedMagnitude="adjustedMagnitude"
    :adjustedTroversion="adjustedTroversion"
  />
</template>

<script>
// import { Radar } from 'vue-chartjs'
// import {
//   Chart as ChartJS,
//   Title,
//   Tooltip,
//   Legend,
//   PointElement,
//   LineElement,
//   RadialLinearScale
// } from 'chart.js'

// ChartJS.register(
//   Title,
//   Tooltip,
//   Legend,
//   PointElement,
//   RadialLinearScale,
//   LineElement
// )

export default {
  // name: 'PreviousRadar',
  // components: { Radar },
  // props: {
  //   result: {
  //     type: Object,
  //     required: true
  //   },
  // },
  // data() {
  //   return {
  //     adjustedScore: {
  //       type: Number,
  //       required: true
  //     },
  //     adjustedMagnitude: {
  //       type: Number,
  //       required: true
  //     },
  //     adjustedTroversion: {
  //       type: Number,
  //       required: true
  //     },
  //     chartOptions: {
  //       responsive: true,
  //       maintainAspectRatio: false,
  //       plugins: {
  //         legend: {
  //           display: false,
  //         },
  //       },
  //       animation:{
  //         duration: 1500,
  //         easing: 'easeInOutCubic'
  //       },
  //       scales: {
  //         r: {
  //           ticks: {
  //             display: false
  //           },
  //           suggestedMax: 100,
  //           suggestedMin: 0,
  //           grid: {
  //             color: 'white',
  //           },
  //           angleLines: {
  //             color: 'white',
  //           },
  //           pointLabels: {
  //             color: 'white',
  //             font: {
  //               size: 25,
  //               weight: 'bold',
  //             }
  //           }
  //         }
  //       }
  //     },
  //   }
  // },
  // mounted: function(){
  //   this.adjustData();
  // },
  // methods: {
  //   adjustData() {
  //     this.adjustedScore = Math.trunc( ( this.result.score + 1 ) / 2 * 100 );
  //     if ( this.result.magnitude < 1.14 ) {
  //       this.adjustedMagnitude = Math.trunc( ( this.result.magnitude ) / 1.14 * 100 );
  //     } else {
  //       this.adjustedMagnitude = 100;
  //     };
  //     if ( this.result.troversion < 0.74 ) {
  //       this.adjustedTroversion = Math.trunc( ( this.result.troversion ) / 0.74 * 100 );
  //     } else {
  //       this.adjustedTroversion = 100;
  //     }
  //   },
  // },
  // computed: {
  //   chartData() {
  //     return {
  //       labels: [ 'ポジティブ度', '感情の強さ', '活発度' ],
  //       datasets: [
  //         {
  //           data: [ this.adjustedScore, this.adjustedMagnitude, this.adjustedTroversion ],
  //           backgroundColor: 'rgba(255, 99, 132)',
  //           borderColor: 'rgb(255, 99, 132)',
  //           pointBackgroundColor: 'rgb(255, 99, 132)',
  //           pointBorderColor: '#fff',
  //           pointHoverBackgroundColor: '#fff',
  //           pointHoverBorderColor: 'rgb(255, 99, 132)',
  //         }
  //       ]
  //     }
  //   }
  // }
}
</script>

<style scoped>
</style>
