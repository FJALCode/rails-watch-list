import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Enjoy", "Have Fun", "Share"],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };

// export { initTyped };
