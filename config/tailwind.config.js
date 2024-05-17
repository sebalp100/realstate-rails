import { fontFamily as _fontFamily } from 'tailwindcss/defaultTheme'

export const content = [
  './public/*.html',
  './app/helpers/**/*.rb',
  './app/javascript/**/*.js',
  './app/views/**/*',
]
export const theme = {
  extend: {
    fontFamily: {
      inter: ['Inter', ..._fontFamily.sans],
    },
    backgroundImage: {
      'hero-pattern': "url('bkg.png')",
    },
  },
}
export const plugins = [
  require('@tailwindcss/forms'),
  require('@tailwindcss/typography'),
  require('@tailwindcss/container-queries'),
]
