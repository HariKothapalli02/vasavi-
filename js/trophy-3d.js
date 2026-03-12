document.addEventListener('DOMContentLoaded', () => {
    const container = document.getElementById('trophy-canvas');
    if (!container) return;

    // Wait for the container to become visible (if it's hidden during fetching)
    const observer = new MutationObserver(() => {
        if (container.offsetWidth > 0) {
            initTrophy();
            observer.disconnect();
        }
    });

    // Check if parent #winnerDetails becomes visible
    const winnerDetails = document.getElementById('winnerDetails');
    if (winnerDetails) {
        observer.observe(winnerDetails, { attributes: true, attributeFilter: ['style'] });
        // Initial check in case it's already visible
        if (window.getComputedStyle(winnerDetails).display !== 'none') {
            initTrophy();
            observer.disconnect();
        }
    }

    function initTrophy() {
        if (container.dataset.initialized === 'true') return;
        container.dataset.initialized = 'true';

        const width = container.clientWidth || 180;
        const height = container.clientHeight || 180;

        const scene = new THREE.Scene();
        const camera = new THREE.PerspectiveCamera(45, width / height, 0.1, 100);
        camera.position.z = 12;

        const renderer = new THREE.WebGLRenderer({ antialias: true, alpha: true });
        renderer.setSize(width, height);
        renderer.setPixelRatio(window.devicePixelRatio);
        container.appendChild(renderer.domElement);

        // --- Lighting ---
        const ambientLight = new THREE.AmbientLight(0xffffff, 0.4);
        scene.add(ambientLight);

        // Main warm light
        const mainLight = new THREE.DirectionalLight(0xffd700, 1);
        mainLight.position.set(5, 5, 5);
        scene.add(mainLight);

        // Secondary cool rim light
        const rimLight = new THREE.DirectionalLight(0xffffff, 0.3);
        rimLight.position.set(-5, 2, -5);
        scene.add(rimLight);

        // Interactive glint light
        const glintLight = new THREE.PointLight(0xffffff, 1, 20);
        glintLight.position.set(0, 0, 8);
        scene.add(glintLight);

        // --- Materials ---
        const goldMaterial = new THREE.MeshPhongMaterial({
            color: 0xffd700,
            specular: 0xffffff,
            shininess: 150,
            flatShading: false
        });

        // --- Trophy Construction ---
        const trophyGroup = new THREE.Group();

        // 1. Tiered Base
        const baseStage1 = new THREE.Mesh(new THREE.CylinderGeometry(2, 2.2, 0.3, 32), goldMaterial);
        baseStage1.position.y = -3.5;
        trophyGroup.add(baseStage1);

        const baseStage2 = new THREE.Mesh(new THREE.CylinderGeometry(1.6, 2, 0.4, 32), goldMaterial);
        baseStage2.position.y = -3.15;
        trophyGroup.add(baseStage2);

        const baseStage3 = new THREE.Mesh(new THREE.CylinderGeometry(0.8, 1.2, 0.6, 32), goldMaterial);
        baseStage3.position.y = -2.65;
        trophyGroup.add(baseStage3);

        // 2. Stem
        const stem = new THREE.Mesh(new THREE.CylinderGeometry(0.35, 0.45, 1.2, 32), goldMaterial);
        stem.position.y = -1.75;
        trophyGroup.add(stem);

        // 3. Main Bowl (Lathe-like construction)
        const bowlBottom = new THREE.Mesh(new THREE.SphereGeometry(1.2, 32, 16, 0, Math.PI * 2, 0, Math.PI / 2), goldMaterial);
        bowlBottom.rotation.x = Math.PI;
        bowlBottom.position.y = -1.15;
        trophyGroup.add(bowlBottom);

        const bowlBody = new THREE.Mesh(new THREE.CylinderGeometry(2, 1.2, 2.5, 32, 1, true), goldMaterial);
        bowlBody.position.y = 0.1;
        trophyGroup.add(bowlBody);

        const bowlRim = new THREE.Mesh(new THREE.TorusGeometry(2, 0.1, 16, 100), goldMaterial);
        bowlRim.rotation.x = Math.PI / 2;
        bowlRim.position.y = 1.35;
        trophyGroup.add(bowlRim);

        // 4. Handles
        const handlePath = new THREE.TorusGeometry(1.2, 0.15, 16, 48, Math.PI * 1.2);

        const handleL = new THREE.Mesh(handlePath, goldMaterial);
        handleL.position.set(-1.8, 0.5, 0);
        handleL.rotation.z = Math.PI / 1.7;
        trophyGroup.add(handleL);

        const handleR = new THREE.Mesh(handlePath, goldMaterial);
        handleR.position.set(1.8, 0.5, 0);
        handleR.rotation.z = -Math.PI / 1.7;
        trophyGroup.add(handleR);

        scene.add(trophyGroup);

        // --- Animation ---
        function animate() {
            requestAnimationFrame(animate);

            const time = Date.now() * 0.001;

            // Rotation
            trophyGroup.rotation.y += 0.015;

            // Hover Float
            trophyGroup.position.y = Math.sin(time * 2) * 0.25;

            // Move glint light slightly
            glintLight.position.x = Math.sin(time) * 5;
            glintLight.position.y = Math.cos(time) * 2;

            renderer.render(scene, camera);
        }

        animate();

        // --- Resize handler ---
        window.addEventListener('resize', () => {
            const newW = container.clientWidth;
            const newH = container.clientHeight;
            if (newW && newH) {
                camera.aspect = newW / newH;
                camera.updateProjectionMatrix();
                renderer.setSize(newW, newH);
            }
        });
    }
});
