<template>
    <div id="wrapper">
        <Head>
        <Title>Cloud</Title>
      </Head>
    <CloudSidebar />



    <div class="p-4 sm:ml-64">
      <section class="bg-white dark:bg-gray-900">
        <div class="">
          <div
              class="flex pb-0 mb-4 rounded-t border-b sm:mb-5 dark:border-gray-600"
            >
              <h3
                class="text-2xl mb-4 font-semibold text-gray-900 dark:text-white"
              >
                /root/files
              </h3>
            </div>

          <div class="row">
  <div class="column">
    <div class="flex items-center space-x-4">
  <div class="flex-shrink-0">
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="w-6 h-6">
<path d="M19.5 21a3 3 0 003-3v-4.5a3 3 0 00-3-3h-15a3 3 0 00-3 3V18a3 3 0 003 3h15zM1.5 10.146V6a3 3 0 013-3h5.379a2.25 2.25 0 011.59.659l2.122 2.121c.14.141.331.22.53.22H19.5a3 3 0 013 3v1.146A4.483 4.483 0 0019.5 9h-15a4.483 4.483 0 00-3 1.146z" />
</svg>

  </div>
  <div class="flex-1 min-w-0">
      <p class="text-sm font-medium text-gray-900 truncate dark:text-white">
          Deneme I
      </p>
      <p class="text-sm text-gray-500 truncate dark:text-gray-400">
          mamiiblt tarafından oluşturuldu.    
      </p>
  </div>
  <div class="inline-flex items-center text-base font-semibold text-gray-900 dark:text-white">
      <button type="button" class="text-white bg-primary-700 hover:bg-primary-800 focus:outline-none focus:ring-4 focus:ring-primary-300 font-medium rounded-full text-sm px-5 py-2.5 text-center  dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800">Gözetle</button>
  </div>
</div>
  </div>
</div>
        </div>
      </section>
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
        folders: [
            {
                "id": 1,
                "name": "flashoyun",
                "author": "mamiiblt",
                "sid": "general.flashoyun.data"
            }
        ]
    };
  },
  mounted() {
    /* THEME APPLY */
    /*if (
      localStorage.theme === "dark" ||
      (!("theme" in localStorage) &&
        window.matchMedia("(prefers-color-scheme: dark)").matches)
    ) {
      document.documentElement.classList.add("dark");
    } else {
      document.documentElement.classList.remove("dark");
    }*/

    const route = useRouter();

    let request = {
      email: localStorage.getItem("mail"),
      token: localStorage.getItem("token"),
    };

    console.log(route);
    this.$server
      .post("/mcloud/data/comtal/get-flash-games", request)
      .then((response) => {
        console.log(response.data);

        if (response.data.status == "INVALID_DATAS") {
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
        }
      });
  },
  methods: {
    updateUserData() {
      let request = {
        pass: this.updatePassword,
        newData: this.userData,
        mail: localStorage.getItem("mail"),
      };

      axios;
      this.$server
        .post(
          "http://localhost:3333/mnet/user/profile/update-user-data",
          request
        )
        .then((response) => {
          console.log(response);
        });
    },
  },
};
</script>