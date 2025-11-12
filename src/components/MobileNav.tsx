import React from 'react';
import { useCategories } from '../hooks/useCategories';

interface MobileNavProps {
  activeCategory: string;
  onCategoryClick: (categoryId: string) => void;
}

const MobileNav: React.FC<MobileNavProps> = ({ activeCategory, onCategoryClick }) => {
  const { categories } = useCategories();

  return (
    <div className="sticky top-16 z-40 bg-white shadow-md md:hidden">
      <div className="flex overflow-x-auto scrollbar-hide px-4 py-3 space-x-2">
        <button
          onClick={() => onCategoryClick('all')}
          className={`flex-shrink-0 px-5 py-2.5 rounded-lg font-medium transition-all duration-200 ${
            activeCategory === 'all' || !activeCategory
              ? 'bg-brand-500 text-white shadow-brand'
              : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
          }`}
        >
          All
        </button>
        {categories.map((category) => (
          <button
            key={category.id}
            onClick={() => onCategoryClick(category.id)}
            className={`flex-shrink-0 flex items-center space-x-2 px-5 py-2.5 rounded-lg font-medium transition-all duration-200 ${
              activeCategory === category.id
                ? 'bg-brand-500 text-white shadow-brand'
                : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
            }`}
          >
            <span className="text-lg">{category.icon}</span>
            <span className="text-sm whitespace-nowrap">{category.name}</span>
          </button>
        ))}
      </div>
    </div>
  );
};

export default MobileNav;