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
      },
      color: {
        'brown-text': '#A57355',
      },
      fontSize: {
        '37px': '37px',
      },
      fontFamily: {
        'libre': ['"Libre Baskerville"', 'serif'],
        'mulish': ['"Mulish"', 'sans-serif'],
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
