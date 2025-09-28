import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import {
  FaTachometerAlt, FaBox, FaUsers, FaWarehouse,
  FaChartBar, FaBars, FaSignOutAlt, FaPlus,
  FaChevronDown, FaChevronUp, FaTimes,
  FaUserCircle, FaFileInvoice
} from 'react-icons/fa';
import ProductsAdd from '../DashboardComponents/ProductsAdd';
import ProductsView from '../DashboardComponents/ProductsView';
import Categories from '../DashboardComponents/Categories';
import UserAdd from '../DashboardComponents/UserAdd';
import UserView from '../DashboardComponents/UserView';
import Reports from '../DashboardComponents/Reports';
import CreateOrder from '../DashboardComponents/CreateOrder';
import DeliveriesManagement from '../InventoryComponents/DeliveriesManagement';
import SalesTracking from '../InventoryComponents/SalesTracking';
import UpdateStock from '../InventoryComponents/UpdateStock';
import Invoice from '../InvoicesComponents/Invoice';
import CreateInvoice from '../InvoicesComponents/CreateInvoice';
import ManageInvoices from '../InvoicesComponents/ManageInvoices';
import ViewLedgers from '../LedgerComponents/ViewLedgers';
import SupplierView from '../DashboardComponents/SupplierView';
import SupplierAdd from '../DashboardComponents/SupplierAdd';
import Reportspass from '../PassingComponentIntodashboard/Reportspass';

const COMPONENTS = {
  DASHBOARD: 'dashboard',
  PRODUCTS_ADD: 'productsAdd',
  PRODUCTS_VIEW: 'productsView',
  CATEGORIES: 'categories',
  ADD_USER: 'addUser',
  VIEW_USERS: 'viewUsers',
  REPORTS: 'reports',
  CREATE_ORDER: 'createOrder',
  DELIVERIES_MANAGEMENT: 'deliveriesManagement',
  SALES_TRACKING: 'salesTracking',
  STOCK_LEVELS: 'stockLevels',
  UPDATE_STOCK: 'updateStock',
  INVOICE: 'invoice',
  CREATE_INVOICE: 'createInvoice',
  MANAGE_INVOICE: 'manageInvoice',
  ViewLedgers: 'viewLedger',
  SUPPLIER_ADD: 'supplierAdd',      
  SUPPLIER_VIEW: 'supplierView'
};

const Dashboard = () => {
  const [isSidebarOpen, setIsSidebarOpen] = useState(true);
  const [isCollapsed, setIsCollapsed] = useState(false);
  const [activeComponent, setActiveComponent] = useState(COMPONENTS.DASHBOARD);
  const [isDarkMode, setIsDarkMode] = useState(false);
  const [isDropdownOpen, setIsDropdownOpen] = useState(false);
  const [isProductsOpen, setIsProductsOpen] = useState(false);
  const [isUsersOpen, setIsUsersOpen] = useState(false);
  const [isSupplierOpen, setIsSupplierOpen] = useState(false);
  const [isInventoryOpen, setIsInventoryOpen] = useState(false);
  const [isInvoiceOpen, setIsInvoiceOpen] = useState(false);
  const navigate = useNavigate();
  const [isLedgerOpen, setIsLedgerOpen] = useState(false);

  useEffect(() => {
    const handleResize = () => {
      if (window.innerWidth < 768) {
        setIsSidebarOpen(false);
        setIsCollapsed(false);
      } else {
        setIsSidebarOpen(true);
      }
    };
    window.addEventListener('resize', handleResize);
    handleResize();
    return () => window.removeEventListener('resize', handleResize);
  }, []);

  const toggleSidebar = () => {
    if (window.innerWidth < 768) {
      setIsSidebarOpen(!isSidebarOpen);
    } else {
      setIsCollapsed(!isCollapsed);
    }
  };

  const handleLogout = () => {
    navigate('/login');
    alert("logout Successful");
  };

  const toggleSupplierDropdown = () => {
    setIsSupplierOpen(!isSupplierOpen);
  };

  const toggleLedgerDropdown = () => {
    setIsLedgerOpen(!isLedgerOpen);
  };

  const handleSidebarClick = (component) => {
    setActiveComponent(component);
    if (window.innerWidth <= 768) {
      setIsSidebarOpen(false);
    }
  };

  const toggleProductsDropdown = () => {
    setIsProductsOpen(!isProductsOpen);
    setIsUsersOpen(false);
    setIsInventoryOpen(false);
    setIsInvoiceOpen(false);
  };

  const toggleUsersDropdown = () => {
    setIsUsersOpen(!isUsersOpen);
    setIsProductsOpen(false);
    setIsInventoryOpen(false);
    setIsInvoiceOpen(false);
  };

  const toggleInventoryDropdown = () => {
    setIsInventoryOpen(!isInventoryOpen);
    setIsProductsOpen(false);
    setIsUsersOpen(false);
    setIsInvoiceOpen(false);
  };

  const toggleInvoiceDropdown = () => {
    setIsInvoiceOpen(!isInvoiceOpen);
    setIsProductsOpen(false);
    setIsUsersOpen(false);
    setIsInventoryOpen(false);
  };

  const renderContent = () => {
    const components = {
      [COMPONENTS.PRODUCTS_ADD]: <ProductsAdd />,
      [COMPONENTS.PRODUCTS_VIEW]: <ProductsView />,
      [COMPONENTS.CATEGORIES]: <Categories />,
      [COMPONENTS.ADD_USER]: <UserAdd />,
      [COMPONENTS.VIEW_USERS]: <UserView />,
      [COMPONENTS.REPORTS]: <Reports />,
      [COMPONENTS.CREATE_ORDER]: <CreateOrder />,
      [COMPONENTS.DASHBOARD]: <Reportspass />,
      [COMPONENTS.DELIVERIES_MANAGEMENT]: <DeliveriesManagement />,
      [COMPONENTS.INVOICE]: <Invoice />,
      [COMPONENTS.ViewLedgers]: <ViewLedgers />,
      [COMPONENTS.CREATE_INVOICE]: <CreateInvoice/>,
      [COMPONENTS.MANAGE_INVOICE]: <ManageInvoices />,
      [COMPONENTS.SALES_TRACKING]: <SalesTracking />,
      [COMPONENTS.UPDATE_STOCK]: <UpdateStock />,
      [COMPONENTS.SUPPLIER_ADD]: <SupplierAdd />,
      [COMPONENTS.SUPPLIER_VIEW]: <SupplierView />
    };
    return components[activeComponent] || <div>Content not found</div>;
  };

  return (
    <div className={`flex h-screen ${isDarkMode ? 'dark' : ''}`}>
      {/* Overlay for mobile */}
      {isSidebarOpen && window.innerWidth < 768 && (
        <div 
          className="fixed inset-0 bg-black bg-opacity-50 z-10"
          onClick={() => setIsSidebarOpen(false)}
        />
      )}

      {/* Sidebar - Fixed width */}
      <div
        className={`fixed top-0 left-0 z-20 h-full bg-gradient-to-r from-green-400 to-blue-500 text-white transition-all duration-300 ease-in-out
          ${isSidebarOpen ? 'translate-x-0 w-64' : '-translate-x-full'} 
          md:translate-x-0 ${isCollapsed ? 'md:w-20' : 'md:w-64'}`}
      >
        <div className="flex items-center justify-between p-4 h-16 border-b border-blue-600">
          {!isCollapsed && <h2 className="text-xl font-semibold whitespace-nowrap">ANU FISH BROKER</h2>}
          <button
            onClick={toggleSidebar}
            className="p-2 rounded-lg hover:bg-blue-700 transition-colors"
          >
            {window.innerWidth < 768 ? (
              <FaTimes className="text-xl" />
            ) : (
              isCollapsed ? <FaBars className="text-xl" /> : <FaTimes className="text-xl" />
            )}
          </button>
        </div>
        
        <ul className="flex flex-col h-[calc(100%-4rem)] overflow-y-auto p-2">
          {/* Dashboard */}
          <li className="mb-2">
            <button
              onClick={() => handleSidebarClick(COMPONENTS.DASHBOARD)}
              className={`flex items-center p-3 rounded-lg hover:bg-blue-600 w-full transition-colors ${
                activeComponent === COMPONENTS.DASHBOARD ? 'bg-blue-700' : ''
              }`}
            >
              <FaTachometerAlt className="text-xl min-w-[20px]" />
              {!isCollapsed && <span className="ml-3 whitespace-nowrap">Dashboard</span>}
            </button>
          </li>

          {/* Invoice Dropdown */}
          <li className="mb-2">
            <button
              className={`flex items-center p-3 rounded-lg hover:bg-blue-600 w-full transition-colors ${
                activeComponent.includes('invoice') ? 'bg-blue-700' : ''
              }`}
              onClick={toggleInvoiceDropdown}
            >
              <FaFileInvoice className="text-xl min-w-[20px]" />
              {!isCollapsed && (
                <>
                  <span className="ml-3 whitespace-nowrap">Invoice</span>
                  {isInvoiceOpen ? (
                    <FaChevronUp className="ml-auto" />
                  ) : (
                    <FaChevronDown className="ml-auto" />
                  )}
                </>
              )}
            </button>
            {isInvoiceOpen && !isCollapsed && (
              <ul className="pl-2 mt-1 space-y-1">
                <li>
                  <button
                    className="flex items-center p-2 pl-10 rounded-lg hover:bg-blue-500 w-full transition-colors"
                    onClick={() => handleSidebarClick(COMPONENTS.CREATE_INVOICE)}
                  >
                    Create Invoice
                  </button>
                </li>
                <li>
                  <button
                    className="flex items-center p-2 pl-10 rounded-lg hover:bg-blue-500 w-full transition-colors"
                    onClick={() => handleSidebarClick(COMPONENTS.MANAGE_INVOICE)}
                  >
                    Manage Invoice
                  </button>
                </li>
              </ul>
            )}
          </li>

          {/* Ledger Dropdown */}
          <li className="mb-2">
            <button
              className={`flex items-center p-3 rounded-lg hover:bg-blue-600 w-full transition-colors ${
                activeComponent === COMPONENTS.ViewLedgers ? 'bg-blue-700' : ''
              }`}
              onClick={toggleLedgerDropdown}
            >
              <FaFileInvoice className="text-xl min-w-[20px]" />
              {!isCollapsed && (
                <>
                  <span className="ml-3 whitespace-nowrap">Ledger</span>
                  {isLedgerOpen ? (
                    <FaChevronUp className="ml-auto" />
                  ) : (
                    <FaChevronDown className="ml-auto" />
                  )}
                </>
              )}
            </button>
            {isLedgerOpen && !isCollapsed && (
              <ul className="pl-2 mt-1 space-y-1">
                <li>
                  <button
                    className="flex items-center p-2 pl-10 rounded-lg hover:bg-blue-500 w-full transition-colors"
                    onClick={() => handleSidebarClick(COMPONENTS.ViewLedgers)}
                  >
                    View Ledgers
                  </button>
                </li>
              </ul>
            )}
          </li>

          {/* Products Dropdown */}
          <li className="mb-2">
            <button
              className={`flex items-center p-3 rounded-lg hover:bg-blue-600 w-full transition-colors ${
                activeComponent.includes('product') ? 'bg-blue-700' : ''
              }`}
              onClick={toggleProductsDropdown}
            >
              <FaBox className="text-xl min-w-[20px]" />
              {!isCollapsed && (
                <>
                  <span className="ml-3 whitespace-nowrap">Products</span>
                  {isProductsOpen ? (
                    <FaChevronUp className="ml-auto" />
                  ) : (
                    <FaChevronDown className="ml-auto" />
                  )}
                </>
              )}
            </button>
            {isProductsOpen && !isCollapsed && (
              <ul className="pl-2 mt-1 space-y-1">
                <li>
                  <button
                    className="flex items-center p-2 pl-10 rounded-lg hover:bg-blue-500 w-full transition-colors"
                    onClick={() => handleSidebarClick(COMPONENTS.PRODUCTS_ADD)}
                  >
                    <FaPlus className="mr-2" />
                    Add Product
                  </button>
                </li>
                <li>
                  <button
                    className="flex items-center p-2 pl-10 rounded-lg hover:bg-blue-500 w-full transition-colors"
                    onClick={() => handleSidebarClick(COMPONENTS.PRODUCTS_VIEW)}
                  >
                    View Products
                  </button>
                </li>
              </ul>
            )}
          </li>

          {/* Users Dropdown */}
          <li className="mb-2">
            <button
              className={`flex items-center p-3 rounded-lg hover:bg-blue-600 w-full transition-colors ${
                activeComponent.includes('user') ? 'bg-blue-700' : ''
              }`}
              onClick={toggleUsersDropdown}
            >
              <FaUsers className="text-xl min-w-[20px]" />
              {!isCollapsed && (
                <>
                  <span className="ml-3 whitespace-nowrap">Users</span>
                  {isUsersOpen ? (
                    <FaChevronUp className="ml-auto" />
                  ) : (
                    <FaChevronDown className="ml-auto" />
                  )}
                </>
              )}
            </button>
            {isUsersOpen && !isCollapsed && (
              <ul className="pl-2 mt-1 space-y-1">
                <li>
                  <button
                    className="flex items-center p-2 pl-10 rounded-lg hover:bg-blue-500 w-full transition-colors"
                    onClick={() => handleSidebarClick(COMPONENTS.ADD_USER)}
                  >
                    Add User
                  </button>
                </li>
                <li>
                  <button
                    className="flex items-center p-2 pl-10 rounded-lg hover:bg-blue-500 w-full transition-colors"
                    onClick={() => handleSidebarClick(COMPONENTS.VIEW_USERS)}
                  >
                    View Users
                  </button>
                </li>
              </ul>
            )}
          </li>

          {/* Supplier Dropdown */}
          <li className="mb-2">
            <button
              className={`flex items-center p-3 rounded-lg hover:bg-blue-600 w-full transition-colors ${
                activeComponent.includes('supplier') ? 'bg-blue-700' : ''
              }`}
              onClick={toggleSupplierDropdown}
            >
              <FaUserCircle className="text-xl min-w-[20px]" />
              {!isCollapsed && (
                <>
                  <span className="ml-3 whitespace-nowrap">Suppliers</span>
                  {isSupplierOpen ? (
                    <FaChevronUp className="ml-auto" />
                  ) : (
                    <FaChevronDown className="ml-auto" />
                  )}
                </>
              )}
            </button>
            {isSupplierOpen && !isCollapsed && (
              <ul className="pl-2 mt-1 space-y-1">
                <li>
                  <button
                    className="flex items-center p-2 pl-10 rounded-lg hover:bg-blue-500 w-full transition-colors"
                    onClick={() => handleSidebarClick(COMPONENTS.SUPPLIER_ADD)}
                  >
                    <FaPlus className="mr-2" />
                    Add Supplier
                  </button>
                </li>
                <li>
                  <button
                    className="flex items-center p-2 pl-10 rounded-lg hover:bg-blue-500 w-full transition-colors"
                    onClick={() => handleSidebarClick(COMPONENTS.SUPPLIER_VIEW)}
                  >
                    View Suppliers
                  </button>
                </li>
              </ul>
            )}
          </li>

          {/* Inventory Dropdown */}
          <li className="mb-2">
            <button
              className={`flex items-center p-3 rounded-lg hover:bg-blue-600 w-full transition-colors ${
                activeComponent.includes('inventory') ? 'bg-blue-700' : ''
              }`}
              onClick={toggleInventoryDropdown}
            >
              <FaWarehouse className="text-xl min-w-[20px]" />
              {!isCollapsed && (
                <>
                  <span className="ml-3 whitespace-nowrap">Inventory</span>
                  {isInventoryOpen ? (
                    <FaChevronUp className="ml-auto" />
                  ) : (
                    <FaChevronDown className="ml-auto" />
                  )}
                </>
              )}
            </button>
            {isInventoryOpen && !isCollapsed && (
              <ul className="pl-2 mt-1 space-y-1">
                <li>
                  <button
                    className="flex items-center p-2 pl-10 rounded-lg hover:bg-blue-500 w-full transition-colors"
                    onClick={() => handleSidebarClick(COMPONENTS.DELIVERIES_MANAGEMENT)}
                  >
                    Deliveries Management
                  </button>
                </li>
                <li>
                  <button
                    className="flex items-center p-2 pl-10 rounded-lg hover:bg-blue-500 w-full transition-colors"
                    onClick={() => handleSidebarClick(COMPONENTS.SALES_TRACKING)}
                  >
                    Sales Tracking
                  </button>
                </li>
                <li>
                  <button
                    className="flex items-center p-2 pl-10 rounded-lg hover:bg-blue-500 w-full transition-colors"
                    onClick={() => handleSidebarClick(COMPONENTS.UPDATE_STOCK)}
                  >
                    Update Stock
                  </button>
                </li>
              </ul>
            )}
          </li>

          {/* Reports */}
          <li className="mb-2">
            <button
              onClick={() => handleSidebarClick(COMPONENTS.REPORTS)}
              className={`flex items-center p-3 rounded-lg hover:bg-blue-600 w-full transition-colors ${
                activeComponent === COMPONENTS.REPORTS ? 'bg-blue-700' : ''
              }`}
            >
              <FaChartBar className="text-xl min-w-[20px]" />
              {!isCollapsed && <span className="ml-3 whitespace-nowrap">Reports</span>}
            </button>
          </li>

          {/* Logout */}
          <li className="mt-auto">
            <button
              onClick={handleLogout}
              className="flex items-center p-3 rounded-lg hover:bg-blue-600 w-full transition-colors"
            >
              <FaSignOutAlt className="text-xl min-w-[20px]" />
              {!isCollapsed && <span className="ml-3 whitespace-nowrap">Logout</span>}
            </button>
          </li>
        </ul>
      </div>

      {/* Main Content - Fixed width */}
      <div
        className={`flex-1 h-screen overflow-y-auto transition-all duration-300 ease-in-out bg-gradient-to-r from-teal-200 via-indigo-200 to-pink-200
          ${isSidebarOpen ? 'ml-64' : 'ml-0'} 
          ${isCollapsed ? 'md:ml-20' : 'md:ml-64'}`}
      >
        {/* Mobile header */}
        {!isSidebarOpen && (
          <div className="md:hidden p-4 bg-white shadow-sm">
            <button
              className="p-2 rounded-lg bg-blue-600 text-white"
              onClick={() => setIsSidebarOpen(true)}
            >
              <FaBars className="text-xl" />
            </button>
          </div>
        )}
        
        {/* Content */}
        <div className="p-6">
          {renderContent()}
        </div>
      </div>
    </div>
  );
};

export default Dashboard;