import {defineConfig} from 'vite';
import manifestSRI from 'vite-plugin-manifest-sri';
import viteCompression from 'vite-plugin-compression';
import ViteRestart from 'vite-plugin-restart';
import critical from 'rollup-plugin-critical';
import { ViteFaviconsPlugin } from "vite-plugin-favicon2";
import * as path from 'path';


export default defineConfig(({command}) => ({
  base: command === 'serve' ? '' : '/dist/',
  build: {
     emptyOutDir: true,
    manifest: 'manifest.json',
    outDir: path.resolve(__dirname, 'web/dist/'),
    rollupOptions: {
      input: {
        app: path.resolve(__dirname, 'src/js/app.js'),
      },
    },
    output: { 
     sourcemap: true
    },
  },
  plugins: [
     // critical({
     //      criticalUrl: "http://chaos.ddev.site",
     //      criticalBase: "./templates",
     //      criticalPages: [
     //      { uri: "/", template: "page/_entry" },
     //      { uri: "/404", template: "404" },
     // ],
     //      criticalConfig: {},
     // }),
     manifestSRI(),
     viteCompression({
          filter: /\.(js|mjs|json|css|map)$/i
     }),
     ViteFaviconsPlugin({
          logo: "./src/img/favicon-src.png",
          inject: false,
          outputPath: 'favicons',
     }),
     ViteRestart({
          reload: [
          '../templates/**/*',
          ],
     }),
  ],
  publicDir: path.resolve(__dirname, 'src/public'),
  resolve: {
    alias: {
      '@': path.resolve(__dirname, 'src'),
      '@css': path.resolve(__dirname, 'src/pcss'),
      '@js': path.resolve(__dirname, 'src/js'),
    },
  },
  server: {
    host: '0.0.0.0',
    port: 3000,
    usePolling: false,
    strictPort: true,
  },
}));