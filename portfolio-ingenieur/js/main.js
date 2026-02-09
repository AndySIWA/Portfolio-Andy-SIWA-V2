document.addEventListener('DOMContentLoaded', () => {

    // Smooth scrolling pour les liens d'ancrage
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            const target = document.querySelector(this.getAttribute('href'));
            if (target) {
                target.scrollIntoView({
                    behavior: 'smooth'
                });
            }
        });
    });

    // Animation au scroll (Simple Reveal)
    const observerOptions = {
        threshold: 0.1
    };

    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.style.opacity = '1';
                entry.target.style.transform = 'translateY(0)';
                observer.unobserve(entry.target);
            }
        });
    }, observerOptions);

    // Appliquer l'observateur aux sections et cartes
    const animatedElements = document.querySelectorAll('.section-title, .about-text, .project-card, .contact-wrapper');

    animatedElements.forEach(el => {
        el.style.opacity = '0';
        el.style.transform = 'translateY(30px)';
        el.style.transition = 'opacity 0.6s ease-out, transform 0.6s ease-out';
        observer.observe(el);
    });

    // Header background on scroll
    const navbar = document.querySelector('.navbar');
    const sections = document.querySelectorAll('section');
    const navLinks = document.querySelectorAll('.nav-links a');

    window.addEventListener('scroll', () => {
        let current = '';

        // Navbar styling
        if (window.scrollY > 50) {
            navbar.style.boxShadow = '0 10px 30px -10px rgba(2,12,27,0.7)';
            navbar.style.padding = '10px 0'; // Compact height
            navbar.style.backgroundColor = 'rgba(10, 14, 23, 0.95)';
        } else {
            navbar.style.boxShadow = 'none';
            navbar.style.padding = '20px 0'; // Original height
            navbar.style.backgroundColor = 'rgba(10, 14, 23, 0.85)';
        }

        // Active link highlighting
        sections.forEach(section => {
            const sectionTop = section.offsetTop;
            const sectionHeight = section.clientHeight;
            if (scrollY >= (sectionTop - 150)) {
                current = section.getAttribute('id');
            }
        });

        navLinks.forEach(link => {
            link.classList.remove('active');
            if (link.getAttribute('href').includes(current)) {
                link.classList.add('active');
            }
        });
    });

    // Gestionnaire de formulaire (Simulation)
    const form = document.querySelector('.contact-form');
    if (form) {
        form.addEventListener('submit', (e) => {
            e.preventDefault();
            const btn = form.querySelector('button');
            const originalText = btn.innerText;

            btn.innerText = 'Envoi en cours...';
            btn.style.opacity = '0.7';

            setTimeout(() => {
                btn.innerText = 'Message Envoyé !';
                btn.style.backgroundColor = 'var(--accent-cyan)';
                btn.style.color = 'var(--bg-dark)';

                setTimeout(() => {
                    form.reset();
                    btn.innerText = originalText;
                    btn.style.backgroundColor = '';
                    btn.style.color = '';
                    btn.style.opacity = '1';
                }, 3000);
            }, 1500);
        });
    }

});
