// Toggle menu

const toggle = document.querySelector('.menu-toggle');
const body = document.querySelector('body');

toggle.addEventListener('click',function(){
  body.classList.toggle('show-menu');
});

// activate contact links
const respondLinks = document.querySelectorAll('a[href="#respond"]');
const closeLinks = document.querySelectorAll('a[href="#close"]');

respondLinks.forEach((link) => {
    link.addEventListener('click', (e) => {
        e.preventDefault();
        body.classList.add('show-overlay');
    });
});

closeLinks.forEach((link) => {
    link.addEventListener('click', (e) => {
        e.preventDefault();
        body.classList.remove('show-overlay');
    });
});