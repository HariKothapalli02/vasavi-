/**
 * Precise, smooth 3D tilt effect for login and instruction cards.
 */
document.addEventListener('DOMContentLoaded', () => {
    const cards = document.querySelectorAll('.modern-login-card, .instruction-card');

    cards.forEach(card => {
        card.addEventListener('mousemove', (e) => {
            const rect = card.getBoundingClientRect();
            const x = e.clientX - rect.left;
            const y = e.clientY - rect.top;

            const centerX = rect.width / 2;
            const centerY = rect.height / 2;

            const rotateX = ((y - centerY) / centerY) * -10; // Max 10 degrees tilt
            const rotateY = ((x - centerX) / centerX) * 10;

            card.style.transform = `perspective(1000px) rotateX(${rotateX}deg) rotateY(${rotateY}deg) translateY(-5px)`;
            card.style.boxShadow = `
                ${-rotateY * 2}px ${rotateX * 2}px 50px -12px rgba(0, 0, 0, 0.2),
                0 25px 50px -12px rgba(0, 0, 0, 0.1)
            `;
        });

        card.addEventListener('mouseleave', () => {
            card.style.transform = `perspective(1000px) rotateX(0deg) rotateY(0deg) translateY(0)`;
            card.style.boxShadow = `0 20px 25px -5px rgba(0, 0, 0, 0.05), 0 8px 10px -6px rgba(0, 0, 0, 0.01)`;
        });
    });
});
