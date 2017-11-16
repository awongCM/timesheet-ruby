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
        backgroundColor: [
          'rgba(255, 99, 132, 0.6)',
          'rgba(54, 162, 235, 0.6)',
          'rgba(255, 206, 86, 0.6)',
          'rgba(75, 192, 192, 0.6)',
          'rgba(153, 102, 255, 0.6)',
          'rgba(255, 159, 64, 0.6)',
          'rgba(255, 99, 132, 0.6)',
          'rgba(54, 162, 235, 0.6)',
          'rgba(255, 206, 86, 0.6)',
          'rgba(75, 192, 192, 0.6)',
          'rgba(153, 102, 255, 0.6)'
        ]
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
