<script setup>
import { onMounted } from "vue";
import { Modal } from "flowbite";

onMounted(() => {
  // setup available elements
  const $buttonElement = document.querySelector("#button");
  const $modalElement = document.querySelector("#modal");
  const $closeButton = document.querySelector("#closeButton");

  // set modal options
  const modalOptions = {
    backdropClasses:
      "bg-gray-900 bg-opacity-50 dark:bg-opacity-80 fixed inset-0 z-40",
  };

  // create a new modal instance
  if ($modalElement) {
    const modal = new Modal($modalElement, modalOptions);

    // set event listeners for the button to show the modal
    $buttonElement.addEventListener("click", () => modal.toggle());
    $closeButton.addEventListener("click", () => modal.hide());
  }
});
</script>

<template>
  <div id="wrapper">
    <Head>
      <Title>Cloud</Title>
    </Head>

    <div class="sidebar">
      <CloudSidebar />
    </div>

    <div
      id="modal"
      tabindex="-1"
      aria-hidden="true"
      class="fixed top-0 left-0 right-0 z-50 hidden w-full p-4 overflow-x-hidden overflow-y-auto md:inset-0 h-modal md:h-full"
    >
      <div class="relative w-full h-full max-w-2xl md:h-auto">
        <!-- Modal content -->
        <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">
          <!-- Modal header -->
          <div
            class="flex items-start justify-between p-5 border-b rounded-t dark:border-gray-600"
          >
            <h3
              class="text-xl font-semibold text-gray-900 lg:text-2xl dark:text-white"
            >
              Terms of Service
            </h3>
            <button
              id="closeButton"
              data-modal-hide="modal"
              type="button"
              class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center dark:hover:bg-gray-600 dark:hover:text-white"
            >
              <svg
                class="w-5 h-5"
                fill="currentColor"
                viewBox="0 0 20 20"
                xmlns="http://www.w3.org/2000/svg"
              >
                <path
                  fill-rule="evenodd"
                  d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                  clip-rule="evenodd"
                ></path>
              </svg>
            </button>
          </div>
          <!-- Modal body -->
          <div class="p-6 space-y-6">
            <p
              class="text-base leading-relaxed text-gray-500 dark:text-gray-400"
            >
              With less than a month to go before the European Union enacts new
              consumer privacy laws for its citizens, companies around the world
              are updating their terms of service agreements to comply.
            </p>
            <p
              class="text-base leading-relaxed text-gray-500 dark:text-gray-400"
            >
              The European Union’s General Data Protection Regulation (G.D.P.R.)
              goes into effect on May 25 and is meant to ensure a common set of
              data rights in the European Union. It requires organizations to
              notify users as soon as possible of high-risk data breaches that
              could personally affect them.
            </p>
          </div>
          <!-- Modal footer -->
          <div
            class="flex items-center p-6 space-x-2 border-t border-gray-200 rounded-b dark:border-gray-600"
          >
            <button
              type="button"
              class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800"
            >
              I accept
            </button>
            <button
              type="button"
              class="text-gray-500 bg-white hover:bg-gray-100 focus:ring-4 focus:outline-none focus:ring-blue-300 rounded-lg border border-gray-200 text-sm font-medium px-5 py-2.5 hover:text-gray-900 focus:z-10 dark:bg-gray-700 dark:text-gray-300 dark:border-gray-500 dark:hover:text-white dark:hover:bg-gray-600"
            >
              Decline
            </button>
          </div>
        </div>
      </div>
    </div>

    <div v-if="dataLoaded == true">
      <div class="p-4 sm:ml-64">
        <section class="bg-white dark:bg-gray-900">
          <div class="">
            <div
              class="flex pb-0 mb-4 rounded-t border-b sm:mb-5 dark:border-gray-600"
            >
              <h3
                class="text-2xl mb-4 font-semibold text-gray-900 dark:text-white"
              >
                Tüm Klasörler
              </h3>
            </div>
            <div class="row">
              <div class="column">
                <div class="flex items-center space-x-4">
                  <div class="flex-shrink-0">
                    <svg
                      xmlns="http://www.w3.org/2000/svg"
                      viewBox="0 0 24 24"
                      fill="currentColor"
                      class="w-6 h-6"
                    >
                      <path
                        d="M19.5 21a3 3 0 003-3v-4.5a3 3 0 00-3-3h-15a3 3 0 00-3 3V18a3 3 0 003 3h15zM1.5 10.146V6a3 3 0 013-3h5.379a2.25 2.25 0 011.59.659l2.122 2.121c.14.141.331.22.53.22H19.5a3 3 0 013 3v1.146A4.483 4.483 0 0019.5 9h-15a4.483 4.483 0 00-3 1.146z"
                      />
                    </svg>
                  </div>
                  <div class="flex-1 min-w-0">
                    <p
                      class="text-sm font-medium text-gray-900 truncate dark:text-white"
                    >
                      {{ "sa" }}
                    </p>
                    <p
                      class="text-sm text-gray-500 truncate dark:text-gray-400"
                    >
                      {{ "ba" }} tarafından oluşturuldu.
                    </p>
                  </div>
                  <div
                    class="inline-flex items-center text-base font-semibold text-gray-900 dark:text-white"
                  >
                    <button
                      id="button"
                      class="text-white bg-primary-700 hover:bg-primary-800 focus:outline-none focus:ring-4 focus:ring-primary-300 font-medium rounded-full text-sm px-5 py-2.5 text-center dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800"
                    >
                      Görüntüle
                    </button>
                  </div>
                </div>
              </div>
            </div>
            <div v-for="folder in folders" :key="folder.id">
              <br />
            </div>
          </div>
        </section>
      </div>
    </div>

    <div class="loadingScreen" v-if="dataLoaded == false">
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
</style>

<script>
export default {
  name: "Cloud",

  data() {
    return {
      folders: [],
      dataLoaded: false,
    };
  },
  mounted() {
    console.log(localStorage.theme);

    const route = useRouter();

    console.log(route);
    this.$server.get("/mcloud/data/get-folders").then((response) => {
      console.log(response.data);
      this.folders = response.data;
      this.dataLoaded = true;

      /*if (response.data.status == "INVALID_DATAS") {
        localStorage.removeItem("mail");
        localStorage.removeItem("token");
        navigateTo("/fw/login");
      } else if (response.data.status == "SUCCESS") {
        this.userData = response.data.userData;
        console.log(this.userData);
        this.dataLoaded = !this.dataLoaded;
      } else if (response.data.status == "SERVER_ERROR") {
        alert("Sunucuda hata var, daha sonra tekrar deneyiniz.");
        navigateTo("/");
      }*/
    });
  },
};
</script>
