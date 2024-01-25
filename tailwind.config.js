// Chaos Tailwind Config 3.0.0 

module.exports = {
  content: [ 
    './templates/**/*.html', 
    './templates/**/*.twig',
    './config/formie.php' 
  ],
  theme: {
    // Replace the default Tailwind config here
    borderRadius: {
      'none': '0',
      'sm': 'var(--border-radius-sm)',
      DEFAULT: 'var(--border-radius)',
      'md': 'var(--border-radius-md)',
      'lg': 'var(--border-radius-lg)',
      'xl': 'var(--border-radius-xl)',
      'full': '9999px',
    },
    // Extend the default Tailwind config here
    extend: {
      colors: {
        transparent: 'transparent',
        current: 'currentColor',
        inherit: 'inherit',
        primary: {
          dark: 'hsl(var(--color-primary-dark) / <alpha-value>)',
          light: 'hsl(var(--color-primary-light) / <alpha-value>)',
          light_alt: 'hsl(var(--color-primary-light-alt) / <alpha-value>)',
        },
        secondary: {
          dark: 'hsl(var(--color-secondary-dark) / <alpha-value>)',
          light: 'hsl(var(--color-secondary-light) / <alpha-value>)',
        },
        tertiary: {
          'DEFAULT': 'hsl(var(--color-tertiary) / <alpha-value>)',
          content: 'hsl(var(--color-tertiary-content) / <alpha-value>)',
          focus: 'hsl(var(--color-tertiary-focus) / <alpha-value>)',
        },
        accent: {
          'DEFAULT': 'hsl(var(--color-accent) / <alpha-value>)',
          focus: 'hsl(var(--color-accent-focus) / <alpha-value>)',
        },
        warning: {
          'DEFAULT': 'hsl(var(--color-warning) / <alpha-value>)',
        },
        success: {
          DEFAULT: 'hsl(var(--color-success) / <alpha-value>)',
        },
        error: {
          DEFAULT: 'hsl(var(--color-error) / <alpha-value>)',
        },
      },
      fontFamily: {
      },
      zIndex: {
        '1': '1',
        '2': '2',
        '3': '3',
        '5': '5',
        '15': '15',
      },
      borderRadius: {
        'inherit': 'inherit',
      },
      lineHeight: {
        'extra-tight': '1.1',
      },
      transitionTimingFunction: {
        'out-back': 'cubic-bezier(0.34, 1.56, 0.64, 1)',
      },
      boxShadow: {
        'inner-xs': 'inset 0 0 0.5px 1px hsla(0, 0%, 100%, 0.075), 0 0.1px 0.3px rgba(0, 0, 0, 0.06), 0 1px 2px rgba(0, 0, 0, 0.12)',
        'inner-2xs': 'inset 0 0 0.5px 1px hsla(0, 0%, 100%, 0.075), 0 0.1px 0.3px rgba(0, 0, 0, 0.06), 0 1px 2px rgba(0, 0, 0, 0.12), 0 0.1px 0.3px rgba(0, 0, 0, 0.06), 0 1px 2px rgba(0, 0, 0, 0.12)',
        'inner-sm': 'inset 0 0 0.5px 1px hsla(0, 0%, 100%, 0.075), 0 0.3px 0.4px rgba(0, 0, 0, 0.025), 0 0.9px 1.5px rgba(0, 0, 0, 0.05), 0 3.5px 6px rgba(0, 0, 0, 0.1)',
        'inner-md': 'inset 0 0 0.5px 1px hsla(0, 0%, 100%, 0.075), 0 0.9px 1.5px rgba(0, 0, 0, 0.03), 0 3.1px 5.5px rgba(0, 0, 0, 0.08), 0 14px 25px rgba(0, 0, 0, 0.12)',
        'inner-lg': 'inset 0 0 0.5px 1px hsla(0, 0%, 100%, 0.075), 0 1.2px 1.9px -1px rgba(0, 0, 0, 0.014), 0 3.3px 5.3px -1px rgba(0, 0, 0, 0.038), 0 8.5px 12.7px -1px rgba(0, 0, 0, 0.085), 0 30px 42px -1px rgba(0, 0, 0, 0.15)',
        'inner-top-xs': 'inset 0 1px 0.5px hsla(0, 0%, 100%, 0.075), 0 0.1px 0.3px rgba(0, 0, 0, 0.06), 0 1px 2px rgba(0, 0, 0, 0.12)',
        'inner-top-sm': 'inset 0 1px 0.5px hsla(0, 0%, 100%, 0.075), 0 0.3px 0.4px rgba(0, 0, 0, 0.025), 0 0.9px 1.5px rgba(0, 0, 0, 0.05), 0 3.5px 6px rgba(0, 0, 0, 0.1)',
        'inner-top-md': 'inset 0 1px 0.5px hsla(0, 0%, 100%, 0.075), 0 0.9px 1.5px rgba(0, 0, 0, 0.03), 0 3.1px 5.5px rgba(0, 0, 0, 0.08), 0 14px 25px rgba(0, 0, 0, 0.12)',
        'inner-top-lg': 'inset 0 1px 0.5px hsla(0, 0%, 100%, 0.075), 0 1.2px 1.9px -1px rgba(0, 0, 0, 0.014), 0 3.3px 5.3px -1px rgba(0, 0, 0, 0.038), 0 8.5px 12.7px -1px rgba(0, 0, 0, 0.085), 0 30px 42px -1px rgba(0, 0, 0, 0.15)',
        
      },
      opacity: {
        '7': '.07',
        '8': '.08',
        '9': '.09',
        '12': '.12',
        '15': '.15',
        '35': '.35',
        '65': '.65',
        '85': '.85',
        '98': '.98',
      },
      borderWidth: {
        '3': '3px',
      },
      outlineWidth: {
        '3': '3px',
      },
    }
  },
  corePlugins: {},
  plugins: [
      require('@tailwindcss/forms'),
      require('@tailwindcss/typography'),
      require('@tailwindcss/aspect-ratio'),
  ],
};