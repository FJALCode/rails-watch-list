import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Enjoy", "Have Fun", "Shared"],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };