<template>
  <div class="container mx-auto p-3 md:p-8 pb-20">
    <div class="flex flex-col-reverse md:flex-row relative">
      <div class="w-full">
        <div class="flex flex-col gap-4 md:px-20 fade-zoom-up">
          <article v-for="article in articles" :key="article.id" class="article-card flex flex-row md:flex-row items-start gap-4">
            <div @click="openCertificate(article.certificateLink)" class="article-link flex">
              <div class="flex-grow">
                <div class="article-date flex mb-2">
                  <div class="date-line mr-2"></div>
                  {{ article.date }}
                </div>
                <h1 class="article-title">{{ article.title }}</h1>
                <div class="article-subtitle text-sm text-gray-400 mb-3">
                  {{ article.slug }}
                </div>
                <ul class="article-desc w-full">
                  <li v-for="(point, index) in article.desc" :key="index">{{ point }}</li>
                </ul>
              </div>
              <div class="article-image-container w-full md:w-10 flex-shrink-0">
                <img :src="article.image" class="article-image w-full h-full object-cover rounded-lg" alt="Article Image">
              </div>
              <div class="flex mt-2">
                <div class="flex cursor-pointer items-end gap-2 text-primary">
                  <a v-if="article.certificateLink !== 'null'" :href="article.certificateLink" target="_blank" rel="noreferrer" title="View certificate" class="transition-all hover:text-accent">
                      <svg stroke="currentColor" fill="none" stroke-width="2" viewBox="0 0 24 24" stroke-linecap="round" stroke-linejoin="round" height="18" width="18" xmlns="http://www.w3.org/2000/svg">
                        <path d="M18 13v6a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h6"></path><polyline points="15 3 21 3 21 9"></polyline><line x1="10" y1="14" x2="21" y2="3"></line></svg>
                  </a>
              </div>
              </div>
            </div>
          </article>
        </div>
      </div>
    </div>
    <div v-if="isLoading" class="loading-overlay">
      <div class="spinner"></div>
    </div>
  </div>
</template>


<script>
export default {
  data() {
    return {
      articles: [
        {
          id: 1,
          slug: 'Machine Learning Cohort · Apprenticeship',
          date: 'Sep 2024 - Dec 2024',
          title: 'Bangkit Academy led by Google, Tokopedia, Gojek, & Traveloka',
          desc: [
            'Selected as 1 of 4,636 participants from over 45,000 applicants across Indonesia for the prestigious Bangkit 2024 Batch 2 program, endorsed by the Ministry of Education, Culture, Research, and Technology (Kemdikbudristek).',
            'Completed an intensive curriculum covering Machine Learning, Mathematics, and TensorFlow.',
            'Collaborated remotely with diverse teams to solve real-world industry projects, applying AI and data-driven solutions to practical problems.',
            'Applied data preprocessing, feature engineering, and model evaluation techniques to solve real-world business problems through capstone project development.',
            'Enhanced project management, communication, and problem-solving skills through agile development practices and weekly industry mentor sessions.'
          ],
          image: 'https://yt3.googleusercontent.com/0b3Ljhqw5VJpXwOaffzj5lwAfHHYa7fTfT32hjnZ3MMHyWu84IUfy4CTliMmY15f0k8i-wt7oA=s900-c-k-c0x00ffffff-no-rj',
          certificateLink: 'https://drive.google.com/file/d/1rVAjpCvadPMe1cuqh5AiKJ2Cz5rNp74s/view?usp=sharing'
        },
        {
          id: 2,
          slug: 'Staff Of Cadre Department · Organization',
          date: 'Jan 2023 - Dec 2023',
          title: 'Executive Board of Himatif FMIPA Unpad',
          desc: [
            'Together with the team creating a cadre concept for young Himatif members.',
            'Participated in the optimization of the regeneration process for Himatif members.',
            'Categorize the potential of Himatif members by grouping them according to their scientific fields, organizational involvement, and talent interests.',
            'Supported the development of evaluation materials to measure the effectiveness of the cadre programs and provided feedback for further improvement.'
          ],
          image: 'https://himatif.fmipa.unpad.ac.id/wp-content/uploads/2014/04/himatif.png',
          certificateLink: 'https://drive.google.com/file/d/1EGxDhiIWPSTsfIP8Mk2QfhT-SiGddz3H/view?usp=sharing'
        },
        {
          id: 3,
          slug: 'Staff Of IT Competition Division · Volunteering',
          date: 'Jul 2024 - Oct 2024',
          title: 'Informatics Festival 2024 - Himatif FMIPA Unpad',
          desc: [
            'Contributed actively to the conceptualization and design of the Data Analysis Competition (DAC) by developing competition formats, determining evaluation criteria, and preparing problem statements that aligned with current data analysis trends and industry practices.',
            'Coordinated closely with other internal divisions to ensure that the technical and operational aspects of the competition were prepared and executed seamlessly according to the event timeline.',
            'Liaised with external stakeholders, including judges, mentors, and professional data practitioners, to secure their involvement in the competition, establish competition standards, and enrich the participant experience.',
            'Successfully executed the Data Analysis Competition with a total of 171 participants from diverse academic backgrounds, contributing to the overall success and visibility of the Informatics Festival.'
          ],
          image: 'https://himatif.fmipa.unpad.ac.id/wp-content/uploads/2014/04/himatif.png',
          certificateLink: 'https://drive.google.com/file/d/1nRjhHJ4CJEiKnfiteIyJzqRiN9CU1eWV/view?usp=sharing'
        },
        {
          id: 4,
          slug: 'Staff Of Accommodation Division · Volunteering',
          date: 'Apr 2024 - Jun 2024',
          title: 'Informatics Sport & Art Game Tournaments 2024 - Himatif FMIPA Unpad',
          desc: [
            'Responsible for handling the procurement and preparation of goods and equipment needed to support the smooth running of the event, including accommodation-related necessities.',
            'Ensured the safety and comfort of all committee members and participants by coordinating logistics, transportation, and lodging arrangements throughout the event.',
            'Maintained overall order during the event by supervising venue conditions, monitoring participant flow, and promptly addressing any accommodation or logistic-related issues.',
            'Collaborated with all other divisions to ensure seamless communication and execution of event plans.'
          ],
          image: 'https://himatif.fmipa.unpad.ac.id/wp-content/uploads/2014/04/himatif.png',
          certificateLink: 'https://drive.google.com/file/d/1FIPxTwtbcgPd2uh4YpE-xDKEcHY3GjHA/view?usp=sharing'
        },
        {
          id: 5,
          slug: 'Staff Of Public Relation Division · Volunteering',
          date: 'Oct 2023 - Nov 2023',
          title: 'Informatics Fun Day 2023 - Himatif FMIPA Unpad',
          desc: [
            'Compiled a comprehensive guest list, identified key invitees including alumni, lecturers, and other stakeholders, and coordinated the distribution of formal invitations to ensure maximum attendance.',
            'Maintained effective communication with guests by providing detailed and up-to-date information regarding the event\'s schedule, location, theme, and objectives, ensuring that all inquiries were handled professionally and promptly.',
            'Utilized various media platforms such as social media, messaging apps, and official channels to promote the event, increasing awareness and engagement among potential participants.',
            'Collaborated with other divisions to synchronize promotional efforts with event timelines, ensuring consistency in messaging and branding across all communication mediums.'
          ],
          image: 'https://himatif.fmipa.unpad.ac.id/wp-content/uploads/2014/04/himatif.png',
          certificateLink: 'https://drive.google.com/file/d/1XJZEkg9GkS9RHeY733wGTDg27hT4YgZT/view?usp=sharing'
        },
        {
          id: 6,
          slug: 'Staff Of Public Relation Division · Volunteering',
          date: 'Aug 2023 - Oct 2023',
          title: 'Informatics Festival 2023 - Himatif FMIPA Unpad',
          desc: [
            'Researched, identified, and approached potential corporate sponsors, organizations, and communities to secure partnerships, sponsorships, or collaborations that would enhance the success and reach of the Informatics Festival.',
            'Built and maintained professional communication with prospective partners by crafting persuasive proposals and tailored partnership packages that aligned with their brand objectives and festival goals.',
            'Conducted consistent follow-ups with sponsors and exhibitors both during and after the event to ensure satisfaction, collect valuable feedback, and foster long-term relationships for future events or collaborations.',
            'Assisted in coordinating sponsorship agreements and ensuring that partner expectations were met, including brand exposure, booth arrangements, and promotional materials during the event.'
          ],
          image: 'https://himatif.fmipa.unpad.ac.id/wp-content/uploads/2014/04/himatif.png',
          certificateLink: 'https://drive.google.com/file/d/110NoVYy22Nq2dyNxOwsb7_A7ZR0AKcaw/view?usp=sharing'
        },
        {
          id: 7,
          slug: 'Staff Of Logistics Division · Volunteering',
          date: 'Aug 2023 - Oct 2023',
          title: 'Character Building Season 2023 - Himatif FMIPA Unpad',
          desc: [
            'Supplied all essential equipment, tools, and materials required for various events, ensuring that all logistical needs were identified, sourced, and fulfilled in a timely and cost-effective manner.',
            'Researched, evaluated, and secured appropriate venues for event activities, considering factors such as location, capacity, facilities, accessibility, and safety to ensure they met all event requirements.',
            'Coordinated and supervised venue preparation prior to event commencement, including the arrangement of seating, stage setup, signage, and technical equipment, to ensure smooth execution and readiness.',
            'Collaborated closely with all other divisions to synchronize setup schedules and resolve any on-site issues swiftly and effectively.'
          ],
          image: 'https://himatif.fmipa.unpad.ac.id/wp-content/uploads/2014/04/himatif.png',
          certificateLink: 'https://drive.google.com/file/d/1MILRGypGQNWZxsS4zCTts8zAA_OgUruD/view?usp=sharing'
        },
        {
          id: 8,
          slug: 'Staff Of Logistics Division · Volunteering',
          date: 'Oct 2022 - Nov 2022',
          title: 'Informatics Fun Day 2022 - Himatif FMIPA Unpad',
          desc: [
            'Supplied all essential equipment, tools, and materials required to support the successful execution of events, ensuring that every logistical need and technical requirement was met without delay or shortage.',
            'Conducted thorough research to identify and secure suitable venues that aligned with the event\'s objectives, capacity requirements, accessibility, safety standards, and other key logistical considerations',
            'Coordinated and supervised venue setup and preparation processes, overseeing seating arrangements, stage construction, booth installations, and technical equipment placement to ensure all aspects were ready well before the event started.',
            'Collaborated proactively with all other divisions to align venue readiness with overall event timelines and resolve unexpected challenges on-site efficiently.'
          ],
          image: 'https://himatif.fmipa.unpad.ac.id/wp-content/uploads/2014/04/himatif.png',
          certificateLink: 'https://drive.google.com/file/d/1EKS-v4-V1Gqomd6W1a4e_oI5FD1EjIAe/view?usp=sharing'
        },
      ],
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
    openCertificate(link) {
      if (link && link !== 'null') {
        window.open(link, '_blank');
      }
    
    }
  }
}
</script>


<style scoped>
.container {
  max-width: 1200px;
}
.article-card {
  background-color: #1e1e1f;
  border: 1px solid #383838;
  border-radius: 1rem;
  padding: 1.5rem;
  margin-bottom: 1rem;
  display: flex;
  transition: background-color 0.3s;
}
.article-card:hover {
  background-color: #282828;
}
.article-link {
  display: flex;
  width: 100%;
  text-decoration: none;
  color: white;
  cursor: pointer;
  overflow: visible;
  flex-direction: row;
}
.article-date {
  font-size: 0.75rem;
  margin-bottom: 0.25rem;
  color: #94a3b8;
  display: flex;
  align-items: center;
  font-style: italic;
}

.article-subtitle {
  font-size: 0.875rem;
  color: #94a3b8;
  margin-top: 0.1rem;
  margin-bottom: 0.75rem;
  display: inline-block;
  line-height: 1.3;
  letter-spacing: 0.5px;
  margin-right: 1rem;
}
.date-line {
  height: 1px;
  width: 5rem;
  background-color: #bfdbfe;
  margin-right: 0.5rem;
}
.article-title {
  font-size: 1rem;
  color: #bfdbfe;
  font-weight: bold;
  margin-bottom: 0rem;
  margin-right: 0.5rem;
}
.article-desc {
  font-size: 0.875rem;
  overflow: hidden;
  text-overflow: auto;
  text-align: left;
}
.article-desc li {
  list-style-type: disc;
  margin-left: 1.5rem;
}
.article-image-container {
  width: 5rem;
  height: 5rem;
  display: flex;
  align-items: center;
  justify-content: center;;
}
.article-image {
  border-radius: 1rem;
  width: 100%;
  height: 100%;
  object-fit: cover;
  margin-left: 4rem;
}
.fade-zoom-up {
  animation: fadeZoomUp 1s ease-in-out;
}
@keyframes fadeZoomUp {
  0% {
    opacity: 0;
    transform: scale(0.5);
  }
  100% {
    opacity: 1;
    transform: scale(1);
  }
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
svg:hover {
  stroke: #00f9ff;
}
@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}
</style>
