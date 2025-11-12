import React from 'react';
import { ShoppingCart, Package } from 'lucide-react';
import { useSiteSettings } from '../hooks/useSiteSettings';
import { useCategories } from '../hooks/useCategories';

interface HeaderProps {
  cartItemsCount: number;
  onCartClick: () => void;
  onMenuClick: () => void;
  onOrderTrackingClick?: () => void;
  onCategoryClick?: (categoryId: string) => void;
  selectedCategory?: string;
}

const Header: React.FC<HeaderProps> = ({ cartItemsCount, onCartClick, onMenuClick, onOrderTrackingClick, onCategoryClick, selectedCategory }) => {
  const { siteSettings, loading } = useSiteSettings();
  const { categories, loading: categoriesLoading } = useCategories();

  return (
    <header className="sticky top-0 z-50 bg-brand-500 shadow-brand-lg">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="flex items-center justify-between h-16">
          <button 
            onClick={onMenuClick}
            className="flex items-center space-x-3 text-white hover:opacity-90 transition-opacity duration-200"
          >
            {loading ? (
              <div className="w-10 h-10 bg-brand-400 rounded-lg animate-pulse" />
            ) : (
              <img 
                src={siteSettings?.site_logo || "/logo.jpg"} 
                alt={siteSettings?.site_name || "Beracah Cafe"}
                className="w-10 h-10 rounded-lg object-cover border-2 border-white/20"
                onError={(e) => {
                  e.currentTarget.src = "/logo.jpg";
                }}
              />
            )}
            <h1 className="text-2xl font-bold tracking-tight">
              {loading ? (
                <div className="w-32 h-7 bg-brand-400 rounded animate-pulse" />
              ) : (
                siteSettings?.site_name || "Beracah Cafe"
              )}
            </h1>
          </button>
          
          <nav className="hidden md:flex items-center space-x-1">
            {categoriesLoading ? (
              <div className="flex space-x-2">
                {[1, 2, 3, 4].map((i) => (
                  <div key={i} className="w-20 h-8 bg-brand-400 rounded-lg animate-pulse" />
                ))}
              </div>
            ) : (
              <>
                <button
                  onClick={() => onCategoryClick?.('all')}
                  className={`px-4 py-2 rounded-lg font-medium transition-all duration-200 ${
                    selectedCategory === 'all' || !selectedCategory
                      ? 'bg-white text-brand-500 shadow-md'
                      : 'text-white hover:bg-brand-600'
                  }`}
                >
                  All
                </button>
                {categories.map((category) => (
                  <button
                    key={category.id}
                    onClick={() => onCategoryClick?.(category.id)}
                    className={`flex items-center space-x-2 px-4 py-2 rounded-lg font-medium transition-all duration-200 ${
                      selectedCategory === category.id
                        ? 'bg-white text-brand-500 shadow-md'
                        : 'text-white hover:bg-brand-600'
                    }`}
                  >
                    <span className="text-lg">{category.icon}</span>
                    <span>{category.name}</span>
                  </button>
                ))}
              </>
            )}
          </nav>

          <div className="flex items-center space-x-2">
            <button 
              onClick={onOrderTrackingClick}
              className="flex items-center gap-2 px-4 py-2 text-white hover:bg-brand-600 rounded-lg transition-all duration-200 text-sm font-medium"
            >
              <Package className="h-5 w-5" />
              <span className="hidden sm:inline">Track Order</span>
            </button>
            <button 
              onClick={onCartClick}
              className="relative p-2.5 text-white hover:bg-brand-600 rounded-lg transition-all duration-200"
            >
              <ShoppingCart className="h-6 w-6" />
              {cartItemsCount > 0 && (
                <span className="absolute -top-1 -right-1 bg-white text-brand-500 text-xs font-bold rounded-full h-6 w-6 flex items-center justify-center shadow-lg animate-bounce-gentle">
                  {cartItemsCount}
                </span>
              )}
            </button>
          </div>
        </div>
      </div>
    </header>
  );
};

export default Header;