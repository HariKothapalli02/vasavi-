document.addEventListener('DOMContentLoaded', () => {
    const winnerDetails = document.getElementById('winnerDetails');
    if (!winnerDetails) return;

    // Use a MutationObserver to detect when the winner details are shown
    // since they are loaded asynchronously via admin.js
    const observer = new MutationObserver((mutations) => {
        mutations.forEach((mutation) => {
            if (mutation.attributeName === 'style' && winnerDetails.style.display !== 'none') {
                triggerCelebration();
                observer.disconnect();
            }
        });
    });

    observer.observe(winnerDetails, { attributes: true });

    function triggerCelebration() {
        // Add the revealed class to trigger CSS animations
        winnerDetails.classList.add('revealed');

        // Initial big blast
        confettiBlast();

        // Follow-up smaller blasts for a few seconds
        setTimeout(() => confettiSideBlasts(), 500);
        setTimeout(() => confettiSideBlasts(), 1500);
        setTimeout(() => confettiSideBlasts(), 2500);

        // Continuous gold dust effect
        startGoldDust();
    }

    function confettiBlast() {
        const duration = 3 * 1000;
        const animationEnd = Date.now() + duration;
        const defaults = { startVelocity: 30, spread: 360, ticks: 60, zIndex: 0 };

        function randomInRange(min, max) {
            return Math.random() * (max - min) + min;
        }

        const interval = setInterval(function () {
            const timeLeft = animationEnd - Date.now();

            if (timeLeft <= 0) {
                return clearInterval(interval);
            }

            const particleCount = 50 * (timeLeft / duration);
            // since particles fall down, start a bit higher than random
            confetti(Object.assign({}, defaults, {
                particleCount,
                origin: { x: randomInRange(0.1, 0.3), y: Math.random() - 0.2 },
                colors: ['#ffd700', '#ffffff', '#4f46e5']
            }));
            confetti(Object.assign({}, defaults, {
                particleCount,
                origin: { x: randomInRange(0.7, 0.9), y: Math.random() - 0.2 },
                colors: ['#ffd700', '#ffffff', '#4f46e5']
            }));
        }, 250);
    }

    function confettiSideBlasts() {
        const end = Date.now() + 100;

        // Celebrate!
        (function frame() {
            confetti({
                particleCount: 2,
                angle: 60,
                spread: 55,
                origin: { x: 0 },
                colors: ['#ffd700', '#ffffff']
            });
            confetti({
                particleCount: 2,
                angle: 120,
                spread: 55,
                origin: { x: 1 },
                colors: ['#ffd700', '#ffffff']
            });

            if (Date.now() < end) {
                requestAnimationFrame(frame);
            }
        }());
    }

    function startGoldDust() {
        const canvas = document.createElement('canvas');
        canvas.id = 'gold-dust-canvas';
        canvas.style.position = 'fixed';
        canvas.style.top = '0';
        canvas.style.left = '0';
        canvas.style.width = '100%';
        canvas.style.height = '100%';
        canvas.style.pointerEvents = 'none';
        canvas.style.zIndex = '1';
        document.body.appendChild(canvas);

        const ctx = canvas.getContext('2d');
        let width, height;

        function resize() {
            width = canvas.width = window.innerWidth;
            height = canvas.height = window.innerHeight;
        }

        window.addEventListener('resize', resize);
        resize();

        const particles = [];
        const particleCount = 40;

        for (let i = 0; i < particleCount; i++) {
            particles.push({
                x: Math.random() * width,
                y: Math.random() * height,
                vx: (Math.random() - 0.5) * 0.5,
                vy: (Math.random() * 0.5) + 0.2,
                size: Math.random() * 3 + 1,
                opacity: Math.random() * 0.5 + 0.2,
                color: Math.random() > 0.5 ? '#ffd700' : '#ffffff'
            });
        }

        function draw() {
            ctx.clearRect(0, 0, width, height);

            particles.forEach(p => {
                ctx.globalAlpha = p.opacity;
                ctx.fillStyle = p.color;
                ctx.beginPath();
                ctx.arc(p.x, p.y, p.size, 0, Math.PI * 2);
                ctx.fill();

                p.x += p.vx;
                p.y += p.vy;

                if (p.y > height) {
                    p.y = -10;
                    p.x = Math.random() * width;
                }
            });

            requestAnimationFrame(draw);
        }

        draw();
    }
});
