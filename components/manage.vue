<script setup>
import { onMounted } from "vue";
import { initModals } from "flowbite";

// initialize components based on data attribute selectors
onMounted(() => {
  initModals();
});
</script>

<template>
  <button
    class="text-white bg-primary-700 hover:bg-primary-800 focus:outline-none focus:ring-4 focus:ring-primary-300 font-medium rounded-full text-sm px-5 py-2.5 text-center dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800"
    @click="openFile"
  >
    Aç
  </button>
</template>

<script>
export default {
  props: ["post"],
  methods: {
    openFile() {
      window.open(this.post.rss, "_blank", "noreferrer");
    },
  },
};
</script>
