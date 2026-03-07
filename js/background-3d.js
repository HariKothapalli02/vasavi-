document.addEventListener('DOMContentLoaded', () => {
    // Scene setup
    const container = document.getElementById('canvas-container');
    if (!container) return;

    const scene = new THREE.Scene();
    scene.fog = new THREE.FogExp2(0xffffff, 0.005); // Brighter fog for more depth

    const camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 1000);
    camera.position.z = 30;

    const renderer = new THREE.WebGLRenderer({ alpha: true, antialias: true });
    renderer.setSize(window.innerWidth, window.innerHeight);
    renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2)); // Limit for performance
    container.appendChild(renderer.domElement);

    // Lights
    const ambientLight = new THREE.AmbientLight(0xffffff, 0.6);
    scene.add(ambientLight);

    const pointLight = new THREE.PointLight(0x4f46e5, 1, 100);
    pointLight.position.set(0, 0, 10);
    scene.add(pointLight);

    const dirLight = new THREE.DirectionalLight(0xe0e7ff, 1);
    dirLight.position.set(20, 20, 20);
    scene.add(dirLight);

    // Geometries
    const geometries = [
        new THREE.IcosahedronGeometry(1.5, 0),
        new THREE.OctahedronGeometry(1.2, 0),
        new THREE.TorusGeometry(1, 0.3, 16, 100),
        new THREE.SphereGeometry(1, 32, 32) // Added sphere
    ];

    // Materials
    const material = new THREE.MeshPhongMaterial({
        color: 0xffffff,
        specular: 0x4f46e5,
        shininess: 50,
        flatShading: true,
        transparent: true,
        opacity: 0.8
    });

    const accentMaterial = new THREE.MeshPhongMaterial({
        color: 0x4f46e5,
        shininess: 100,
        transparent: true,
        opacity: 0.4
    });

    const particles = [];
    const particleCount = 60; // Increased count

    for (let i = 0; i < particleCount; i++) {
        const geometry = geometries[Math.floor(Math.random() * geometries.length)];
        const mat = Math.random() > 0.8 ? accentMaterial : material;
        const mesh = new THREE.Mesh(geometry, mat);

        mesh.position.x = (Math.random() - 0.5) * 100;
        mesh.position.y = (Math.random() - 0.5) * 80;
        mesh.position.z = (Math.random() - 0.5) * 50;

        mesh.rotation.x = Math.random() * Math.PI;
        mesh.rotation.y = Math.random() * Math.PI;

        const scale = Math.random() * 2 + 0.5;
        mesh.scale.set(scale, scale, scale);

        mesh.userData = {
            rotationSpeed: {
                x: (Math.random() - 0.5) * 0.005,
                y: (Math.random() - 0.5) * 0.005
            },
            floatSpeed: 0.002 + Math.random() * 0.005,
            initialY: mesh.position.y,
            randomOffset: Math.random() * 100
        };

        scene.add(mesh);
        particles.push(mesh);
    }

    // Grid - More stylized
    const gridHelper = new THREE.GridHelper(400, 40, 0x4f46e5, 0xe2e8f0);
    gridHelper.position.y = -30;
    gridHelper.rotation.x = Math.PI * 0.05;
    gridHelper.material.transparent = true;
    gridHelper.material.opacity = 0.15;
    scene.add(gridHelper);

    // Mouse Tracking
    let mouseX = 0;
    let mouseY = 0;
    window.addEventListener('mousemove', (e) => {
        mouseX = (e.clientX - window.innerWidth / 2) * 0.01;
        mouseY = (e.clientY - window.innerHeight / 2) * 0.01;
    });

    // Animation Loop
    let time = 0;
    function animate() {
        requestAnimationFrame(animate);
        time += 0.002;

        particles.forEach(p => {
            p.rotation.x += p.userData.rotationSpeed.x;
            p.rotation.y += p.userData.rotationSpeed.y;
            p.position.y = p.userData.initialY + Math.sin(time + p.userData.randomOffset) * 3;

            // Subtle parallax with mouse
            p.position.x += (mouseX * 0.5 - p.position.x) * 0.01;
        });

        gridHelper.rotation.z = Math.sin(time * 0.1) * 0.02;

        // Camera follow mouse gently
        camera.position.x += (mouseX - camera.position.x) * 0.05;
        camera.position.y += (-mouseY - camera.position.y) * 0.05;
        camera.lookAt(0, 0, 0);

        renderer.render(scene, camera);
    }

    animate();

    // Handle Resize
    window.addEventListener('resize', () => {
        camera.aspect = window.innerWidth / window.innerHeight;
        camera.updateProjectionMatrix();
        renderer.setSize(window.innerWidth, window.innerHeight);
    });
});
