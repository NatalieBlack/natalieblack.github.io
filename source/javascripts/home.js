$(document).on('ready page:load', function(){


    var w = window;
    var width = w.innerWidth * 0.96,
        height = w.innerHeight * 0.96,
        radius = Math.min(width, height) / 2;

    var transtime = 300;
    var hovercolour = '#E7E7EF';

    var color = d3.scale.ordinal()
        .range(["steelblue", "azure", "lightsteelblue", "tomato", "lightsalmon", "salmon", "darksalmon", "coral", "aliceblue", "lightblue", "powderblue", "lightcyan", "paleturquoise", "aquamarine", "turquoise", "mediumturquoise", "darkturquoise", "mediumaquamarine", "lightseagreen", "darkcyan", "cadetblue", "darkslateblue", "lavender","aliceblue", "lightblue", "powderblue", "lightcyan", "paleturquoise", "aquamarine", "turquoise", "mediumturquoise", "darkturquoise", "mediumaquamarine", "lightseagreen", "darkcyan", "cadetblue", "lavender", "darkslateblue" ]);

    var outerR = radius - (radius * 0.02);
    var innerR = radius - (radius * 0.5)

    var arc = d3.svg.arc()
        .outerRadius(outerR)
        .innerRadius(innerR);

    var pie = d3.layout.pie()
        .sort(null)
        .value(function(d) { return d.posts * 1000000; });

    var svg = d3.select("body").append("svg")
        .attr("width", width)
        .attr("height", height)
        .attr("class", "void")
        .append("g")
        .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")");

    d3.csv("data/links.csv", function(error, data1) {
    d3.csv("data/category_list.csv", function(error2, data2) {
      var data = data1.concat(data2);

      data.forEach(function(d) {
        d.posts = +d.posts;
      });


      var g = svg.selectAll(".arc")
          .data(pie(data))
          .enter()
          .append("g")
          .attr("class", "arc")
          .append("svg:a")
          .attr("xlink:href", function(d) {return d.data.url})
          .on("mouseover", function(d) {
              d3.select(this).select("path").transition()
              .duration(transtime)
              .style("fill", hovercolour);
              })
          .on("mouseout", function(d) {
              d3.select(this).select("path").transition()
              .duration(transtime)
              .style("fill", d3.select(this).select('path').attr('origfill'));
              });

      var getCircleSize = function(r) {
         if (r == radius * 0.4) {
           return radius * 0.5; 
         } else {
           return radius * 0.4;
         } 
      };

      svg.append("circle")
          .attr("cx", 0)
          .attr("cy", 0)
          .attr("r", radius * 0.4)
          .attr("class", "yolk")
          .attr("origfill", hovercolour)
          .on("click", function(d) {
            console.log('hi');
            d3.select(this).transition()
            .duration(transtime)
            .attr("r", getCircleSize(d3.select(this).attr("r")));
            })
          .on("mouseover", function(d) {
                  d3.select(this).transition()
                  .duration(transtime)
                  .style("fill", '#C2C2D6');
                  })
          .on("mouseout", function(d) {
              d3.select(this).transition()
              .duration(transtime)
              .style("fill", d3.select(this).attr('origfill'));
              });

        svg.append("text")
        .attr("class", "yolk")
        .text('Natalie Black')
        .on("click", function(d) {
          console.log('hi');
          d3.select('circle').transition()
          .duration(transtime)
          .attr("r", getCircleSize(d3.select('circle').attr("r")));
          })
        .on("mouseover", function(d) {
                d3.select('circle').transition()
                .duration(transtime)
                .style("fill", '#C2C2D6');
                })
        .on("mouseout", function(d) {
            d3.select('circle').transition()
            .duration(transtime)
            .style("fill", d3.select('circle').attr('origfill'));
            });

      g.append("path")
          .attr("d", arc)
          .attr("origfill", function(d) { return color(d.data.tag); })
          .style("fill", function(d) { return color(d.data.tag); });


      if(browser() === 'Chrome'){
        g.append("foreignObject")
            .style("width", (outerR - innerR - 100) + "px")
            .attr("transform", function(d) { return gTextTransform(d); })
            .text(function(d) { return d.data.tag; });
      } else {
         g.append("text")
          .attr('class','stupid-firefox')
          .attr("transform", function(d) { return gTextTransform(d); })
          .style("font-size", "0.75rem")
          .text(function(d) { return d.data.tag; });

      }



    function gTextTransform(d) {
      var coords = arc.centroid(d);
      /*console.log(coords);
      //coords[0] = coords[0] * 0.9;
      if(coords[1] > 0) {
      coords[1] = coords[1] * 0.8;
      } else {
        coords[1] = coords[1] * 0.9;
      }
      console.log(coords);
      */
       return "translate(" + coords + ")" + translate(d) + " rotate(" + (angle(d) ) + ")" ;
    }

    function translate(d) {
        if(browser() === 'Chrome'){
          if(wedgeIsSmall(d)){
              return "translate(-7,-5)";
          } else {
              return "translate(-32,-30)";
          }
           if((topOrBottom(d) || wedgeIsLarge(d))){
              return "translate(-32,-20)";
           } else {
              return "translate(-5,-12)";
           }
        } else {
            return "";
        }
    }

    function angle(d) {
        var a = (d.startAngle + d.endAngle) * 90 / Math.PI - 90;
        var aa = a > 90 ? a - 180 : a;
        if(wedgeIsSmall(d)) {
          return aa;
        } else {
          return 0;
        }
        /*if(wedgeIsLarge(d) || topOrBottom(d)){
            return 0;
        } else {
            return aa;
        }*/
    }

    function wedgeIsSmall(d){
      return (d.endAngle - d.startAngle) < 0.2;
    }

    function wedgeIsLarge(d){
      return (d.endAngle - d.startAngle) > 0.35;
    }

    function topOrBottom(d){
        return d.endAngle >= 6 || d.startAngle <= 0;
    }

    function centerClick() {
        d3.select(this).transition()
            .duration(transtime)
            .attr("r", 10);
    }

    function mouseover() {
      d3.select(this).select("path").transition()
         .duration(transtime)
         .style("fill", hovercolour);
    }

    function mouseoutArc() {
      d3.select(this).select("path").transition()
         .duration(transtime)
         .style("fill", d3.select(this).select('path').attr('origfill'));
    }

    });});

    function browser(){
        var ua= navigator.userAgent, tem,
        M= ua.match(/(opera|chrome|safari|firefox|msie|trident(?=\/))\/?\s*(\d+)/i) || [];
        if(/trident/i.test(M[1])){
            tem=  /\brv[ :]+(\d+)/g.exec(ua) || [];
            return 'IE '+(tem[1] || '');
        }
        return M[1]
    }
});
