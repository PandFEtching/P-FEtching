# P&F Etching - Dropship Store

A complete, self-contained web store that runs on GitHub Pages. No server needed!

## Quick Setup (3 Steps)

### Step 1: Create GitHub Repo
1. Go to [github.com/new](https://github.com/new)
2. Name it `webstore` (or any name)
3. Make it **Public**
4. Click "Create repository"

### Step 2: Upload Files
Run these commands in your terminal:

```bash
cd C:\Users\lexan\Documents\webstore
git init
git add .
git commit -m "Initial store setup"
git remote add origin https://github.com/YOUR_USERNAME/webstore.git
git push -u origin main
```

### Step 3: Enable GitHub Pages
1. Go to your repo on GitHub
2. Settings → Pages (left sidebar)
3. Source: **Deploy from a branch**
4. Branch: **main** / (root)
5. Click **Save**
6. Wait 2 minutes, then visit: `https://YOUR_USERNAME.github.io/webstore`

## Store URL
Your store will be live at:
```
https://YOUR_USERNAME.github.io/webstore
```

Admin panel:
```
https://YOUR_USERNAME.github.io/webstore/admin.html
```

---

## Adding Products

### Method 1: Admin Panel (Easiest)
1. Open `admin.html` in your browser
2. First time: Set your admin password in Settings
3. Click **"Add New Product"**
4. Fill in details, click **Save Product**
5. **Download the updated inventory.json**
6. Upload it to GitHub (see updating below)

### Method 2: Edit JSON Directly
Edit `inventory.json`:

```json
{
  "products": [
    {
      "id": 1,
      "name": "Your Product Name",
      "description": "Size, material, etc",
      "price": 25,
      "cost": 10,
      "image": "your-product.jpg",
      "category": "coasters",
      "supplier": "Your Supplier",
      "stock": 999,
      "active": true
    }
  ],
  "settings": {
    "storename": "Your Store Name",
    "tagline": "Your Tagline",
    "venmo": "your-venmo-username",
    "email": "your@email.com",
    "phone": "555-123-4567"
  },
  "blankProducts": []
}
```

---

## Adding Product Images

1. Put images in the `images/` folder
2. Reference them in `inventory.json` (without `images/` prefix):
   - `"image": "tumbleweed.jpg"` loads `images/tumbleweed.jpg`
3. Commit and push to GitHub

**Tip:** Use small file sizes (<500KB) for faster loading.

---

## Updating Your Store

After any change, push to GitHub:

```bash
git add .
git commit -m "Updated products"
git push
```

Changes go live in ~2 minutes.

---

## Features

- **Storefront** (`index.html`) - Customer shopping view
- **Admin Panel** (`admin.html`) - Manage products, settings
- **Inventory** (`inventory.json`) - Product database
- **Cart** - Venmo checkout flow
- **Categories** - Filter products
- **Blank Products** - Let customers upload custom photos
- **AI Tools** - Generate themes and descriptions (needs OpenRouter API key)
- **Cloud Sync** - Access inventory from any device
- **Analytics** - Track visits and popular products

---

## Customization

Edit `inventory.json` settings:

```json
"settings": {
  "storename": "Your Brand",
  "tagline": "What you sell",
  "venmo": "@your-venmo",
  "paypal": "your-paypal@email.com",
  "email": "contact@yourdomain.com",
  "phone": "555-123-4567",
  "processingTime": "3-5 business days",
  "shippingNotes": "Free shipping over $50",
  "socialInstagram": "https://instagram.com/yourpage"
}
```

---

## Troubleshooting

**Store shows "No products available"**
- Check `inventory.json` is valid JSON
- Make sure product has `"active": true`

**Images not showing**
- Check image filename matches in `inventory.json`
- Verify image is in `images/` folder
- GitHub Pages is case-sensitive: use lowercase filenames

**Admin login not working**
- Clear browser localStorage and try again
- Check you set a password in Settings

**Changes not showing**
- Wait 2 minutes for GitHub Pages to update
- Hard refresh: Ctrl+Shift+R

---

## File Structure

```
webstore/
├── index.html          (Customer store - don't edit)
├── admin.html         (Admin panel - don't edit)
├── inventory.json     (YOUR product database - edit this)
├── images/            (Product images go here)
│   └── cross-with-wings.svg
└── README.md          (This file)
```