// Initialize a client:
const client = ShopifyBuy.buildClient({
     domain: import.meta.env.SHOPIFY_HOSTNAME,
     storefrontAccessToken: import.meta.env.SHOPIFY_STOREFRONT_API_TOKEN,
});

console.log("client initialised!!!");
console.dir(client);
   
// Create a simple logger for the cart’s state:
const logCart = (c) => {
     console.log(c.lineItems);
     console.log(`Checkout URL: ${c.webUrl}`);
};
   
// Create a cart or “checkout” (or perhaps load one from `localStorage`):
client.checkout.create().then((checkout) => {

     console.log("inside of creating button");

     const $buyButtons = document.querySelectorAll(".buy-button");

     // Add a listener to each button:
     $buyButtons.forEach(($b) => {
          $b.addEventListener("click", (e) => {
          console.log("button is clicked!");
          // Read the variant ID off the product:
          client.checkout
               .addLineItems(checkout.id, [
               {
               // Build the Storefront-style resource identifier:
               variantId: `gid://shopify/ProductVariant/${$b.dataset.defaultVariantId}`,
               quantity: 1,
               },
               ])
               .then(logCart); // <- Log the changes!
          });
     });
});