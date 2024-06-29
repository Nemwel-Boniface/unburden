const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
      backgroundColor: {
        'top-nav-light-brown-bg': '#F3EBE6',
        'dark-brown-bg': '#A57355',
        'deep-dark-bg': '#744D3C',
        'cream': '#F7F2EF',
        'cream-bg': '#FFFFFF',
        'programs-cream': '#F3EBE6',
      },
      colors: {
        'brown-text': '#A57355',
      },
      fontSize: {
        '37px': '37px',
        '50px': '50px',
        'custom-size': '3rem',
      },
      fontFamily: {
        'libre': ['"Libre Baskerville"', 'serif'],
        'mulish': ['"Mulish"', 'sans-serif'],
        'playwrite': ['"Playwrite MX"', 'sans-serif'],
      },
      padding: {
        '20vw': '20vw',
        '7vw': '7vw',
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
