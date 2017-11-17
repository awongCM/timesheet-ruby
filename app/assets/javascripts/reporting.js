// TODOs - page specific javascript 

$('.reporting').ready( function(){
  console.log("init_reporting");
  //TODO - to use these configs when passing json from rails timesheet models
  var popCanvas = document.getElementById("popChart").getContext("2d");
  
  var jsondata = {
      labels: ["China", "India", "United States", "Indonesia", "Brazil", "Pakistan", "Nigeria", "Bangladesh", "Russia", "Japan"],
      datasets: [{
        label: 'Population',
        data: [1379302771, 1281935911, 326625791, 260580739, 207353391, 204924861, 190632261, 157826578, 142257519, 126451398],
        // One background color for all
        backgroundColor: '#34495E'
      }]
    };
  
    var barChart = new Chart(popCanvas, {
      type: 'bar',
      data:  jsondata,
      options: {
        tooltips: {
          cornerRadius: 0,
          caretSize: 0,
          xPadding: 16,
          yPadding: 10,
          backgroundColor: 'rgba(0, 150, 100, 0.9)',
          titleFontStyle: 'normal',
          titleMarginBottom: 15
        },
        legend: {
          display: true,
          position: 'bottom',
          labels: {
            boxWidth: 100,
            fontColor: 'rgb(60, 180, 100)'
          }
        }
      }
    });
});
