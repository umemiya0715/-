import Vue from "vue";
import Router from "vue-router";

import TopPage from "../pages/top";

Vue.use(Router)

const router = new Router({
  mode: "history",
  routes: [
    {
      path: "/",
      component: TopPage,
      name: "TopPage",
    },
  ],
})

export default router
