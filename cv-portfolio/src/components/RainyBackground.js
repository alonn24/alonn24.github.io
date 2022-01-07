import React from "react";

const rainColors = ["rgba(49, 130, 206, 0.8)", "rgba(246, 173, 85, 0.8)"];
const ExperienceCanvas = () => {
  const canvasRef = React.useRef();

  React.useEffect(() => {
    const canvas = canvasRef.current;
    const canvasContainer = canvas.parentNode;
    canvas.width = canvasContainer.clientWidth;
    canvas.height = canvasContainer.clientHeight;
    var ctx = canvas.getContext('2d');
    var w = canvas.width;
    var h = canvas.height;

    // ctx.strokeStyle = value;
    // ctx.lineWidth = 3;

    // Initialize maxParts drops
    var particles = [];
    var maxParts = 50;
    for(var a = 0; a < maxParts; a++) {
      particles.push({
        x: Math.random() * w,
        y: Math.random() * h,
        c: rainColors[parseInt(Math.random() * 2)],
        r: Math.random() * 10,
        // l: Math.random() * 1,
        // xs: -5 + Math.random() * 10,
        // ys: Math.random() * 10 + 10,
        // lw: Math.random() * 5
      })
    }

    function draw() {
      ctx.clearRect(0, 0, w, h);
      
      for (var c = 0; c < particles.length; c++) {
        // draw
        var p = particles[c];
        const d = parseInt(Math.abs(p.y - window.pageYOffset) / 50);
        console.log(d)
        ctx.beginPath();
        ctx.moveTo(p.x, p.y);
        ctx.arc(p.x, p.y, p.r + d, 0, Math.PI * 2);
        ctx.fillStyle = p.c;
        ctx.fill();
        
        // ctx.lineTo(p.x + p.l * p.xs, p.y + p.l * p.ys);
        // ctx.strokeStyle = p.c;
        // ctx.lineWidth = p.lw;
        // ctx.stroke();

        // // move
        // p.x += p.xs;
        // p.y += p.ys;
        // if (p.x > w || p.y > h) {
        //   p.x = Math.random() * w;
        //   p.y = -20;
        // }
      }
    }

    const intervalID = setInterval(draw, 30);
    return () => {
      clearInterval(intervalID);
    };
  }, []);

  const styles = { position: 'absolute', left: 0, width: '100%', top: 0, height: '100%' };
  return <canvas ref={canvasRef} style={styles} />
};

export default ExperienceCanvas;
