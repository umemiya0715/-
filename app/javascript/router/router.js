import Vue from 'vue';
import Router from 'vue-router';
import VueGtag from 'vue-gtag';

import Top from '../pages/top.vue';
import Help from '../pages/help.vue';
import Term from '../pages/term.vue';
import PrivacyPolicy from '../pages/privacy_policy.vue';
import Result from '../pages/result.vue';
import Dragons from '../pages/dragons';
import NotFound from '../pages/shared/NotFound.vue';

Vue.use(Router)

const router = new Router({
  mode: "history",
  routes: [
    {
      path: "/",
      component: Top,
      name: "Top",
    },
    {
      path: "/help",
      component: Help,
      name: "Help",
    },
    {
      path: "/term",
      component: Term,
      name: "Term",
    },
    {
      path: "/privacypolicy",
      component: PrivacyPolicy,
      name: "PrivacyPolicy",
    },
    {
      path: "/result",
      component: Result,
      name: "Result",
    },
    {
      path: "/dragons/:id",
      component: Dragons,
      name: "Dragons",
    },
    {
      name: "NotFound",
      path: "*",
      component: NotFound,
      meta: { title: "お探しのページは見つかりませんでした" },
    },
  ],
  scrollBehavior(to, from, savedPosition){
    return { x: 0, y: 0}
  },
})

Vue.use(
  VueGtag,
  {
    config: { id: 'G-KGY5NNL00D' },
    appName: 'dratter',
    pageTrackerScreenviewEnabled: true,
  },
  router
);
router.afterEach((to, from) => {
  if (location.origin.includes('https://www.dragon-twitter-analysis.com'))
  gtag('config', 'G-KGY5NNL00D', { 'page_path': to.path });
})
export default router
