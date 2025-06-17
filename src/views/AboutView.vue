<script>
export default {
  data() {
    return {
      activeTab: 1,
      tech: [
        {
          id: 1,
          name: 'Python',
          imageUrl: 'https://cdn.iconscout.com/icon/free/png-512/free-python-2-226051.png?f=webp&w=512',
        },
        {
          id: 2,
          name: 'Machine Learning',
          imageUrl: 'https://cdn.iconscout.com/icon/premium/png-512-thumb/computational-intelligence-2040740-1721091.png?f=webp&w=512',
        },
        {
          id: 3,
          name: 'C++',
          imageUrl: 'https://cdn.iconscout.com/icon/free/png-512/c-plusplus-1-226082.png',
        },
        {
          id: 4,
          name: 'JavaScript',
          imageUrl: 'https://cdn.iconscout.com/icon/free/png-512/javascript-2752148-2284965.png?f=webp&w=512',
        },
        {
          id: 5,
          name: 'C#',
          imageUrl: 'https://www.freeiconspng.com/uploads/c-logo-icon-18.png',
        },
        {
          id: 6,
          name: 'HTML',
          imageUrl: 'https://cdn.iconscout.com/icon/free/png-512/html5-40-1175193.png',
        },
        {
          id: 7,
          name: 'CSS',
          imageUrl: 'https://cdn.iconscout.com/icon/free/png-512/css3-11-1175239.png',
        },
        {
          id: 8,
          name: 'PHP',
          imageUrl: 'https://www.php.net/images/logos/new-php-logo.svg',
        },

      ],
      tools: [
        {
          id: 1,
          name: 'Git',
          imageUrl: 'https://git-scm.com/images/logos/downloads/Git-Icon-1788C.png',
          status: 'Version Control'
        },
        {
          id: 2,
          name: 'GitHub',
          imageUrl: 'https://cdn-icons-png.flaticon.com/512/25/25231.png',
          status: 'Git Hosting'
        },
        {
          id: 3,
          name: 'pip',
          imageUrl: 'https://cdn-icons-png.flaticon.com/512/1822/1822899.png',
          status: 'Package Manager'
        },
        {
          id: 4,
          name: 'Jupyter Notebook',
          imageUrl: 'https://raw.githubusercontent.com/github/explore/a4691f04ff219c1c2aa02fc61fda41aa43f1459a/topics/jupyter-notebook/jupyter-notebook.png',
          status: 'IDE'
        },
        {
          id: 5,
          name: 'VS Code',
          imageUrl: 'https://cdn.iconscout.com/icon/free/png-256/visual-studio-code-1868941-1583105.png',
          status: 'IDE'
        },
        {
          id: 6,
          name: 'Colab',
          imageUrl: 'https://avatars.githubusercontent.com/u/38081706?v=4',
          status: 'IDE'
        },
        {
          id: 7,
          name: 'Spreadsheets',
          imageUrl: 'https://cdn.iconscout.com/icon/free/png-512/logo-120-116259.png?f=webp&w=512',
          status: 'Google Sheets/Excel'
        },
        {
          id: 8,
          name: 'Visual Studio 2022',
          imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/Visual_Studio_Icon_2022.svg/768px-Visual_Studio_Icon_2022.svg.png',
          status: 'IDE'
        },
      ]
    };
  }
}
</script>
<template>
  <div
    class="bg-[#1e1e1f] px-5 py-5 md:px-12 md:py-10 text-left border border-[#383838] rounded-3xl text-amber-50 mx-3 mb-5">
    <article data-page="about">

      <header>
        <div class="text-2xl font-bold text-white mb-5 fadein-bot title-section flex items-center">
          About Me &nbsp;
          <div class="h-[1px] w-32 bg-blue-200 md:w-96 aos-init aos-animate" data-aos="zoom-in-left"
            data-aos-duration="600"></div>
        </div>
      </header>

      <section
        class="text-sm md:text-lg text-justify flex flex-col gap-4 md:flex-row md:gap-8 md:justify-left md:items-center">
        <div class="flex justify-center">
          <img class="w-9/12 rounded-full mb-3 fadein-up"
            src="/portofolio/img/stev.jpg" alt="Foto">
        </div>
        <div class="md:w-7/12">
          <p class="mb-3 md:mb-7 fadein-left fadeins-1">
            &nbsp; &nbsp; &nbsp; Hi everyone! My name is Stevanus Felixiano. I am a technology enthusiast currently pursuing a bachelor's degree in Computer Science at Padjadjaran University. I'm an energetic and curious individual who enjoys exploring new ideas and solving challenging problems, particularly in the areas of Backend Development and Artificial Intelligence.
Skilled in Python and spreadsheets for data processing and analysis, enabling me to extract meaningful insights to support data-driven decision making. On the backend side, I have experience in building RESTful APIs, integrating cloud databases such as Firestore, and developing scalable, maintainable backend systems.
Dedicated to continuous learning and eager to stay updated with the latest trends and technologies in backend development and data analysis. Committed to leveraging backend systems and data-driven insights to solve real-world problems.
          </p>
        </div>

      </section>

    </article>
  </div>

  <div class="px-5 py-5 md:px-12 md:py-10 text-left text-amber-50 mx-3">
    <article data-page="about">
      <header>
        <div class="text-2xl font-bold text-white mb-5 fadein-bot title-section flex items-center">
          <div class="h-[1px] w-10 bg-blue-200 md:w-20 aos-init aos-animate" data-aos="zoom-in-left"
            data-aos-duration="600"></div>
          &nbsp; Skills
        </div>
      </header>
      <section>
        <div>
          <ul class="flex flex-wrap text-sm font-medium text-center text-gray-500 dark:text-gray-400 mb-5">
            <li class="mr-2">
              <button class="inline-block px-4 py-3 rounded-lg hover:text-white"
                :class="{ 'text-blue-200 bg-blue-200 bg-opacity-10': activeTab === 1 }" @click="activeTab = 1">Tech Stack</button>
            </li>
            <li class="mr-2">
              <button class="inline-block px-4 py-3 rounded-lg hover:text-white"
                :class="{ 'text-blue-200 bg-blue-200 bg-opacity-10': activeTab === 2 }" @click="activeTab = 2">Tools</button>
            </li>
          </ul>
        </div>
        <div v-show="activeTab === 1">
          <div class="grid grid-cols-2 gap-4 pb-32 md:grid-cols-3 md:gap-8 xl:grid-cols-4 xl:gap-10 2xl:gap-12">
            <div v-for="item in tech" :key="item.id">
              <div
                class="item-tech flex cursor-pointer items-center gap-2 rounded border border-blue-200 px-2 py-2 hover:bg-blue-200 hover:bg-opacity-10 md:gap-3 lg:px-3">
                <div class="flex h-12 w-12 items-center justify-center p-0 lg:h-16 lg:w-16 lg:p-2 zoom-in">
                  <img alt="HTML" loading="lazy" width="32" height="32" decoding="async" data-nimg="1"
                    class="img-tech drop-shadow-xl transition-all duration-300 h-[65%] w-[65%] lg:h-[85%] lg:w-[85%]  "
                    :src="item.imageUrl" style="color: transparent;">
                </div>
                <div class="flex items-center text-sm md:text-base lg:text-lg">
                  <div class="tech font-medium text-secondary transition-all duration-300 translate-y-0 ">{{ item.name }}
                  </div>
                  <div
                    class="status-tech opacity-0 absolute mt-5 text-[10px] text-blue-200 transition-all duration-300 md:text-xs lg:text-sm">
                    {{ item.status }}</div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div v-show="activeTab === 2">
          <div class="grid grid-cols-2 gap-4 pb-32 md:grid-cols-3 md:gap-8 xl:grid-cols-4 xl:gap-10 2xl:gap-12">
            <div v-for="item in tools" :key="item.id">
              <div class="item-tech flex cursor-pointer items-center gap-2 rounded border border-blue-200 px-2 py-2 hover:bg-blue-200 hover:bg-opacity-10">
                <div class="flex h-12 w-12 items-center justify-center p-0 lg:h-16 lg:w-16 lg:p-2 zoom-in">
                  <img alt="HTML" loading="lazy" width="32" height="32" decoding="async" data-nimg="1"
                    class="img-tech drop-shadow-xl transition-all duration-300 h-[65%] w-[65%] lg:h-[85%] lg:w-[85%]  "
                    :src="item.imageUrl" style="color: transparent;">
                </div>
                <div class="flex items-center text-sm md:text-base lg:text-lg">
                  <div class="tech font-medium text-secondary transition-all duration-300 translate-y-0 ">{{ item.name }}
                  </div>
                  <div
                    class="status-tech opacity-0 absolute mt-10 text-[10px] text-blue-200 transition-all duration-300 md:text-xs lg:text-sm">
                    {{ item.status }}</div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
    </article>
  </div>
</template>

<style>
.fadein-left {
  opacity: 0;
  animation: fadeInLeft 0.5s ease-out forwards;
}

@keyframes fadeInLeft {
  0% {
    opacity: 0;
    transform: translateX(100%);
  }

  100% {
    opacity: 1;
    transform: translateX(0);
  }
}

.fadeins-1 {
  animation-delay: 500ms;
}

.fadeins-2 {
  animation-delay: 800ms;
}

.img-tech,
.tech {
  transition: transform 0.3s ease;
}

.item-tech:hover .img-tech {
  transform: scale(1.3);
}

.item-tech:hover .tech {
  transform: translateY(-12px);
}

.item-tech:hover .status-tech {
  opacity: 1;
}
</style>
