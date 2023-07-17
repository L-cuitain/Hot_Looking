<template>
  <RouterView :key="$route.path" />
</template>

<script>
export default {
  name: "app",
};
</script>
