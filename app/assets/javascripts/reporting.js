// TODOs - page specific javascript 

$('.js-reporting').ready( function(){
  console.log("init_reporting");

  //TODO - to use these configs when passing json from rails timesheet models
  var popCanvas = document.getElementById("popChart").getContext("2d");

  var content_tag = $('#rb_reporting_data');
  
  var jsondata = {
      labels: content_tag.data('labels'),
      datasets: [{
        label: content_tag.data('legend'),
        data: content_tag.data('data'),
        // One background color for all
        backgroundColor: '#34495E'
      }]
    };
  
    var barChart = new Chart(popCanvas, {
      type: 'bar',
      data:  jsondata,
      //bar chart config options
      options: {
        title: {
          display: true,
          text: content_tag.data('title')
        },
        scales: {
          yAxes : [{
            display: true,
            ticks: {
              min: 0,
              max: 16
            }
          }]
        },
        tooltips: {
          yAlign: 'bottom',
          xAlign: 'center',
          position: 'average',
          xPadding: 16,
          yPadding: 10,
          backgroundColor: '#26B99A',
          titleFontStyle: 'normal',
          titleMarginBottom: 15
        },
        legend: {
          display: true,
          position: 'bottom',
          labels: {
            boxWidth: 15
          }
        }
      }
    });

});
