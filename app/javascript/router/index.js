import Vue from "vue";
import Router from "vue-router";

import top from "../pages/top/index";
import help from "../pages/help/index";

Vue.use(Router)

const router = new Router({
  mode: "history",
  routes: [
    {
      path: "/",
      component: top,
      name: "top",
    },
    {
      path: "/help",
      component: help,
      name: "help",
    },
  ],
})

export default router
