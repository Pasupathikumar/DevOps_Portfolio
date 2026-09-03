/* ========================================
   DOM READY
======================================== */
document.addEventListener("DOMContentLoaded", () => {

    setExperienceCount();
    initProjectScroll();
    initScrollAnimations();
    initScrollTopButton();

});


/* ========================================
   EXPERIENCE COUNT (Dynamic Layout)
======================================== */
function setExperienceCount() {
    const experienceRow = document.querySelector('.experience-row');

    if (!experienceRow) return;

    const count = experienceRow.children.length;

    // fallback to minimum 1
    experienceRow.style.setProperty('--exp-count', count || 1);
}


/* ========================================
   PROJECT SCROLL (WITH BUTTON CONTROL)
======================================== */
function initProjectScroll() {
    const container = document.getElementById("projectScroll");

    if (!container) return;

    window.scrollProjects = function (direction) {
        const scrollAmount = container.offsetWidth * 0.8;

        container.scrollBy({
            left: direction * scrollAmount,
            behavior: "smooth"
        });
    };
}


/* ========================================
   SCROLL ANIMATION (FADE-IN)
======================================== */
function initScrollAnimations() {
    const elements = document.querySelectorAll(".fade-in");

    if (!elements.length) return;

    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add("show");
            }
        });
    }, {
        threshold: 0.2
    });

    elements.forEach(el => observer.observe(el));
}


/* ========================================
   SCROLL TO TOP BUTTON
======================================== */
function initScrollTopButton() {
    const btn = document.getElementById("scrollTopBtn");

    if (!btn) return;

    window.addEventListener("scroll", () => {
        btn.style.display = window.scrollY > 300 ? "block" : "none";
    });

    btn.addEventListener("click", () => {
        window.scrollTo({
            top: 0,
            behavior: "smooth"
        });
    });
}