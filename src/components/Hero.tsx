import React from 'react';

const Hero: React.FC = () => {
  return (
    <section className="relative bg-gradient-to-br from-brand-50 via-white to-blue-50 py-24 px-4">
      <div className="max-w-4xl mx-auto text-center">
        <div className="inline-block px-4 py-2 bg-brand-100 text-brand-600 rounded-full text-sm font-semibold mb-6 animate-fade-in">
          🍽️ Premium Quality Food
        </div>
        <h1 className="text-5xl md:text-7xl font-bold text-gray-900 mb-6 animate-fade-in leading-tight">
          Authentic Taiwanese
          <span className="block text-brand-500 mt-2">Dimsum</span>
        </h1>
        <p className="text-xl md:text-2xl text-gray-600 mb-10 max-w-2xl mx-auto animate-slide-up font-light">
          Timeless Taiwanese Flavors, Freshly Made Every Day
        </p>
        <div className="flex justify-center gap-4">
          <a 
            href="#menu"
            className="bg-brand-500 text-white px-8 py-4 rounded-xl hover:bg-brand-600 transition-all duration-300 transform hover:scale-105 font-semibold shadow-brand-lg hover:shadow-brand text-lg"
          >
            Explore Menu
          </a>
          <a 
            href="#menu"
            className="bg-white text-brand-500 px-8 py-4 rounded-xl hover:bg-gray-50 transition-all duration-300 font-semibold border-2 border-brand-500 text-lg"
          >
            Order Now
          </a>
        </div>
      </div>
    </section>
  );
};

export default Hero;