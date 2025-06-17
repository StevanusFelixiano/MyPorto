<template>
  <div class="px-5 py-5 md:px-12 md:py-10 text-left text-amber-50 mx-3">
    <article data-page="about">
      <header>
        <transition name="fade-slide" mode="out-in">
          <div :key="activeTab"
            class="text-2xl font-bold text-white mb-10 fadein-bot title-section flex items-center justify-center flex-col">
            <h4>{{ headerTitle }}</h4>
            <h4 class="text-base font-normal text-transparent bg-clip-text bg-gradient-to-r from-slate-100 to-blue-300">
              {{ headerSubtitle }}</h4>
          </div>
        </transition>
        <div class="tabs flex justify-center gap-4 mb-8">
          <button @click="activeTab = 1" :class="{ 'active-tab': activeTab === 1 }">
            Projects
          </button>
          <button @click="activeTab = 2" :class="{ 'active-tab': activeTab === 2 }">
            Certificates
          </button>
        </div>

      </header>
      <section>
        <div v-if="activeTab === 1">
          <div
            class="grid grid-cols-1 gap-4 pb-32 md:grid-cols-3 md:gap-3 xl:grid-cols-3 xl:gap-3 2xl:gap-5 fade-zoom-in">
            <div v-for="item in items" :key="item.id">
              <div
                class="item-card flex flex-col items-center gap-2 rounded bg-[#1e1e1f] hover:bg-[#282828] border border-[#383838] rounded-xl text-amber-50 md:gap-3 px-5 py-5 lg:px-5 ">
                <div class="flex h-12 w-12 items-center justify-center p-0 h-full w-full lg:p-0 zoom-in">
                  <img alt="HTML" loading="lazy" decoding="async" data-nimg="1"
                    class="drop-shadow-xl rounded rounded-xl" :src="getImageUrlPng(item.imageUrl)">
                </div>
                <div class="w-full flex flex-col gap-2 items-center text-sm md:text-base lg:text-lg">
                  <div class="title-text font-medium text-secondary">{{ item.name }}</div>
                  <div class="w-full text-left text-[10px] text-[#c1c1c1] md:text-xs lg:text-sm">{{ item.status }}</div>
                  <div class="w-full mt-4 text-normal text-sm text-left text-blue-200">{{ item.tech }}</div>
                  <div class="w-full flex justify-end">
                    <div class="flex cursor-pointer items-end gap-2 text-primary">
                      <a v-if="item.github !== 'null'" :href="item.github" target="_blank" rel="noreferrer"
                        title="View github repository" class="transition-all hover:text-accent">
                        <svg stroke="currentColor" fill="none" stroke-width="2" viewBox="0 0 24 24"
                          stroke-linecap="round" stroke-linejoin="round" height="16" width="16"
                          xmlns="http://www.w3.org/2000/svg">
                          <path
                            d="M9 19c-5 1.5-5-2.5-7-3m14 6v-3.87a3.37 3.37 0 0 0-.94-2.61c3.14-.35 6.44-1.54 6.44-7A5.44 5.44 0 0 0 20 4.77 5.07 5.07 0 0 0 19.91 1S18.73.65 16 2.48a13.38 13.38 0 0 0-7 0C6.27.65 5.09 1 5.09 1A5.07 5.07 0 0 0 5 4.77a5.44 5.44 0 0 0-1.5 3.78c0 5.42 3.3 6.61 6.44 7A3.37 3.37 0 0 0 9 18.13V22">
                          </path>
                        </svg>
                      </a>
                      <a v-if="item.demo !== 'null'" :href="item.demo" target="_blank" rel="noreferrer"
                        title="View finished project" class="transition-all hover:text-accent">
                        <svg stroke="currentColor" fill="none" stroke-width="2" viewBox="0 0 24 24"
                          stroke-linecap="round" stroke-linejoin="round" height="18" width="18"
                          xmlns="http://www.w3.org/2000/svg">
                          <path d="M18 13v6a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h6"></path>
                          <polyline points="15 3 21 3 21 9"></polyline>
                          <line x1="10" y1="14" x2="21" y2="3"></line>
                        </svg>
                      </a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div v-if="activeTab === 2">
          <div
            class="grid grid-cols-1 gap-4 pb-32 md:grid-cols-3 md:gap-3 xl:grid-cols-3 xl:gap-3 2xl:gap-5 fade-zoom-in">
            <div v-for="certificate in certificates" :key="certificate.id">
              <div
                class="item-card flex flex-col items-center gap-2 rounded bg-[#1e1e1f] hover:bg-[#282828] border border-[#383838] rounded-xl text-amber-50 md:gap-3 px-5 py-5 lg:px-5 ">
                <div class="flex h-12 w-12 items-center justify-center p-0 h-full w-full lg:p-0 zoom-in">
                  <img alt="HTML" loading="lazy" decoding="async" data-nimg="1"
                    class="drop-shadow-xl rounded rounded-xl" :src="getImageUrl(certificate.imageUrl)">
                </div>
                <div class="w-full flex flex-col gap-2 items-start text-sm md:text-base lg:text-lg">
                  <div class="title-text font-medium text-secondary">{{ certificate.name }}</div>
                  <div class="w-full text-left text-[10px] text-[#c1c1c1] md:text-xs lg:text-sm">{{ certificate.date }}
                  </div>
                  <div class="w-full flex justify-end">
                    <div class="flex cursor-pointer items-end gap-2 text-primary">
                      <a v-if="certificate.link !== 'null'" :href="certificate.link" target="_blank" rel="noreferrer"
                        title="View certificate" class="transition-all hover:text-accent">
                        <svg stroke="currentColor" fill="none" stroke-width="2" viewBox="0 0 24 24"
                          stroke-linecap="round" stroke-linejoin="round" height="18" width="18"
                          xmlns="http://www.w3.org/2000/svg">
                          <path d="M18 13v6a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h6"></path>
                          <polyline points="15 3 21 3 21 9"></polyline>
                          <line x1="10" y1="14" x2="21" y2="3"></line>
                        </svg>
                      </a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div v-if="isLoading" class="flex justify-center items-center h-full">
          <div class="loader ease-linear rounded-full border-4 border-t-4 border-gray-200 h-12 w-12 mb-4"></div>
        </div>
      </section>
    </article>
  </div>
</template>

<script>
export default {
  data() {
    return {
      activeTab: 1,
      items: [
        {
          id: 1,
          name: 'Major Finder',
          imageUrl: 'Major-Finder',
          status: `MajorFinder is a smart web application designed to help Informatics students determine their most suitable academic major and minor based on their personal interests, academic performance, and career goals. Built using Streamlit, the system applies Fuzzy Logic and Analytical Hierarchy Process (AHP) to deliver accurate, data-driven recommendations. The application features an intuitive UI for student input, a Fuzzy & AHP-based scoring system, and provides visualized results along with downloadable reports.`,
          tech: 'Python, Streamlit, Fuzzy Logic, AHP',
          github: 'https://github.com/StevanusFelixiano/ProyekSoftcom',
          demo: 'https://majorfinder.streamlit.app/'
        },
        {
          id: 2,
          name: 'NoteBoost',
          imageUrl: 'Noteboost',
          status: 'NoteBoost is an online platform designed to help students take and improve their notes through a smart feature that adapts content based on their grade level and subject matter. Focused on supporting learners from elementary to high school, NoteBoost aims to enhance study effectiveness and broaden academic insight. This project is part of our effort to support the United Nations’ Sustainable Development Goal 4: ensuring inclusive and equitable quality education for all. In this project, I worked as a Backend Developer, responsible for building APIs, implementing authentication, and integrating AI capabilities using the Gemini API. I also handled the integration between the frontend and backend, ensuring smooth communication and functionality across the entire application.',
          tech: 'React,js, Express.js, Firebase, Google Cloud Platform',
          github: 'https://github.com/raythrp/NoteBoost-serve',
          demo: 'https://www.noteboost.site/'
        },
        {
          id: 3,
          name: 'FishGuard',
          imageUrl: 'FishGuard',
          status: 'FishGuard is a Capstone Project of the Bangkit Academy 2024 Batch 2, aimed at supporting marine biodiversity conservation through the use of machine learning and computer vision. The project enables users to identify protected fish species via a mobile app by uploading fish photos for accurate classification. As a Machine Learning Engineer, I was responsible for developing detection and classification models, building RESTful APIs for data integration, and collaborating with the app development team to ensure seamless user experience and model deployment.',
          tech: 'Python, TensorFlow',
          github: 'https://github.com/FishGuard-Capstone',
          demo: 'https://drive.google.com/drive/folders/1v361Pu2Y7y_2jpWg-_COtmBCovBKV7Qh?usp=drive_link'
        },
        {
          id: 4,
          name: 'Trash Bin Robot with Computer Vision',
          imageUrl: 'Trash Bin Robot',
          status: 'As the final project for the Robotics Practicum course, My team and I developed a smart trash bin robot powered by Computer Vision using Mediapipe v5. The robot recognizes hand gestures through pose estimation and responds when a user raises their hand by autonomously approaching them. It follows the user’s movements, opens the lid automatically for waste disposal, and closes it afterward—fully contactless and intuitive.',
          tech: 'Arduino, Python, OpenCV',
          github: 'https://github.com/fahri22002/Robot-Tongsampah-dengan-Computer-Vision-dari-Mediapipe5',
          demo: 'null'
        },
        {
          id: 5,
          name: 'Clustering of Aerial Images',
          imageUrl: 'Cluster',
          status: 'This project utilizes K-Means clustering to segment aerial imagery captured by drones into visually distinct land cover types. Implemented using Streamlit for interactivity, the application allows users to upload images and view the segmentation results in real time. Each cluster represents a unique land characteristic on extracted color and texture features.',
          tech: 'Ipynb, Python, Streamlit',
          github: 'https://github.com/StevanusFelixiano/UTSDataMining',
          demo: 'null'
        },
        {
          id: 6,
          name: 'Fruit & Vegetable Detection With CNN',
          imageUrl: 'Fruit Detection',
          status: 'This project aims to perform sentiment analysis on texts in Indonesian using the BERT model. First, a BERT model for text sequence classification is prepared by tokenization using an Indonesian tokenizer and appropriate configuration. The model is then trained using the pre-processed SMSA Doc Sentiment Prose dataset. After training the model, it was evaluated using validation and testing datasets.The results show that the trained model is able to achieve good accuracy in classifying the sentiment on Indonesian text as either positive or negative.',
          tech: 'Python, Streamlit',
          github: 'https://github.com/WrathSnail/Fruit-and-Vegetable-recognition',
          demo: 'null'
        },
        {
          id: 7,
          name: 'The Weeknd Website',
          imageUrl: 'TheWeeknd',
          status: 'This project focused on developing a dynamic and interactive website dedicated to The Weeknd, leveraging CodeIgniter 4 as the framework. The website highlights The Weeknd’s music, albums, tour schedules, and latest news, featuring a user-friendly design that enhances visitor engagement. A modern, responsive layout was crafted using HTML and CSS to ensure seamless performance across different devices and screen sizes. XAMPP was utilized as the local development environment, while PHP powered the server-side functionalities, enabling smooth integration with MySQL databases for efficient storage and management of user data, content, and multimedia resources.',
          tech: 'HTML, CSS, CodeIgniter4, JavaScript, MySQL',
          github: 'https://github.com/Clah7/TheWeeknd',
          demo: 'null'
        }
      ],
      certificates: [
        {
          id: 1,
          name: 'Advanced Computer Vision with TensorFlow',
          date: 'Issued Dec 2024',
          imageUrl: 'Advanced Computer Vision with TensorFlow',
          link: 'https://coursera.org/share/9b5fadccd23f6fb4123a593435d7922e',
        },
        {
          id: 2,
          name: 'Build Basic Generative Adversarial Networks (GANs)',
          date: 'Issued Dec 2024',
          imageUrl: 'Build Basic Generative Adversarial Networks',
          link: 'https://coursera.org/share/92ed6db8481c0f06a504ce9c54c6850f',
        },
        {
          id: 3,
          name: 'Custom and Distributed Training with TensorFlow',
          date: 'Issued Dec 2024',
          imageUrl: 'Custom and Distributed Training with TensorFlow',
          link: 'https://coursera.org/share/4a62ca21db32700af801b2261957e915',
        },
        {
          id: 4,
          name: 'Generative AI for Everyone',
          date: 'Issued Dec 2024',
          imageUrl: 'Generative AI for Everyone',
          link: 'https://coursera.org/share/a36394647d7f4ee25db2ae62a911af18',
        },
        {
          id: 5,
          name: 'Browser-based Models with TensorFlow.js',
          date: 'Issued Nov 2024',
          imageUrl: 'Browser-based Models with TensorFlow',
          link: 'https://coursera.org/share/d8609212d9951e8ff9cbc2ad65896dc0',
        },
        {
          id: 6,
          name: 'Custom Models, Layers, and Loss Functions with TensorFlow',
          date: 'Issued Nov 2024',
          imageUrl: 'Custom Models, Layers, and Loss Functions with TensorFlow',
          link: 'https://coursera.org/share/bf9d87dc174295f61436c4fef4316dc9',
        },
        {
          id: 7,
          name: 'Data Pipelines with TensorFlow Data Services',
          date: 'Issued Nov 2024',
          imageUrl: 'Data Pipelines with TensorFlow Data Services',
          link: 'https://coursera.org/share/ca84c377d4d6c092891b392ce8d8ae7d',
        },
        {
          id: 8,
          name: 'Device-based Models with TensorFlow Lite',
          date: 'Issued Nov 2024',
          imageUrl: 'Device-based Models with TensorFlow Lite',
          link: 'https://coursera.org/share/714254a59a855804409ab76923bcd063',
        },
        {
          id: 9,
          name: 'Structuring Machine Learning Projects',
          date: 'Issued Nov 2024',
          imageUrl: 'Structuring Machine Learning Projects',
          link: 'https://coursera.org/share/058b72cde8828c52ffdca0b9d30313cb',
        },
        {
          id: 10,
          name: 'Advanced Learning Algorithms',
          date: 'Issued Oct 2024',
          imageUrl: 'Advanced Learning Algorithms',
          link: 'https://coursera.org/share/9451d9e2223769843af0040b90654f7c',
        },
        {
          id: 11,
          name: 'Belajar Analisis Data dengan Python',
          date: 'Issued Oct 2024',
          imageUrl: 'Belajar Analisis Data Dengan Python',
          link: 'https://www.dicoding.com/certificates/GRX54L5V2P0M',
        },
        {
          id: 12,
          name: 'Convolutional Neural Networks in TensorFlow',
          date: 'Issued Oct 2024',
          imageUrl: 'Convolutional Neural Networks in TensorFlow',
          link: 'https://coursera.org/share/33e0db402758dd0ada6d0387fb98de0c',
        },
        {
          id: 13,
          name: 'DeepLearning.AI TensorFlow Developer Specialization',
          date: 'Issued Oct 2024',
          imageUrl: 'DeepLearning.AI TensorFlow Developer Specialization',
          link: 'https://coursera.org/share/dd7330bfbbf2c8ef8c51c6aa7c3164c5',
        },
        {
          id: 14,
          name: 'Introduction to TensorFlow for Artificial Intelligence, Machine Learning, and Deep Learning',
          date: 'Issued Oct 2024',
          imageUrl: 'Introduction to TensorFlow for Artificial Intelligence, Machine Learning, and Deep Learning',
          link: 'https://coursera.org/share/754440be9389bdb426141f9a7cec1354',
        },
        {
          id: 15,
          name: 'Linear Algebra for Machine Learning and Data Science',
          date: 'Issued Oct 2024',
          imageUrl: 'Linear Algebra for Machine Learning and Data Science',
          link: 'https://coursera.org/share/2553104e9bb93ef56e7b90bc3ecc08e3',
        },
        {
          id: 16,
          name: 'Machine Learning Specialization',
          date: 'Issued Oct 2024',
          imageUrl: 'Machine Learning Specialization',
          link: 'https://coursera.org/share/0e57fd0e0bb4df1f76d50b79bf763611',
        },
        {
          id: 17,
          name: 'Natural Language Processing in TensorFlow',
          date: 'Issued Oct 2024',
          imageUrl: 'Natural Language Processing in TensorFlow',
          link: 'https://coursera.org/share/37f8c890ce6578b04ae50fbbc36e3ae8',
        },
        {
          id: 18,
          name: 'Sequence, Time Series and Prediction',
          date: 'Issued Oct 2024',
          imageUrl: 'Sequence, Time Series and Prediction',
          link: 'https://coursera.org/share/2549e5abb48cb1da17ab0918f4dc2c0f',
        },
        {
          id: 19,
          name: 'Supervised Machine Learning: Regression and Classification',
          date: 'Issued Oct 2024',
          imageUrl: 'Supervised Machine Learning Regression',
          link: 'https://coursera.org/share/c2f34e7e7fcc6d175c50f48b6add9cec',
        },
        {
          id: 20,
          name: 'Unsupervised Learning, Recommenders, Reinforcement Learning',
          date: 'Issued Oct 2024',
          imageUrl: 'Unsupervised Learning, Recommenders, Reinforcement Learning',
          link: 'https://coursera.org/share/ac61ce54329a84e353fbc5aefcadb7d0',
        },
        {
          id: 21,
          name: 'Crash Course on Python',
          date: 'Issued Sep 2024',
          imageUrl: 'Crash Course on Python',
          link: 'https://coursera.org/share/92b8af19840c1977d9a0dbd5aec27c63',
        },
        {
          id: 22,
          name: 'Using Python to Interact with the Operating System',
          date: 'Issued Sep 2024',
          imageUrl: 'Using Python to Interact with the Operating System',
          link: 'https://coursera.org/share/fd4429c7f55660b0459dbfe932bc4df8',
        }
      ],
      isLoading: false
    };
  },
  computed: {
    headerTitle() {
      return this.activeTab === 1
        ? "Past Project Experience"
        : "Certificates";
    },
    headerSubtitle() {
      return this.activeTab === 1
        ? "Explore the projects I've worked on so far"
        : "Explore the certificates I've earned";
    },
  },
  methods: {
    getImageUrl(imageUrl) {
      const supportedFormats = ['jpg', 'png', 'gif'];
      for (let format of supportedFormats) {
        let fullPath = `/img/${imageUrl}.${format}`;
        if (this.imageExists(fullPath)) {
          return fullPath;
        }
      }
      return '';
    },
    getImageUrlPng(imageUrl) {
      const supportedFormats = ['png'];
      for (let format of supportedFormats) {
        let fullPath = `/img/${imageUrl}.${format}`;
        if (this.imageExists(fullPath)) {
          return fullPath;
        }
      }
      return '';
    },
    imageExists(url) {
      const http = new XMLHttpRequest();
      http.open('HEAD', url, false);
      http.send();
      return http.status !== 404;
    }
  }
};
</script>

<style scoped>
.fade-slide-enter-active,
.fade-slide-leave-active {
  transition: opacity 0.2s ease, transform 0.2s ease;
}

.fade-zoom-in {
  animation: fadeZoomIn 0.4s ease-in-out;
  animation-delay: 0.2s;
  animation-fill-mode: both;
}

@keyframes fadeZoomIn {
  0% {
    opacity: 0;
    transform: scale(0.5);
  }

  100% {
    opacity: 1;
    transform: scale(1);
  }
}

.tabs button {
  padding: 0.5rem 1rem;
  background: #1e1e1f;
  border: 1px solid #383838;
  border-radius: 0.375rem;
  color: #c1c1c1;
  cursor: pointer;
  transition: background 0.3s, color 0.3s;
}

.tabs button:hover {
  background: #282828;
  color: #ffffff;
}

.tabs .active-tab {
  background: #00f9ff;
  color: #1e1e1f;
  font-weight: bold;
}

.item-card {
  transition: transform 0.3s, box-shadow 0.3s;
}

.item-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
}

.item-card:hover {
  transition: transform 0.3s ease;
  transform: translateY(-8px);
}

svg:hover {
  stroke: #00f9ff;
}

@keyframes fadeZoomIn {
  0% {
    opacity: 0;
    transform: scale(0.5);
  }

  100% {
    opacity: 1;
    transform: scale(1);
  }
}

.fade-zoom-in {
  animation: fadeZoomIn 1s ease-in-out;
}

.tabs button {
  background: none;
  border: none;
  padding: 10px 20px;
  cursor: pointer;
  transition: color 0.3s ease;
}

.tabs button:hover {
  color: #00aaff;
}

.tabs button.text-white.border-b-2.border-blue-300 {
  color: #00aaff;
}

@media (max-width: 640px) {
  .tabs button.active-tab {
    background: #24c9fb;
    color: #1e1e1f;
    font-weight: bold;
  }

  .tabs button {
    color: #c1c1c1;
    background: #1e1e1f;
    border: 1px solid #383838;
  }

  .tabs button:hover {
    color: #ffffff;
    background: #282828;
  }
}
</style>
