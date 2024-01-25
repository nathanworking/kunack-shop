/* CSS */
  import "@css/tailwind.pcss";
  // custom plugins
  import "plyr/dist/plyr.css";
  // app alwyas last as it's custom
  import "@css/app.pcss";

/* JS */
  import 'lazysizes';

/**
 * Alpine JS
 * Best to put it last so that all other potential JS is available
 * when components start getting initialized.
 */
import Alpine from 'alpinejs';
import focus from '@alpinejs/focus';
import intersect from '@alpinejs/intersect'
 
Alpine.plugin(focus);
Alpine.plugin(intersect);

window.Alpine = Alpine;
Alpine.start();

/**
 * Accept HMR as per: https://vitejs.dev/guide/api-hmr.html
 */
if (import.meta.hot) {
  import.meta.hot.accept(() => {
    console.log("HMR");
  });
}

