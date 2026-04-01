# Supply Chain Performance Dashboard

A professional React-based analytics dashboard for visualizing supply chain data with KPIs, charts, and detailed tables.

## Features

- **Dashboard Page**: KPI cards, revenue charts, sales trends, shipping costs, and recent sales table
- **Inventory Page**: Stock level tracking with availability status and low-stock alerts
- **Suppliers Page**: Supplier performance metrics, lead times, and reliability scores
- **Shipping Page**: Shipment tracking, carrier analysis, and delivery metrics
- **Pipeline Page**: Data flow visualization and database schema documentation
- **Responsive Design**: Works seamlessly on desktop, tablet, and mobile devices
- **Modern UI**: Clean design with slate blue and teal color scheme

## Tech Stack

- **React 19**: UI framework
- **Vite**: Fast build tool and dev server
- **Tailwind CSS 4**: Utility-first CSS framework
- **Recharts**: Interactive charts and visualizations
- **Wouter**: Lightweight client-side routing
- **Lucide React**: Icon library

## Prerequisites

- Node.js 16+ (recommended: 18+)
- npm or yarn package manager

## Installation

1. **Clone or download the project**
   ```bash
   cd supply-chain-dashboard
   ```

2. **Install dependencies**
   ```bash
   npm install
   ```

3. **Start the development server**
   ```bash
   npm run dev
   ```

4. **Open in browser**
   - The app will automatically open at `http://localhost:3000`
   - If not, manually navigate to `http://localhost:3000`

## Project Structure

```
supply-chain-dashboard/
├── index.html                 # HTML entry point
├── package.json              # Project dependencies
├── vite.config.js            # Vite configuration
├── tailwind.config.js        # Tailwind CSS configuration
├── postcss.config.js         # PostCSS configuration
├── src/
│   ├── main.jsx              # React entry point
│   ├── App.jsx               # Main router component
│   ├── index.css             # Global styles
│   ├── components/
│   │   └── DashboardLayout.jsx    # Sidebar layout wrapper
│   ├── pages/
│   │   ├── Dashboard.jsx     # Main dashboard page
│   │   ├── Inventory.jsx     # Inventory management page
│   │   ├── Suppliers.jsx     # Supplier management page
│   │   ├── Shipping.jsx      # Shipping management page
│   │   └── Pipeline.jsx      # Data pipeline visualization
│   └── data/
│       └── mockData.js       # Mock supply chain data
└── .gitignore                # Git ignore rules
```

## Available Scripts

### Development
```bash
npm run dev
```
Starts the development server with hot module replacement (HMR).

### Build
```bash
npm run build
```
Creates an optimized production build in the `dist/` directory.

### Preview
```bash
npm run preview
```
Previews the production build locally.

## Mock Data

The dashboard uses mock data stored in `src/data/mockData.js`. This includes:

- **KPI Data**: Revenue, units sold, products, suppliers
- **Revenue by Product**: Electronics, textiles, machinery, chemicals, packaging
- **Sales Trends**: Monthly sales and revenue data
- **Inventory**: 8 SKUs with stock levels and availability status
- **Suppliers**: 6 suppliers with lead times and reliability scores
- **Shipping**: 5 shipment records with carrier and cost information

To connect to a real backend, replace the mock data imports with API calls.

## Customization

### Change Colors

Edit `tailwind.config.js` to modify the color scheme:

```javascript
theme: {
  extend: {
    colors: {
      primary: '#1F3A5F',    // Slate blue
      accent: '#00D9FF',     // Teal
    },
  },
},
```

### Add New Pages

1. Create a new file in `src/pages/`
2. Wrap content with `<DashboardLayout>`
3. Add route in `src/App.jsx`

### Update Mock Data

Edit `src/data/mockData.js` to modify or add data.

## Browser Support

- Chrome (latest)
- Firefox (latest)
- Safari (latest)
- Edge (latest)

## Troubleshooting

### Port 3000 already in use
```bash
# Kill the process or use a different port
npm run dev -- --port 3001
```

### Dependencies not installing
```bash
# Clear npm cache and reinstall
npm cache clean --force
rm -rf node_modules package-lock.json
npm install
```

### Styles not loading
```bash
# Restart the dev server
npm run dev
```

## Performance

- Optimized bundle size with code splitting
- Fast development server with Vite
- Efficient rendering with React 19
- Responsive charts with Recharts

## License

MIT

## Support

For issues or questions, refer to the documentation or create an issue in the repository.
