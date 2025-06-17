<template>
  <div class="max-w-7xl mx-auto flex flex-col relative">
    <nav class="max-w-7xl px-5 md:fixed top-0 z-[98] w-screen backdrop-blur-md bg-[#121212] bg-opacity-80">
      <div class="container mx-auto flex flex-wrap items-center justify-between">
        <button class="flex">
          <span class="self-center text-lg text-[#00f9ff] font-semibold whitespace-nowrap fadein-bot hover:text-amber-100">Stevanus Felixiano</span>
        </button>
        <div class="social-icons flex md:order-2 items-center space-x-6 fadein-bot">
          <a href="https://github.com/StevanusFelixiano">
            <img class="w-9 rounded-full" src="https://seeklogo.com/images/G/github-logo-2E3852456C-seeklogo.com.png" alt="github">
          </a>
          <a href="https://www.linkedin.com/in/stevanus-felixiano" target="_blank" rel="noopener" aria-label="LinkedIn">
            <img class="w-6 md:w-8 h-6 md:h-8" src="https://cdn.jsdelivr.net/npm/simple-icons@v10/icons/linkedin.svg" alt="LinkedIn">
          </a>
          <a href="https://www.instagram.com/stevanusfelixiano" target="_blank" rel="noopener" aria-label="Instagram">
            <img class="w-6 md:w-8 h-6 md:h-8" src="https://cdn.jsdelivr.net/npm/simple-icons@v10/icons/instagram.svg" alt="Instagram">
          </a>
          <a href="mailto:stevanusf77@gmail.com" aria-label="Email">
            <img class="w-6 md:w-8 h-6 md:h-8" src="https://cdn.jsdelivr.net/npm/simple-icons@v10/icons/gmail.svg" alt="Email">
          </a>
        </div>
        <div class="hidden md:flex justify-between items-center w-full md:w-auto md:order-1" id="mobile-menu-3">
          <ul class="flex-col md:flex-row flex md:space-x-8 mt-4 md:mt-0 md:text-sm md:font-medium">
            <li>
              <router-link to="/">
                <span @click="setLoading" class="fadein-bot text-gray-500 hover:bg-gray-90 border-b border-gray-100 md:hover:bg-transparent md:border-0 block pl-3 pr-4 py-2 md:hover:text-gray-200 md:p-0">Home</span>
              </router-link>
            </li>
            <li>
              <router-link to="/about">
                <span @click="setLoading" class="fadein-bot fadein-1 text-gray-500 hover:bg-gray-50 border-b border-gray-100 md:hover:bg-transparent md:border-0 block pl-3 pr-4 py-2 md:hover:text-gray-200 md:p-0">About</span>
              </router-link>
            </li>
            <li>
              <router-link to="/portfolio">
                <span @click="setLoading" class="fadein-bot fadein-2 text-gray-500 hover:bg-gray-50 border-b border-gray-100 md:hover:bg-transparent md:border-0 block pl-3 pr-4 py-2 md:hover:text-gray-200 md:p-0">Portfolio</span>
              </router-link>
            </li>
            <li>
              <router-link to="/blog">
                <span @click="setLoading" class="fadein-bot fadein-3 text-gray-500 hover:bg-gray-50 border-b border-gray-100 md:hover:bg-transparent md:border-0 block pl-3 pr-4 py-2 md:hover:text-gray-200 md:p-0 blog">Experiences</span>
              </router-link>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    <div class="md:mt-[100px]">
      <router-view />
    </div>
    <footer class="block md:hidden fixed bottom-0 left-0 right-0 rounded-t-3xl border border-[#383838] bg-[#121212] bg-opacity-80 backdrop-blur-md backdrop-opacity-90">
      <nav class="flex justify-around py-4 text-xs">
        <router-link to="/">
          <span @click="setLoading" class="text-gray-300 hover:text-white">Home</span>
        </router-link>
        <router-link to="/about">
          <span @click="setLoading" class="text-gray-300 hover:text-white">About</span>
        </router-link>
        <router-link to="/portfolio">
          <span @click="setLoading" class="text-gray-300 hover:text-white">Portfolio</span>
        </router-link>
        <router-link to="/blog">
          <span @click="setLoading" class="text-gray-300 hover:text-white">Experiences</span>
        </router-link>
      </nav>
    </footer>
    <div v-if="isLoading" class="loading-overlay">
      <div class="spinner"></div>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      isLoading: false
    };
  },
  watch: {
    '$route'() {
      this.isLoading = false;
    }
  },
  methods: {
    setLoading() {
      this.isLoading = true;
    },
    redirectToHome() {
      this.setLoading();
      this.$router.push('/');
    }
  }
}
</script>
<style>
*,
*::before,
*::after {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

::-webkit-scrollbar {
  width: 5px;
  height: 5px;
}

::-webkit-scrollbar-track {
  background: hsl(240, 1%, 17%);
  border-radius: 5px;
}

::-webkit-scrollbar-thumb {
  background: #00f9ff;
  border-radius: 5px;
}

::-webkit-scrollbar-button { width: 20px; }

body {
  font-family: 'Poppins', sans-serif;
  background: hsl(0, 0%, 7%);
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  height: 100vh;
}

nav {
  padding: 30px;
}

nav a {
  font-weight: bold;
  color: #2c3e50;
  transition: color 0.3s;
}
.social-icons img {
  filter: invert(1) brightness(2);
  transition: transform 0.3s;
}
.social-icons img:hover {
  transform: scale(1.1);
}

nav a.router-link-exact-active {
  display: inline-flex;
  flex-direction: column;
  color: white;
  transition: color 0.3s;
}

nav a.router-link-exact-active::after {
  display: inline-block;
  content: "";
  margin-top: 0.08em;
  width: 100%;
  height: 4px;
  border-radius: 2px;
  background-color: #00f9ff;
}

nav a.router-link-exact-active:hover {
  color: white;
}

@keyframes fadeInLeft {
  0% {
    opacity: 0;
    transform: translateX(-100%);
  }
  100% {
    opacity: 1;
    transform: translateX(0);
  }
}

.social-icons img {
  filter: invert(1) brightness(2);
}

.loading-overlay {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: rgba(0, 0, 0, 0.5);
  z-index: 1000;
}
.spinner {
  border: 0.25rem solid #f3f3f3;
  border-top: 0.25rem solid #3498db;
  border-radius: 50%;
  width: 2rem;
  height: 2rem;
  animation: spin 1s linear infinite;
}
@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}
</style>
