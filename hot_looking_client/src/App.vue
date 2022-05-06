<template>
  <RouterView :key="$route.fullPath" />
</template>

<script>
export default {
  name: "app",
};
</script>
