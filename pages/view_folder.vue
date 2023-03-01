<script setup>
import { onMounted } from "vue";
import { initModals } from "flowbite";

// initialize components based on data attribute selectors
onMounted(() => {
  initModals();
});
</script>

<template>
  <div id="wrapper">
    <Head>
      <Title v-if="resource.title == null">MCloud Platforms</Title>
      <Title v-if="resource.title != null">{{ resource.title }} | MCloud</Title>
    </Head>

    <div class="sidebar">
      <CloudSidebar />
    </div>

    <div v-show="dataLoaded">
      <div>
        <div class="p-4 sm:ml-64">
          <section class="bg-white dark:bg-gray-900">
            <div class="">
              <!-- Breadcrumb -->
              <nav
                class="flex px-5 py-3 text-gray-700 border border-gray-200 rounded-lg bg-gray-50 dark:bg-gray-800 dark:border-gray-700"
                aria-label="Breadcrumb"
              >
                <ol class="inline-flex items-center space-x-1 md:space-x-3">
                  <li class="inline-flex items-center">
                    <a
                      href="#"
                      class="inline-flex items-center text-sm font-medium text-gray-700 hover:text-emerald-600 dark:text-gray-400 dark:hover:text-white"
                    >
                      Genel Dosyalar
                    </a>
                  </li>
                  <li>
                    <div class="flex items-center">
                      <svg
                        aria-hidden="true"
                        class="w-6 h-6 text-gray-400"
                        fill="currentColor"
                        viewBox="0 0 20 20"
                        xmlns="http://www.w3.org/2000/svg"
                      >
                        <path
                          fill-rule="evenodd"
                          d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z"
                          clip-rule="evenodd"
                        ></path>
                      </svg>
                      <a
                        href="#"
                        class="ml-1 text-sm font-medium text-gray-700 hover:text-emerald-600 md:ml-2 dark:text-gray-400 dark:hover:text-white"
                        >Özel Erişimler</a
                      >
                    </div>
                  </li>
                  <li aria-current="page">
                    <div class="flex items-center">
                      <svg
                        aria-hidden="true"
                        class="w-6 h-6 text-gray-400"
                        fill="currentColor"
                        viewBox="0 0 20 20"
                        xmlns="http://www.w3.org/2000/svg"
                      >
                        <path
                          fill-rule="evenodd"
                          d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z"
                          clip-rule="evenodd"
                        ></path>
                      </svg>
                      <span
                        class="ml-1 text-sm font-medium text-gray-500 md:ml-2 dark:text-gray-400"
                        >{{ resource.title }}</span
                      >
                    </div>
                  </li>
                </ol>
              </nav>

              <br />

              <div class="pb-3 flex items-center">
                <label for="simple-search" class="sr-only">Search</label>
                <div class="relative w-full">
                  <div
                    class="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none"
                  >
                    <svg
                      aria-hidden="true"
                      class="w-5 h-5 text-gray-500 dark:text-gray-400"
                      fill="currentColor"
                      viewBox="0 0 20 20"
                      xmlns="http://www.w3.org/2000/svg"
                    >
                      <path
                        fill-rule="evenodd"
                        d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z"
                        clip-rule="evenodd"
                      ></path>
                    </svg>
                  </div>
                  <input
                    type="text"
                    v-model="sdata"
                    id="simple-search"
                    class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-emerald-500 focus:border-emerald-500 block w-full pl-10 p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-emerald-500 dark:focus:border-emerald-500"
                    placeholder="Bu klasörde ara.."
                    required
                  />
                </div>
                <button
                  class="p-2.5 ml-2 text-sm font-medium text-white bg-emerald-700 rounded-lg border border-emerald-700 hover:bg-emerald-800 focus:ring-4 focus:outline-none focus:ring-emerald-300 dark:bg-emerald-600 dark:hover:bg-emerald-700 dark:focus:ring-emerald-800"
                >
                  <svg
                    class="w-5 h-5"
                    fill="none"
                    stroke="currentColor"
                    viewBox="0 0 24 24"
                    xmlns="http://www.w3.org/2000/svg"
                  >
                    <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      stroke-width="2"
                      d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"
                    ></path>
                  </svg>
                  <span class="sr-only">Search</span>
                </button>
                <button
                  @click="goRefAddPage"
                  class="p-2.5 ml-2 text-sm font-medium text-white bg-emerald-700 rounded-lg border border-emerald-700 hover:bg-emerald-800 focus:ring-4 focus:outline-none focus:ring-emerald-300 dark:bg-emerald-600 dark:hover:bg-emerald-700 dark:focus:ring-emerald-800"
                >
                  <svg
                    fill="none"
                    class="w-5 h-5"
                    stroke="currentColor"
                    stroke-width="1.5"
                    viewBox="0 0 24 24"
                    xmlns="http://www.w3.org/2000/svg"
                    aria-hidden="true"
                  >
                    <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      d="M12 4.5v15m7.5-7.5h-15"
                    ></path>
                  </svg>
                  <span class="sr-only">Oluştur</span>
                </button>
              </div>

              <div class="pt-3" v-if="postsList.length > 0">
                <div
                  class="pb-1"
                  v-for="(post, index) in postsList"
                  :key="index"
                >
                  <div class="pb-2 column">
                    <div class="flex items-center space-x-4">
                      <div class="flex-shrink-0">
                        <svg
                          fill="none"
                          stroke="currentColor"
                          stroke-width="1.5"
                          viewBox="0 0 24 24"
                          class="w-6 h-6"
                          xmlns="http://www.w3.org/2000/svg"
                          aria-hidden="true"
                        >
                          <path
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            d="M19.5 14.25v-2.625a3.375 3.375 0 00-3.375-3.375h-1.5A1.125 1.125 0 0113.5 7.125v-1.5a3.375 3.375 0 00-3.375-3.375H8.25m2.25 0H5.625c-.621 0-1.125.504-1.125 1.125v17.25c0 .621.504 1.125 1.125 1.125h12.75c.621 0 1.125-.504 1.125-1.125V11.25a9 9 0 00-9-9z"
                          ></path>
                        </svg>
                      </div>
                      <div class="flex-1 min-w-0">
                        <p
                          class="text-sm font-medium text-gray-900 truncate dark:text-white"
                        >
                          <a>{{ post.name }}</a>
                        </p>
                        <p
                          class="text-sm text-base text-gray-500 truncate dark:text-gray-400"
                        >
                          {{ post.author }} tarafından
                          {{ post.udate }} tarihinde yüklendi..
                        </p>
                      </div>
                      <div
                        class="inline-flex items-center text-base font-semibold text-gray-900 dark:text-white"
                      >
                        <manage :post="post" />
                      </div>
                    </div>
                  </div>
                </div>

                <div class="pt-3">
                  <hr />
                  <span
                    class="pt-5 block text-sm text-gray-500 sm:text-center dark:text-gray-400"
                    >Toplamda
                    <a href="https://flowbite.com/" class="hover:underline">
                      {{ postsList.length }}
                    </a>
                    sonuç bulundu
                  </span>
                </div>
              </div>

              <div v-if="postsList.length == 0">
                <div class="notFound">
                  <div class="p-4 sm:ml-64">
                    <section class="bg-white dark:bg-gray-900">
                      <div class="">
                        <div role="status">
                          <svg
                            fill="none"
                            stroke="currentColor"
                            stroke-width="1.5"
                            class="inline w-10 h-10 mr-2 text-black-200 dark:text-black-600 fill-white-900"
                            viewBox="0 0 24 24"
                            xmlns="http://www.w3.org/2000/svg"
                            aria-hidden="true"
                          >
                            <path
                              stroke-linecap="round"
                              stroke-linejoin="round"
                              d="M12 3c2.755 0 5.455.232 8.083.678.533.09.917.556.917 1.096v1.044a2.25 2.25 0 01-.659 1.591l-5.432 5.432a2.25 2.25 0 00-.659 1.591v2.927a2.25 2.25 0 01-1.244 2.013L9.75 21v-6.568a2.25 2.25 0 00-.659-1.591L3.659 7.409A2.25 2.25 0 013 5.818V4.774c0-.54.384-1.006.917-1.096A48.32 48.32 0 0112 3z"
                            ></path>
                          </svg>
                          <p
                            class="pt-2 text-base text-gray-900 dark:text-white"
                          >
                            Aradığınız dosya bulunamadı
                          </p>
                        </div>
                      </div>
                    </section>
                  </div>
                </div>
              </div>
            </div>
          </section>
        </div>
      </div>
    </div>

    <div class="loadingScreen" v-show="!dataLoaded">
      <div class="p-4 sm:ml-64">
        <section class="bg-white dark:bg-gray-900">
          <div class="">
            <div role="status">
              <svg
                aria-hidden="true"
                class="inline w-10 h-10 mr-2 text-gray-200 animate-spin dark:text-gray-600 fill-primary-600"
                viewBox="0 0 100 101"
                fill="none"
                xmlns="http://www.w3.org/2000/svg"
              >
                <path
                  d="M100 50.5908C100 78.2051 77.6142 100.591 50 100.591C22.3858 100.591 0 78.2051 0 50.5908C0 22.9766 22.3858 0.59082 50 0.59082C77.6142 0.59082 100 22.9766 100 50.5908ZM9.08144 50.5908C9.08144 73.1895 27.4013 91.5094 50 91.5094C72.5987 91.5094 90.9186 73.1895 90.9186 50.5908C90.9186 27.9921 72.5987 9.67226 50 9.67226C27.4013 9.67226 9.08144 27.9921 9.08144 50.5908Z"
                  fill="currentColor"
                />
                <path
                  d="M93.9676 39.0409C96.393 38.4038 97.8624 35.9116 97.0079 33.5539C95.2932 28.8227 92.871 24.3692 89.8167 20.348C85.8452 15.1192 80.8826 10.7238 75.2124 7.41289C69.5422 4.10194 63.2754 1.94025 56.7698 1.05124C51.7666 0.367541 46.6976 0.446843 41.7345 1.27873C39.2613 1.69328 37.813 4.19778 38.4501 6.62326C39.0873 9.04874 41.5694 10.4717 44.0505 10.1071C47.8511 9.54855 51.7191 9.52689 55.5402 10.0491C60.8642 10.7766 65.9928 12.5457 70.6331 15.2552C75.2735 17.9648 79.3347 21.5619 82.5849 25.841C84.9175 28.9121 86.7997 32.2913 88.1811 35.8758C89.083 38.2158 91.5421 39.6781 93.9676 39.0409Z"
                  fill="currentFill"
                />
              </svg>
              <span class="sr-only">Loading...</span>
            </div>
          </div>
        </section>
      </div>
    </div>
  </div>
</template>

<style>
.wrapper {
  height: 100%;
}

.loadingScreen {
  position: absolute;
  top: 50%;
  left: 50%;
  margin-right: -50%;
  transform: translate(-50%, -50%);
  text-align: center;
}

.notFound {
  position: absolute;
  top: 50%;
  left: 50%;
  margin-top: 3%;
  transform: translate(-50%, -50%);
  text-align: center;
}
</style>

<script>
export default {
  name: "Viewer",

  data() {
    return {
      dataLoaded: false,
      sdata: "",
      resource: {
        title: null,
      },
      posts: [],
      writeUname: null,
      writePass: null,
      writeName: null,
      writeRSS: null,
    };
  },
  computed: {
    postsList() {
      if (this.sdata.trim().length > 0) {
        return this.posts.filter((post) =>
          post.name.toLowerCase().includes(this.sdata.trim().toLowerCase())
        );
      }

      return this.posts;
    },
  },
  beforeMount() {
    let request = {
      sid: this.$route.query.sid,
      key: this.$route.query.key,
    };

    this.$server.post("/mcloud/data/get-files", request).then((response) => {
      if (response.data.status == "KEY_NOT_MATCH") {
        alert("mdev.mdkn.createCloudErrorHandler.. !(data): \n\nKEY_NOT_MATCH");
      } else if (response.data.status == "SERVER_ERROR") {
        alert(
          "mdev.mdkn.createCloudErrorHandler.. !(data): \n\nSunucuda hata var, sonra tekrar deneyiniz."
        );
      } else if (response.data.status == "SUCCESS") {
        this.resource.title = response.data.title;
        this.posts = response.data.docs;
        this.dataLoaded = true;
      } else if (response.data.status == "FOLDER_NOT_FOUND") {
        alert(
          "mdev.mdkn.createCloudErrorHandler.. !(data): \n\nBöyle bir dizin yok."
        );
      }
    });
  },
  methods: {
    goRefAddPage() {
      this.$router.push({
        path: "/add_referance",
        query: { sid: this.$route.query.sid, key: this.$route.query.key },
      });
    },
  },
};
</script>
