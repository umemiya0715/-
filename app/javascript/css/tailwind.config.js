module.exports = {
  purge: [
    './app/**/*.vue',
  ],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {
      colors: {
        twitterBlue: '#1da1f2',
        navGray: '#b3b3b3'
      }
    },
  },
  variants: {
    extend: {},
  },
  plugins: [],
}
