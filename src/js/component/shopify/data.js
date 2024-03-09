import Alpine from "alpinejs";
import Client from "shopify-buy";

export default () => ({
  _client: null,
  _checkout: null,

  async init() {
    this._client = this._buildClient();
    this._checkout = await this._fetchCheckout();

    this._refreshStore();
  },

  _buildClient() {
    return Client.buildClient({
      apiVersion: "2024-01",
      domain: import.meta.env.VITE_SHOPIFY_HOSTNAME,
      storefrontAccessToken: import.meta.env.VITE_SHOPIFY_STOREFRONT_API_TOKEN
    });
  },

  _refreshStore() {
    const checkout = Alpine.raw(this._checkout);
    const store = Alpine.store('cart');

    store.setQuantity(this.getCartQuantity());
  },

  async _fetchCheckout(storageKey = "checkoutId") {
    const id = localStorage.getItem(storageKey);

    if (!id) {
      return await this._createCheckout(storageKey);
    }

    const checkout = await this._client.checkout.fetch(id);

    if (checkout.completedAt) {
      return await this._createCheckout(storageKey);
    }

    return checkout;
  },

  async _createCheckout(storageKey = "checkoutId") {
    return await this._client.checkout.create()
      .then((checkout) => {
        localStorage.setItem(storageKey, checkout.id);
        return checkout;
      })
      .catch((err) => console.error("Failed to create checkout: ", err));
  },

  get checkoutUrl() {
    if (!this._checkout) {
      return null;
    }
    const checkout = Alpine.raw(this._checkout);
    return checkout.webUrl;
  },

  get subtotalPrice() {
    if (!this._checkout) {
      return this.formatCurrency(0);
    }
    const checkout = Alpine.raw(this._checkout);
    return this.formatCurrency(checkout.subtotalPriceV2.amount, checkout.subtotalPriceV2.currencyCode);
  },

  get totalPrice() {
    if (!this._checkout) {
      return this.formatCurrency(0);
    }
    const checkout = Alpine.raw(this._checkout);
    return this.formatCurrency(checkout.totalPriceV2.amount, checkout.totalPriceV2.currencyCode);
  },

  get totalTax() {
    if (!this._checkout) {
      return this.formatCurrency(0);
    }
    const checkout = Alpine.raw(this._checkout);
    return this.formatCurrency(checkout.totalTaxV2.amount, checkout.totalTaxV2.currencyCode);
  },

  get lineItems() {
    if (!this._checkout) {
      return [];
    }
    const checkout = Alpine.raw(this._checkout);
    return checkout.lineItems;
  },

  getCartQuantity() {
    if (!this._checkout) {
      return 0;
    }
    const checkout = Alpine.raw(this._checkout);
    return checkout.lineItems.reduce((acc, item) => acc + item.quantity, 0);
  },

  updateCheckout(checkout) {
    this._checkout = checkout;
    this._refreshStore();
  },

  formatCurrency(amount, currency = "USD") {
    return new Intl.NumberFormat("en-US", {
      style: "currency",
      currency: currency
    }).format(amount);
  },

  addLine(variantId, quantity = 1) {
    const checkout = Alpine.raw(this._checkout);
    const client = Alpine.raw(this._client);

    const payload = [{ variantId: `gid://shopify/ProductVariant/${variantId}`, quantity }];

    client.checkout.addLineItems(checkout.id, payload)
      .then((checkout) => this.updateCheckout(checkout))
      .catch((err) => console.error("Failed to add item to cart: " + err, payload));
  },

  updateLine(lineId, quantity) {
    const checkout = Alpine.raw(this._checkout);
    const client = Alpine.raw(this._client);

    const payload = [{ id: lineId, quantity: parseInt(quantity) }];

    client.checkout.updateLineItems(checkout.id, payload)
      .then((checkout) => this.updateCheckout(checkout))
      .catch((err) => console.error("Failed to update item in cart: " + err, payload));
  },

  removeLine(lineId) {
    const checkout = Alpine.raw(this._checkout);
    const client = Alpine.raw(this._client);

    client.checkout.removeLineItems(checkout.id, [lineId])
      .then((checkout) => this.updateCheckout(checkout))
      .catch((err) => console.error("Failed to remove item from cart: " + err, lineId));
  }
});

Alpine.store("cart", {
  quantity: 0,

  setQuantity(value) {
    this.quantity = value;
  }
});
