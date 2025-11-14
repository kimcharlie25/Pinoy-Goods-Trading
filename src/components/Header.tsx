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
      <div className="max-w-7xl mx-auto px-3 sm:px-4 md:px-6 lg:px-8">
        <div className="flex items-center h-16 gap-2 sm:gap-4">
          <button 
            onClick={onMenuClick}
            className="flex items-center space-x-2 sm:space-x-3 text-white hover:opacity-90 transition-opacity duration-200 flex-shrink-0 min-w-0"
          >
            {loading ? (
              <div className="w-8 h-8 sm:w-10 sm:h-10 bg-brand-400 rounded-lg animate-pulse flex-shrink-0" />
            ) : (
              <img 
                src={siteSettings?.site_logo || "/logo.jpg"} 
                alt={siteSettings?.site_name || "Beracah Cafe"}
                className="w-8 h-8 sm:w-10 sm:h-10 rounded-lg object-cover border-2 border-white/20 flex-shrink-0"
                onError={(e) => {
                  e.currentTarget.src = "/logo.jpg";
                }}
              />
            )}
            <h1 className="text-base sm:text-xl lg:text-2xl font-bold tracking-tight truncate max-w-[120px] sm:max-w-none">
              {loading ? (
                <div className="w-24 sm:w-32 h-5 sm:h-7 bg-brand-400 rounded animate-pulse" />
              ) : (
                siteSettings?.site_name || "Beracah Cafe"
              )}
            </h1>
          </button>
          
          <nav className="hidden md:flex items-center gap-1 flex-1 min-w-0 overflow-x-auto scrollbar-hide">
            {categoriesLoading ? (
              <div className="flex gap-2">
                {[1, 2, 3, 4].map((i) => (
                  <div key={i} className="w-20 h-8 bg-brand-400 rounded-lg animate-pulse flex-shrink-0" />
                ))}
              </div>
            ) : (
              <>
                <button
                  onClick={() => onCategoryClick?.('all')}
                  className={`px-3 py-2 rounded-lg font-medium transition-all duration-200 whitespace-nowrap flex-shrink-0 ${
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
                    className={`flex items-center gap-2 px-3 py-2 rounded-lg font-medium transition-all duration-200 whitespace-nowrap flex-shrink-0 ${
                      selectedCategory === category.id
                        ? 'bg-white text-brand-500 shadow-md'
                        : 'text-white hover:bg-brand-600'
                    }`}
                  >
                    <span className="text-base">{category.icon}</span>
                    <span className="text-sm">{category.name}</span>
                  </button>
                ))}
              </>
            )}
          </nav>

          <div className="flex items-center gap-1 sm:gap-2 flex-shrink-0 ml-auto">
            <button 
              onClick={onOrderTrackingClick}
              className="flex items-center justify-center p-2 sm:p-2.5 text-white hover:bg-brand-600 rounded-lg transition-all duration-200 flex-shrink-0"
              title="Track Order"
            >
              <Package className="h-5 w-5 sm:h-5 sm:w-5" />
            </button>
            <button 
              onClick={onCartClick}
              className="relative p-2 sm:p-2.5 text-white hover:bg-brand-600 rounded-lg transition-all duration-200 flex-shrink-0"
              title="Shopping Cart"
            >
              <ShoppingCart className="h-5 w-5 sm:h-6 sm:w-6" />
              {cartItemsCount > 0 && (
                <span className="absolute -top-1 -right-1 bg-white text-brand-500 text-xs font-bold rounded-full h-5 w-5 sm:h-6 sm:w-6 flex items-center justify-center shadow-lg animate-bounce-gentle">
                  {cartItemsCount > 99 ? '99+' : cartItemsCount}
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