import Client from 'shopify-buy';

// Initialize a client:
const client = Client.buildClient({
     domain: import.meta.env.VITE_SHOPIFY_HOSTNAME,
     storefrontAccessToken: import.meta.env.VITE_SHOPIFY_STOREFRONT_API_TOKEN,
});

// Create an empty checkout (@todo look at checking for existing checkout?)
client.checkout.create().then((checkout) => {

     const $buyButtons = document.querySelectorAll(".buy-button");

     $buyButtons.forEach(button => {
          button.addEventListener("click", () => {

               updateButtonUIToLoading(button);

               const lineItemsToAdd = [
                    {
                         variantId: 'gid://shopify/ProductVariant/' + button.dataset.defaultVariantId,
                         quantity: 1,
                    }
               ];

               // Add an item to the checkout
               client.checkout.addLineItems(checkout.id, lineItemsToAdd).then((checkout) => {
                    // Do something with the updated checkout
                    updateButtonUIToSuccess(button);
               });

          });
     });

});

function updateButtonUIToLoading(button) {
     button.disabled = true;
}

function updateButtonUIToSuccess(button) {
     button.disabled = false;
}